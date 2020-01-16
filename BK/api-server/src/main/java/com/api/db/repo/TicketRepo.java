/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.repo;

import com.api.db.entity.Ticket;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Thuong
 */
public interface TicketRepo extends JpaRepository<Ticket, Integer> {

    List<Ticket> findByScheduleId(Integer scheduleId);

    Optional<Ticket> findByScheduleIdEqualsAndSeatIdEquals(Integer scheduleId, Integer seatId);
}
