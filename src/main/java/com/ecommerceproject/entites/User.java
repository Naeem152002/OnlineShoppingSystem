package com.ecommerceproject.entites;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
@Entity
@Data
public class User{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
private int userId;	
private String UserName;
private String UserEmail;
private String UserPassword;
private String UserPhone;
private String UserPic;
private String UserAddress;
private String userType;
public User() {
	
}
public User(String userName, String userEmail, String userPassword, String userPhone, String userPic,
		String userAddress, String userType) {
	this.UserName = userName;
	this.UserEmail = userEmail;
	this.UserPassword = userPassword;
	this.UserPhone = userPhone;
	this.UserPic = userPic;
	this.UserAddress = userAddress;
	this.userType = userType;
}
public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic,
		String userAddress, String userType) {
	this.userId = userId;
	this.UserName = userName;
	this.UserEmail = userEmail;
	this.UserPassword = userPassword;
	this.UserPhone = userPhone;
	this.UserPic = userPic;
	this.UserAddress = userAddress;
	this.userType = userType;
}
public User(String userEmail,String userPassword) {
	this.UserEmail = userEmail;
	this.UserPassword = userPassword;
}
}
