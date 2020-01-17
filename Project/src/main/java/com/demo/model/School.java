package com.demo.model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="school")
@Proxy(lazy = false)
public class School 
{
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	 int id;
	
	@Column(name = "school_name", nullable = false)
	private String school_name;
	
	@Column(name = "school_email", nullable = false, unique = true)
	private String school_email;
	
	@Column(name = "school_pass", nullable = false)
	@JsonIgnore
	private String school_pass;
	
	@Lob
	@Column(name = "image")
	private byte[] image;
	
	@Column(name = "picture_url")
	private String picture_url;
	
	@Column(name = "google_id", unique = true)
	private String google_id;
	
	@Column(name = "random_key")
	private String random_key;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getSchool_email() {
		return school_email;
	}

	public void setSchool_email(String school_email) {
		this.school_email = school_email;
	}

	public String getSchool_pass() {
		return school_pass;
	}

	public void setSchool_pass(String school_pass) {
		this.school_pass = school_pass;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}

	public String getRandom_key() {
		return random_key;
	}

	public void setRandom_key(String random_key) {
		this.random_key = random_key;
	}
	
	public School(int id, String school_name, String school_email, String school_pass, byte[] image, String picture_url,
			String google_id, String random_key) {
		super();
		this.id = id;
		this.school_name = school_name;
		this.school_email = school_email;
		this.school_pass = school_pass;
		this.image = image;
		this.picture_url = picture_url;
		this.google_id = google_id;
		this.random_key = random_key;
	}

	public School() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "School [id=" + id + ", school_name=" + school_name + ", school_email=" + school_email + ", school_pass="
				+ school_pass + ", image=" + Arrays.toString(image) + ", picture_url=" + picture_url + ", google_id="
				+ google_id + ", random_key=" + random_key + "]";
	}
	
	
	
	
	
	
	
	
}
