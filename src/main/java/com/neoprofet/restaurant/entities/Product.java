package com.neoprofet.restaurant.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.util.List;

/**
 * Entity class representing a product.
 */
@Entity
@Setter
@Getter
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id",referencedColumnName = "id")
    private ProductCategory category;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "energy_value")
    private int energyValue;

    @Column(name = "serving_weight")
    private int servingWeight;

/*
* The configuration establishes a "many-to-many" relationship
* between the 'Product' and 'Ingredient' entities.
*
*  The relationship management is carried out through a join
*  table named "product_ingredient",
*  which contains foreign keys for both entities.
*
*  The EAGER loading strategy ensures that associated 'Ingredient'
*  entities are loaded along with the 'Product' entity.
* */
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "product_ingredient",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "ingredient_id"))
    private List<Ingredient> ingredients;

}
