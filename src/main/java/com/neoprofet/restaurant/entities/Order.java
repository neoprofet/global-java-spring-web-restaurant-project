package com.neoprofet.restaurant.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Entity class representing an order.
 */
@Entity
@Setter
@Getter
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Column(name = "time")
    private LocalDateTime time;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "address")
    private String address;

    /*
     * The configuration establishes a "many-to-many" relationship
     * between the 'Order' and 'Product' entities.
     *
     *  The relationship management is carried out through a join
     *  table named "order_product",
     *  which contains foreign keys for both entities.
     *
     *  The EAGER loading strategy ensures that associated 'Product'
     *  entities are loaded along with the 'Order' entity.
     * */
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "order_product",
            joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> products;

}
