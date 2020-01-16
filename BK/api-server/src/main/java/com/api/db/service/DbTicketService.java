/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.Ticket;
import com.api.db.repo.MovieRepo;
import com.api.db.repo.ScheduleRepo;
import com.api.db.repo.TicketRepo;
import static com.api.db.service.DbMovieService.logger;
import com.api.response.UserGetTicketResponse;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class DbTicketService {

    public static final Logger logger = Logger.getLogger(DbTicketService.class);
    @Autowired
    MovieRepo movieRepo;
    @Autowired
    ScheduleRepo scheduleRepo;
    @Autowired
    TicketRepo ticketRepo;
    @PersistenceContext
    EntityManager entityManager;

    public List<UserGetTicketResponse> getAllTicket() {

        List<UserGetTicketResponse> result = new ArrayList<>();
        Session session = entityManager.unwrap(Session.class);
        if (session == null) {
            logger.error("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List<Object[]> resultQuery = session
                    .createNativeQuery("CALL admin_get_all_ticket()")
                    //                    .setParameter("userId", userId)
                    .getResultList();
            tx.commit();
            resultQuery.forEach((data) -> {
                UserGetTicketResponse ticket = new UserGetTicketResponse();
                if (ticket.parseData(data)) {
                    result.add(ticket);
                }
            });
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }

    public Map<Integer, Ticket> listTicketBySchedule(Integer scheduleId) {
        Map<Integer, Ticket> result = new HashMap<>();
        List<Ticket> lstTicket = ticketRepo.findByScheduleId(scheduleId);
        if (lstTicket != null) {
            lstTicket.forEach((data) -> {
                result.put(data.seatId, data);
            });
        }
        return result;
    }

    public Ticket findBySeatIdAndScheduleId(Integer seatId, Integer scheduleId) {
        if (NumberHelper.IntegerIsEmpty(seatId) || NumberHelper.IntegerIsEmpty(scheduleId)) {
            return null;
        }
        Optional<Ticket> data = ticketRepo.findByScheduleIdEqualsAndSeatIdEquals(scheduleId, seatId);
        if (data.isPresent()) {
            return data.get();
        }
        return null;
    }
    
    public Ticket getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        Optional<Ticket> result = ticketRepo.findById(id);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }

    public Ticket save(Ticket data) {
        return ticketRepo.save(data);
    }

    public List<Ticket> save(List<Ticket> data) {
        if (data.isEmpty()) {
            return null;
        }
        Session session = entityManager.unwrap(Session.class);
        if (session == null) {
            logger.error("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            for (Ticket ticket : data) {
                session.save(ticket);
            }
            tx.commit();
            return data;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            if (tx != null) {
                tx.rollback();
            }
            return null;
        }
    }

    public List<UserGetTicketResponse> getHistory(Integer userId) {
        List<UserGetTicketResponse> result = new ArrayList<>();
        if (NumberHelper.IntegerIsEmpty(userId)) {
            return result;
        }
        Session session = entityManager.unwrap(Session.class);
        if (session == null) {
            logger.error("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List<Object[]> resultQuery = session
                    .createNativeQuery("CALL user_get_ticket_history(:userId)")
                    .setParameter("userId", userId)
                    .getResultList();
            tx.commit();
            resultQuery.forEach((data) -> {
                UserGetTicketResponse ticket = new UserGetTicketResponse();
                if (ticket.parseData(data)) {
                    result.add(ticket);
                }
            });
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }

    public List<UserGetTicketResponse> getByCode(String code) {
        List<UserGetTicketResponse> result = new ArrayList<>();
        if (StringHelper.IsEmpty(code)) {
            return result;
        }
        Session session = entityManager.unwrap(Session.class);
        if (session == null) {
            logger.error("Can not get session!");
            return null;
        }
        Transaction tx = null;
        try {
            if (code == null) {
                code = "";
            }
            tx = session.beginTransaction();
            List<Object[]> resultQuery = session
                    .createNativeQuery("CALL admin_search_ticket(:code)")
                    .setParameter("code", "%" + code + "%")
                    .getResultList();
            tx.commit();
            resultQuery.forEach((data) -> {
                UserGetTicketResponse ticket = new UserGetTicketResponse();
                if (ticket.parseData(data)) {
                    result.add(ticket);
                }
            });
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }

}
