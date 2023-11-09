package com.neoprofet.restaurant.services;

import com.neoprofet.restaurant.entities.Product;
import com.neoprofet.restaurant.repositories.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Service class for managing Product entities.
 */
@Service
public class ProductService {
    @Autowired
    private ProductRepo productRepo;

    /**
     * Calculates the total price of a list of products.
     *
     * @param products The list of products for which to calculate the total price.
     * @return The total price of the products.
     */
    public BigDecimal getTotalPriceOfProductList(Iterable<Product> products){
        BigDecimal result = BigDecimal.ZERO;
        for (Product product : products) {
           result = result.add(product.getPrice());
        }
        return result;
    }

    /**
     * Retrieves a list of products based on an array of product IDs.
     *
     * @param productIdArray An array of product IDs.
     * @return The list of products corresponding to the provided IDs.
     */
    public List<Product> getListOfProductsFromArrayOfIds(Long[] productIdArray){
        List<Product> products = new ArrayList<>();
        for (Long id : productIdArray) {
            Optional<Product> productOptional = productRepo.findById(id);
            productOptional.ifPresent(products::add);
        }
        return products;
    }
}
