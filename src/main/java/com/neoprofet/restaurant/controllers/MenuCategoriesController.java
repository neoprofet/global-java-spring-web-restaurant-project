package com.neoprofet.restaurant.controllers;

import com.neoprofet.restaurant.entities.Product;
import com.neoprofet.restaurant.repositories.ProductCategoryRepo;
import com.neoprofet.restaurant.repositories.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller class for handling menu categories and retrieving related product lists.
 * For pages:
 * Salads (page) [GET]
 * Soups (page) [GET]
 * Desserts (page) [GET]
 * Main dishes (page) [GET]
 * Burgers (page) [GET]
 * Starters (page) [GET]
 * Steaks (page) [GET]
 * Alcoholic drinks (page) [GET]
 * Non-alcoholic drinks (page) [GET]
 */
@Controller
public class MenuCategoriesController {

    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ProductCategoryRepo productCategoryRepo;

    /**
     * Get salads page controller.
     *
     * @param model The model to which the SALADS list is added.
     * @return The view name for the salads list page.
     */
    @GetMapping("/salads")
    public String getSaladsPage(Model model) {
        Iterable<Product> salads = productRepo.
                findAllByCategory(productCategoryRepo.findById(1L).get());
        model.addAttribute("salads", salads);
        return "salads";
    }

    /**
     * Get soups page controller.
     *
     * @param model The model to which the SOUPS list is added.
     * @return The view name for the soups page.
     */
    @GetMapping("/soups")
    public String getSoupsPage(Model model) {
        Iterable<Product> soups = productRepo.
                findAllByCategory(productCategoryRepo.findById(2L).get());
        model.addAttribute("soups", soups);
        return "soups";
    }

    /**
     * Get desserts page controller.
     *
     * @param model The model to which the DESSERTS list is added.
     * @return The view name for the desserts page.
     */
    @GetMapping("/desserts")
    public String getDesserts(Model model) {
        Iterable<Product> desserts = productRepo.
                findAllByCategory(productCategoryRepo.findById(3L).get());
        model.addAttribute("desserts", desserts);
        return "desserts";
    }

    /**
     * Get main dishes page controller.
     *
     * @param model The model to which the MAIN DISHES list is added.
     * @return The view name for the main dishes page.
     */
    @GetMapping("/mains")
    public String getMainDishesPage(Model model) {
        Iterable<Product> mainDishes = productRepo.
                findAllByCategory(productCategoryRepo.findById(4L).get());
        model.addAttribute("mainDishes", mainDishes);
        return "mains";
    }

    /**
     * Get starters page controller.
     *
     * @param model The model to which the STARTERS list is added.
     * @return The view name for the starters page.
     */
    @GetMapping("/starters")
    public String getStartersPage(Model model) {
        Iterable<Product> starters = productRepo.
                findAllByCategory(productCategoryRepo.findById(5L).get());
        model.addAttribute("starters", starters);
        return "starters";
    }

    /**
     * Get burgers page controller.
     *
     * @param model The model to which the BURGERS list is added.
     * @return The view name for the burgers page.
     */
    @GetMapping("/burgers")
    public String getBurgersPage(Model model) {
        Iterable<Product> burgers = productRepo.
                findAllByCategory(productCategoryRepo.findById(6L).get());
        model.addAttribute("burgers", burgers);
        return "burgers";
    }

    /**
     * Get steaks page controller.
     *
     * @param model The model to which the STEAKS list is added.
     * @return The view name for the steaks page.
     */
    @GetMapping("/steaks")
    public String getSteaksPage(Model model) {
        Iterable<Product> steaks = productRepo.
                findAllByCategory(productCategoryRepo.findById(7L).get());
        model.addAttribute("steaks", steaks);
        return "steaks";
    }

    /**
     * Get alcoholic beverages page controller.
     *
     * @param model The model to which the ALCOHOLIC BEVERAGES list is added.
     * @return The view name for the alcoholic beverages page.
     */
    @GetMapping("/alcoholic-beverages")
    public String getAlcoholicBeveragesPage(Model model) {
        Iterable<Product> alcoholicBeverages = productRepo.
                findAllByCategory(productCategoryRepo.findById(8L).get());
        model.addAttribute("alcoholicBeverages", alcoholicBeverages);
        return "alcoholic-beverages";
    }

    /**
     * Get non-alcoholic beverages page controller.
     *
     * @param model The model to which the NON-ALCOHOLIC BEVERAGES list is added.
     * @return The view name for the non-alcoholic beverages page.
     */
    @GetMapping("/non-alcoholic-beverages")
    public String getNonAlcoholicBeveragesPage(Model model) {
        Iterable<Product> nonAlcoholicBeverages = productRepo.
                findAllByCategory(productCategoryRepo.findById(9L).get());
        model.addAttribute("nonAlcoholicBeverages", nonAlcoholicBeverages);
        return "non-alcoholic-beverages";
    }
}
