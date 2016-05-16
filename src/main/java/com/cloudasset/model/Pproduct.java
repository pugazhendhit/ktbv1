package com.cloudasset.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pproduct database table.
 * 
 */
@Entity
@NamedQuery(name="Pproduct.findAll", query="SELECT p FROM Pproduct p")
public class Pproduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int authorizeid;

	private int productid;

	private int quantity;

	public Pproduct() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAuthorizeid() {
		return this.authorizeid;
	}

	public void setAuthorizeid(int authorizeid) {
		this.authorizeid = authorizeid;
	}

	public int getProductid() {
		return this.productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}