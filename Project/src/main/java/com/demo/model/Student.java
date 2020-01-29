package com.demo.model;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "student", uniqueConstraints = { @UniqueConstraint(columnNames = "ID"),
		@UniqueConstraint(columnNames = "EMAIL") })
@Proxy(lazy = false)

public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	int id;

	@Column(name = "name", nullable = false)
	String name;

	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@Column(name = "dob", nullable = false)
	private String dob;

	@Column(name = "gender", nullable = false)
	String gender;

	@Column(name = "address", nullable = false)
	String address;

	@Column(name = "city", nullable = false)
	String city;

	@Column(name = "state", nullable = false)
	String state;

	@Column(name = "pincode", nullable = false)
	private String pincode;

	@Column(name = "contact_no", nullable = false)
	private String contact_no;

	@Column(name = "doj", nullable = false)
	
	private String doj;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "schoolId", nullable = false)
	private int schoolId;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	 @Column(name = "studentRandom_key",unique = true)
	 private String studentRandom_key;


	public String getStudentRandom_key() {
		return studentRandom_key;
	}

	public void setStudentRandom_key(String studentRandom_key) {
		this.studentRandom_key = studentRandom_key;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public Student() {
		super();
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email + ", dob=" + dob + ", gender=" + gender
				+ ", address=" + address + ", city=" + city + ", state=" + state + ", pincode=" + pincode
				+ ", contact_no=" + contact_no + ", doj=" + doj + ", password=" + password + ", schoolId=" + schoolId
				+ ", studentRandom_key=" + studentRandom_key + "]";
	}

	public Student(int id, String name, String email, String dob, String gender, String address, String city,
			String state, String pincode, String contact_no, String doj, String password, int schoolId,String studentRandom_key) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.contact_no = contact_no;
		this.doj = doj;
		this.password = password;
		this.schoolId = schoolId;
		this.studentRandom_key=studentRandom_key;
	}
}
