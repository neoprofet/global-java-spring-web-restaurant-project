package com.neoprofet.restaurant.repositories;

import com.neoprofet.restaurant.entities.Ingredient;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository interface for the Ingredient entity, extending CrudRepository.
 * Provides CRUD operations for managing Ingredient entities in the database.
 */
public interface IngredientRepo extends CrudRepository<Ingredient, Long> {
}
