package com.neoprofet.restaurant.controllers;

import com.neoprofet.restaurant.entities.Customer;
import com.neoprofet.restaurant.entities.Order;
import com.neoprofet.restaurant.entities.Product;
import com.neoprofet.restaurant.repositories.OrderRepo;
import com.neoprofet.restaurant.repositories.ProductCategoryRepo;
import com.neoprofet.restaurant.repositories.ProductRepo;
import com.neoprofet.restaurant.services.CustomerService;
import com.neoprofet.restaurant.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Controller class for handling orders
 */
@Controller
public class OrderController {

    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ProductCategoryRepo categoryRepo;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private ProductService productService;

    /**
     * Get orders list page controller.
     *
     * @param model The model to which the list of orders is added.
     * @return The view name for the orders list page.
     */
    @GetMapping("/orders")
    public String getOrdersPage(Model model) {
        model.addAttribute("orders", orderRepo.findAll());
        return "orders";
    }

    /**
     * Get add-order page controller.
     *
     * @param model The model to which product categories are added.
     * @return The view name for the add-order page.
     */
    @GetMapping("/orders/add")
    private String addOrderPage(Model model) {

        // Adding products by categories to the models (to make a product selection form)
        model.addAttribute("salads",
                productRepo.findAllByCategory(categoryRepo.findById(1L).get()));

        model.addAttribute("soups",
                productRepo.findAllByCategory(categoryRepo.findById(2L).get()));

        model.addAttribute("desserts",
                productRepo.findAllByCategory(categoryRepo.findById(3L).get()));

        model.addAttribute("mains",
                productRepo.findAllByCategory(categoryRepo.findById(4L).get()));

        model.addAttribute("starters",
                productRepo.findAllByCategory(categoryRepo.findById(5L).get()));

        model.addAttribute("burgers",
                productRepo.findAllByCategory(categoryRepo.findById(6L).get()));

        model.addAttribute("steaks",
                productRepo.findAllByCategory(categoryRepo.findById(7L).get()));

        model.addAttribute("alcDrinks",
                productRepo.findAllByCategory(categoryRepo.findById(8L).get()));

        model.addAttribute("nonAlcDrinks",
                productRepo.findAllByCategory(categoryRepo.findById(9L).get()));

        return "add-order";
    }

    /**
     * Add order POST controller.
     *
     * @param productIdArray An array of product IDs selected for the order.
     * @param address        The delivery address for the order.
     * @param name           The customer's name.
     * @param phone          The customer's phone number.
     * @return Redirect to the orders main page.
     */
    @PostMapping("orders/add")
    private String addOrder(
            @RequestParam("productIdArray") Long[] productIdArray,
            @RequestParam("address") String address,
            @RequestParam("name") String name,
            @RequestParam("phone") String phone
    ) {

        Customer customer = customerService.
                getCustomerByPhoneOrSaveCustomerToRepoAndGetIt(name, phone);

        // Retrieve products based on selected product IDs
        List<Product> products = productService.
                getListOfProductsFromArrayOfIds(productIdArray);

        // Create and save the order
        Order order = new Order();
        order.setPrice(productService.getTotalPriceOfProductList(products));
        order.setCustomer(customer);
        order.setProducts(products);
        order.setTime(LocalDateTime.now());
        order.setAddress(address);
        orderRepo.save(order);

        return "redirect:/orders";
    }

    /**
     * Get order information controller (unique order seperated page).
     *
     * @param id    The ID of the order to retrieve information.
     * @param model The model to which the order information is added.
     * @return The view name for the order information page.
     */
    @GetMapping("/order/{id}")
    public String getOrderInfo(@PathVariable("id") Long id, Model model) {

        List<Order> container = new ArrayList<>();
        Optional<Order> orderOptional = orderRepo.findById(id);
        if (orderOptional.isEmpty()) return "redirect:/";
        else {
            container.add(orderOptional.get());
            model.addAttribute("container", container);
            return "order-info";
        }
    }

    /**
     * Delete order POST controller.
     *
     * @param id The ID of the order to delete.
     * @return Redirect to the orders list page.
     */
    @PostMapping("/order/{id}/delete")
    public String deleteOrder(@PathVariable("id") Long id) {
        if (id > 0) {
            orderRepo.deleteById(id);
        }
        return "redirect:/orders";
    }
}
