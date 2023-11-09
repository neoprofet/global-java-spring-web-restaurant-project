package com.neoprofet.restaurant.repositories;

import com.neoprofet.restaurant.entities.Order;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository interface for the Order entity, extending CrudRepository.
 * Provides CRUD operations for managing Order entities in the database.
 */
public interface OrderRepo extends CrudRepository<Order,Long> {
}
