package com.cloudasset.model;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenericGenerator;

/**
 * The persistent class for the UserKTB database table.
 * 
 */
@Entity
@NamedQuery(name="UserKTB.findAll", query="SELECT u FROM UserKTB u")
public class UserKTB implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name = "iduser")
	private int iduser;

	public UserKTB(String customerid, String uemail, String ufirstname, String ulastname,
			String upassword) {
		super();
		this.customerid = customerid;
		this.uemail = uemail;
		this.ufirstname = ufirstname;
		this.ulastname = ulastname;
		this.upassword = upassword;
	}

	private String customerid;

	private String uaddress ="";

	private String uemail;

	private String ufirstname;

	private String ulastname;

	private String upassword;

	public UserKTB() {
	}

	public int getIduser() {
		return this.iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getCustomerid() {
		return this.customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getUaddress() {
		return this.uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUemail() {
		return this.uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUfirstname() {
		return this.ufirstname;
	}

	public void setUfirstname(String ufirstname) {
		this.ufirstname = ufirstname;
	}

	public String getUlastname() {
		return this.ulastname;
	}

	public void setUlastname(String ulastname) {
		this.ulastname = ulastname;
	}

	public String getUpassword() {
		return this.upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

}