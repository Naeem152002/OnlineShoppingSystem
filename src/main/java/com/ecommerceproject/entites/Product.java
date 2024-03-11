package com.ecommerceproject.entites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import lombok.Data;
@Entity
@Data
public class Product{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length=3000)
	private String pDesc;
	private String pPhoto;
	private int  pPrice;
	private int  pDiscount;
	private int  pQuantity;
	@ManyToOne
	private Category category;
	
	
	public Product() {
		
	}


	public Product(int pId, String pName, String pDesc, String pPhoto, int  pPrice, int  pDiscount,
			int pQuantity, Category category) {
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}
	//calculate price after discount
	public int getPriceAfterApplyDiscount() {
		int d=(int)((this.getPDiscount()/100.0)*this.getPPrice());
		
		return this.getPPrice()-d;
		
	}
	
}
