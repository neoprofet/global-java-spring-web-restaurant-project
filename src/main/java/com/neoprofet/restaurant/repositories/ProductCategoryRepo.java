package com.neoprofet.restaurant.repositories;

import com.neoprofet.restaurant.entities.ProductCategory;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository interface for the ProductCategory entity, extending CrudRepository.
 * Provides CRUD operations for managing ProductCategory entities in the database.
 */
public interface ProductCategoryRepo extends CrudRepository<ProductCategory, Long> {
}
