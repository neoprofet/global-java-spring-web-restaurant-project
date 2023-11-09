package com.neoprofet.restaurant.repositories;

import com.neoprofet.restaurant.entities.Product;
import com.neoprofet.restaurant.entities.ProductCategory;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository interface for the Product entity, extending CrudRepository.
 * Provides CRUD operations for managing Product entities in the database.
 */

public interface ProductRepo extends CrudRepository<Product, Long> {

    /**
     * Retrieves all products belonging to a specific product category.
     *
     * @param productCategory The product category to filter products.
     * @return An Iterable containing the products belonging to the specified category.
     */
    Iterable<Product> findAllByCategory (ProductCategory productCategory);
}
