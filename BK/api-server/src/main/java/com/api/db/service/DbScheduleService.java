/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.Movie;
import com.api.db.entity.Schedule;
import com.api.db.repo.MovieRepo;
import com.api.db.repo.ScheduleRepo;
import static com.api.db.service.DbTicketService.logger;
import com.api.request.SearchScheduleRequest;
import com.api.response.UserGetTicketResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class DbScheduleService {

    public static final Logger logger = Logger.getLogger(DbScheduleService.class);
    @Autowired
    MovieRepo movieRepo;
    @Autowired
    ScheduleRepo scheduleRepo;
    @PersistenceContext
    EntityManager entityManager;

    public List<Schedule> getListScheduleByMovieId(Integer movieId) {
        return scheduleRepo.findByMovieIdAndStartTimeGreaterThan(movieId, DateTimeHelper.getCurrentTimestamp());
    }

    public Schedule getScheduleToCheckSeat(Integer scheduleId) {
        Optional<Schedule> data = scheduleRepo.findByIdEqualsAndStartTimeGreaterThan(scheduleId, DateTimeHelper.getCurrentTimestamp());
        if (data.isPresent()) {
            return data.get();
        }
        return null;
    }

    public Schedule getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        Schedule result = null;
        try {
            Optional<Schedule> qery = scheduleRepo.findById(id);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public Schedule save(Schedule data) {
        try {
            Schedule result = scheduleRepo.save(data);
            return result;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return null;
    }

    public void delete(Schedule data) {
        scheduleRepo.delete(data);
    }

    public List<Schedule> search(SearchScheduleRequest request) {
        List<Schedule> result = new ArrayList<>();

        Session session = entityManager.unwrap(Session.class);
        if (session == null) {
            logger.error("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Schedule> criteria = cb.createQuery(Schedule.class);
            Root<Schedule> rootSchedule = criteria.from(Schedule.class);
            Join<Schedule, Movie> movJoin = rootSchedule.join("movie");
            List<Predicate> lstFilterParam = new ArrayList<>();
            if (!NumberHelper.IntegerIsEmpty(request.getRoomId())) {
                lstFilterParam.add(cb.equal(rootSchedule.<Integer>get("roomId"), request.getRoomId()));
            }

            if (!StringHelper.IsEmpty(request.getMovieName())) {
                lstFilterParam.add(cb.like(movJoin.get("name"), "%" + request.getMovieName() + "%"));
            }

            criteria.select(rootSchedule)
                    .where(lstFilterParam.toArray(new Predicate[]{}))
                    .orderBy(cb.desc(rootSchedule.get("id")));
            Query<Schedule> query = session.createQuery(criteria)
                    .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//            query.setFirstResult(request.getOffset());
//            query.setMaxResults(request.getLimit());
            result = query.getResultList();
            tx.commit();

        } catch (Exception ex) {
            logger.error(ex.getMessage());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }
}
