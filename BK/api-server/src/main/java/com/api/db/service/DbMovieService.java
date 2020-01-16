/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.EventAdv;
import com.api.db.entity.Movie;
import com.api.db.repo.MovieRepo;
import com.api.request.GetMovieFreeSlideRequest;
import com.api.request.SearchMovieRequest;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class DbMovieService {

    public static final Logger logger = Logger.getLogger(DbMovieService.class);
    @Autowired
    MovieRepo repo;
    @PersistenceContext
    EntityManager entityManager;

    public List<Movie> search(SearchMovieRequest request) {
        Session session = entityManager.unwrap(Session.class);
        List<Movie> result = new ArrayList<>();
        if (session == null) {
            logger.debug("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Movie> criteria = cb.createQuery(Movie.class);
            Root<Movie> root = criteria.from(Movie.class);
            List<Predicate> lstFilterParam = new ArrayList<>();
            if (!StringHelper.IsEmpty(request.getName())) {
                lstFilterParam.add(cb.like(root.<String>get("name"), "%" + request.getName() + "%"));
            }

            if (!StringHelper.IsEmpty(request.getNation())) {
                lstFilterParam.add(cb.like(root.<String>get("nation"), "%" + request.getNation() + "%"));
            }

            if (!NumberHelper.IntegerIsEmpty(request.getCategoryId())) {
                lstFilterParam.add(cb.equal(root.<Integer>get("categoryId"), request.getCategoryId()));
            }
            if (!StringHelper.IsEmpty(request.getLanguage())) {
                lstFilterParam.add(cb.like(root.<String>get("language"), "%" + request.getLanguage() + "%"));
            }

            if (!NumberHelper.IntegerIsEmpty(request.getAge())) {
                lstFilterParam.add(cb.equal(root.<Integer>get("age"), request.getAge()));
            }

            criteria.select(root)
                    .where(lstFilterParam.toArray(new Predicate[]{}))
                    .orderBy(cb.desc(root.get("id")));
            Query<Movie> query = session.createQuery(criteria)
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

    public Movie getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        Movie result = null;
        try {
            Optional<Movie> qery = repo.findById(id);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public boolean save(Movie data) {
        if (repo.save(data) != null) {
            return true;
        }
        return false;
    }

    public void delete(Movie data) {
        repo.delete(data);
    }

    public List<Movie> getListComing() {
        return repo.listComming();
    }

    public List<Movie> listShowing() {
        return repo.listShowing();
    }

    public List<Movie> getByListId(List<Integer> lstId) {
        return repo.findAllById(lstId);
    }

    public Map<Integer, Movie> getByListEvent(List<EventAdv> lstEvent) {
        Map<Integer, Movie> result = new HashMap<>();
        if (lstEvent == null || lstEvent.isEmpty()) {
            return result;
        }
        List<Integer> lstId = new ArrayList<>();
        lstEvent.forEach((data) -> {
            lstId.add(data.movieId);
        });
        if (lstId.size() > 0) {
            List<Movie> lstMovie = repo.findByIdIn(lstId);
            lstMovie.forEach((data) -> {
                result.put(data.id, data);
            });
        }
        return result;
    }

    public List<Movie> getListSlideFree(GetMovieFreeSlideRequest request, List<Integer> lstMovieUsed) {
        Session session = entityManager.unwrap(Session.class);
        List<Movie> result = new ArrayList<>();
        if (session == null) {
            logger.debug("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Movie> criteria = cb.createQuery(Movie.class);
            Root<Movie> root = criteria.from(Movie.class);
            List<Predicate> lstFilterParam = new ArrayList<>();
            if (!StringHelper.IsEmpty(request.getName())) {
                lstFilterParam.add(cb.like(root.<String>get("name"), "%" + request.getName() + "%"));
            }

            if (!StringHelper.IsEmpty(request.getNation())) {
                lstFilterParam.add(cb.like(root.<String>get("nation"), "%" + request.getNation() + "%"));
            }

            if (request.getReleaseDate() != null) {
                lstFilterParam.add(cb.greaterThan(root.<Timestamp>get("releaseDate"), request.getReleaseDate()));
            }

            if (!lstMovieUsed.isEmpty()) {
                lstFilterParam.add(cb.and(root.get("id").in(lstMovieUsed).not()));
            }
            criteria.select(root)
                    .where(lstFilterParam.toArray(new Predicate[]{}))
                    .orderBy(cb.desc(root.get("id")));
            Query<Movie> query = session.createQuery(criteria)
                    .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            query.setFirstResult(request.getOffset());
            query.setMaxResults(request.getLimit());
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

    public Integer countPatientByPidPhoneMail(GetMovieFreeSlideRequest request, List<Integer> lstMovieUsed) {
        Session session = entityManager.unwrap(Session.class);
        int result = 0;
        if (session == null) {
            logger.error("Can not open session!");
            return result;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Long> criteria = cb.createQuery(Long.class);
            Root<Movie> root = criteria.from(Movie.class);
            List<Predicate> lstFilterParam = new ArrayList<>();

            if (!StringHelper.IsEmpty(request.getName())) {
                lstFilterParam.add(cb.like(root.<String>get("name"), "%" + request.getName() + "%"));
            }

            if (!StringHelper.IsEmpty(request.getNation())) {
                lstFilterParam.add(cb.like(root.<String>get("nation"), "%" + request.getNation() + "%"));
            }

            if (request.getReleaseDate() != null) {
                lstFilterParam.add(cb.greaterThan(root.<Timestamp>get("releaseDate"), request.getReleaseDate()));
            }

            if (!lstMovieUsed.isEmpty()) {
                lstFilterParam.add(cb.and(root.get("id").in(lstMovieUsed).not()));
            }

            criteria.select(cb.count(root)).where(lstFilterParam.toArray(new Predicate[]{}));
            Query<Long> query = session.createQuery(criteria);
            List<Long> total = query.getResultList();
            result = total.get(0).intValue();
            tx.commit();
        } catch (Exception e) {
            logger.error("Exception: " + e.toString());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }

}
