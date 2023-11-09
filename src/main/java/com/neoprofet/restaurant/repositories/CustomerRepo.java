package com.neoprofet.restaurant.repositories;

import com.neoprofet.restaurant.entities.Customer;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

/**
 * Repository interface for the Customer entity, extending CrudRepository.
 * Provides CRUD operations for managing Customer entities in the database.
 */
public interface CustomerRepo extends CrudRepository<Customer,Long> {

    /**
     * Retrieves a customer by phone number.
     *
     * @param phone The phone number to search for.
     * @return An Optional containing the found customer or an empty Optional if not found.
     */
    Optional<Customer> findByPhone(String phone);
}
