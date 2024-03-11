package com.ecommerceproject.entites;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import lombok.Data;

@Entity
@Data
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
private int categoryId;
private String categoryTitle;
private String categoryDescription;
@OneToMany(mappedBy="category")//mapping
private List<Product>products=new ArrayList<>();
	public Category(String categoryTitle, String categoryDescription, List<Product> products) {
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}
	
public Category() {
	
}

public Category(int categoryId, String categoryTitle, String categoryDescription, List<Product> products) {
	this.categoryId = categoryId;
	this.categoryTitle = categoryTitle;
	this.categoryDescription = categoryDescription;
	this.products = products;
}
}
