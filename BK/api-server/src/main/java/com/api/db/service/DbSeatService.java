/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.Seat;
import com.api.db.entity.Seat;
import com.api.db.repo.MovieRepo;
import com.api.db.repo.ScheduleRepo;
import com.api.db.repo.SeatRepo;
import com.api.db.repo.TicketRepo;
import static com.api.db.service.DbMovieService.logger;
import com.api.request.SearchSeatRequest;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class DbSeatService {

    public static final Logger logger = Logger.getLogger(DbSeatService.class);
    @Autowired
    MovieRepo movieRepo;
    @Autowired
    ScheduleRepo scheduleRepo;
    @Autowired
    TicketRepo ticketRepo;
    @Autowired
    SeatRepo seatRepo;
    @PersistenceContext
    EntityManager entityManager;

    public List<Seat> listSeatInRoom(Integer roomId) {
        return seatRepo.findByRoomId(roomId);
    }

    public Seat save(Seat data) {
        return seatRepo.save(data);
    }

    public void delete(Seat data) {
        seatRepo.delete(data);
    }

    public Seat getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        Optional<Seat> result = seatRepo.findById(id);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }

    public List<Seat> search(SearchSeatRequest request) {
        Session session = entityManager.unwrap(Session.class);
        List<Seat> result = new ArrayList<>();
        if (session == null) {
            logger.debug("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Seat> criteria = cb.createQuery(Seat.class);
            Root<Seat> root = criteria.from(Seat.class);
            List<Predicate> lstFilterParam = new ArrayList<>();
            if (!StringHelper.IsEmpty(request.name)) {
                lstFilterParam.add(cb.like(root.<String>get("name"), "%" + request.name + "%"));
            }

            if (!NumberHelper.IntegerIsEmpty(request.row)) {
                lstFilterParam.add(cb.equal(root.<Integer>get("row"), request.row));
            }
            if (!NumberHelper.IntegerIsEmpty(request.roomId)) {
                lstFilterParam.add(cb.equal(root.<Integer>get("roomId"), request.roomId));
            }

            criteria.select(root)
                    .where(lstFilterParam.toArray(new Predicate[]{}))
                    .orderBy(cb.desc(root.get("seatId")));
            Query<Seat> query = session.createQuery(criteria)
                    .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//            query.setFirstResult(request.getOffset());
//            query.setMaxResults(request.getLimit());
            result = query.getResultList();
            tx.commit();

        } catch (Exception e) {
            System.out.println("Exception: " + e.toString());
            logger.debug("Exception: " + e.toString());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }
}
