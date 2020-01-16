/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.Movie;
import com.api.db.entity.News;
import com.api.db.repo.NewsRepo;
import static com.api.db.service.DbMovieService.logger;
import com.api.request.SearchNewsRequest;
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
public class DbNewsService {

    @PersistenceContext
    EntityManager entityManager;
    @Autowired
    NewsRepo newsRepo;

    public List<News> findListNews() {
        return newsRepo.findAllByOrderByCreateAdDesc();
    }

    public News save(News data) {
        return newsRepo.save(data);
    }

    public void delete(News data) {
        newsRepo.delete(data);
    }

    public News getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        Optional<News> result = newsRepo.findById(id);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }

    public List<News> search(SearchNewsRequest request) {
        Session session = entityManager.unwrap(Session.class);
        List<News> result = new ArrayList<>();
        if (session == null) {
            logger.debug("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<News> criteria = cb.createQuery(News.class);
            Root<News> root = criteria.from(News.class);
            List<Predicate> lstFilterParam = new ArrayList<>();
            if (!StringHelper.IsEmpty(request.getTitle())) {
                lstFilterParam.add(cb.like(root.<String>get("title"), "%" + request.getTitle() + "%"));
            }

            if (!StringHelper.IsEmpty(request.getContent())) {
                lstFilterParam.add(cb.like(root.<String>get("content"), "%" + request.getContent() + "%"));
            }

            if (!NumberHelper.IntegerIsEmpty(request.getMove_id())) {
                lstFilterParam.add(cb.equal(root.<Integer>get("move_id"), request.getMove_id()));
            }
            if (!NumberHelper.IntegerIsEmpty(request.getType())) {
                lstFilterParam.add(cb.equal(root.<Integer>get("type"), request.getType()));
            }

            criteria.select(root)
                    .where(lstFilterParam.toArray(new Predicate[]{}))
                    .orderBy(cb.desc(root.get("createAd")));
            Query<News> query = session.createQuery(criteria)
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
