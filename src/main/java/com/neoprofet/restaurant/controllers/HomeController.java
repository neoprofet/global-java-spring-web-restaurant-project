package com.neoprofet.restaurant.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller class for handling home-related requests.
 * This is the main controller
 */
@Controller
public class HomeController {

    /**
     * Handles the GET request for the home page ("/").
     * This is the main page of the web-service
     *
     * @return the logical view name for rendering the home page
     */
    @GetMapping("/")
    public String home() {
        return "home";
    }
}
