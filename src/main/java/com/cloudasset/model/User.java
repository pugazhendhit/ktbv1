package com.cloudasset.model;

public class User {

	public User(String firstname, String lastname, String email, String password, String customerid) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.customerid = customerid;
	}

	public String firstname;
	
	public String lastname;
	
	public String email;
	
	public String password;
	
	public String customerid;
	
}
