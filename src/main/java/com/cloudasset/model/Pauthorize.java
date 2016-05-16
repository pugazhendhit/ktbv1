package com.cloudasset.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pauthorize database table.
 * 
 */
@Entity
@NamedQuery(name="Pauthorize.findAll", query="SELECT p FROM Pauthorize p")
public class Pauthorize implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String status;

	private int trxid;

	private String uuid;

	public Pauthorize() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTrxid() {
		return this.trxid;
	}

	public void setTrxid(int trxid) {
		this.trxid = trxid;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}