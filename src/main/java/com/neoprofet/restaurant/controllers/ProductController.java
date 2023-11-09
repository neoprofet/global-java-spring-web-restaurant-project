package com.neoprofet.restaurant.controllers;

import com.neoprofet.restaurant.entities.Product;
import com.neoprofet.restaurant.repositories.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Controller class for handling product (dish) information.
 */
@Controller
public class ProductController {

    @Autowired
    private ProductRepo productRepo;

    /**
     * Get product information controller (unique product seperated page).
     *
     * @param id    The ID of the product to retrieve information.
     * @param model The model to which the product data is added.
     * @return The view name for the product information page.
     */
    @GetMapping("/product/{id}")
    public String getProductInfo(@PathVariable("id") Long id, Model model) {
        List<Product> container = new ArrayList<>();
        Optional<Product> productOptional = productRepo.findById(id);
        if (productOptional.isEmpty()) return "redirect:/";
        else {
            container.add(productOptional.get());
            model.addAttribute("container", container);
            return "product-info";
        }
    }
}
