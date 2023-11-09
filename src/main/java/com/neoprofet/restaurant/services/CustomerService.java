package com.neoprofet.restaurant.services;

import com.neoprofet.restaurant.entities.Customer;
import com.neoprofet.restaurant.repositories.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * Service class for managing Customer entities.
 */
@Service
public class CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    /**
     * Retrieves a customer by phone number from the repository.
     * If not found, creates a new customer, saves it to the repository, and returns it.
     *
     * @param name  The name of the customer to save if not found.
     * @param phone The phone number of the customer to save if not found.
     * @return The retrieved by phone number or newly created customer.
     */
    public Customer getCustomerByPhoneOrSaveCustomerToRepoAndGetIt
            (String name, String phone){
        Optional<Customer>customerOptional = customerRepo.findByPhone(phone);
        if(customerOptional.isPresent()) return customerOptional.get();
        else {
           Customer customer = new Customer();
           customer.setName(name);
           customer.setPhone(phone);

           /*TODO set correct DiscountPercent
              (depending on the frequency of orders created by the customer) */
           customer.setDiscountPercent(0.0);

           customerRepo.save(customer);
           return customer;
        }
    }
}
