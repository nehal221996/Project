package com.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="admin")
public class Admin {
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	

	public String getAemail() {
		return aemail;
	}

	public void setAemail(String aemail) {
		this.aemail = aemail;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Id
	@Column(name="id")
	private long id;
	
	@Column(name="aemail")
	String aemail;
	
	@Column(name="pass")
	String pass;
}
