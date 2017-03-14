package com.test.bean;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.test.validator.Phone;

public class Student{

	@NotEmpty
	@Length(min=3,max=15)
	private String username;
	@NotEmpty
	private String password;
	@NotEmpty
	@Length(min=3,max=15)
    private String name;
	@NotEmpty
	@Phone
	private String phone;
	@Email
	private String email;
	
	public Student(){
		
	}
     
	
	public Student(String username, String password, String name, String phone, String email) {
		super();
		this.username = username;
		this.setPassword(password);
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	

	@Override
	public String toString() {
		return " UserName=" + username + ",Name=" + name + ",Phone No =" + phone + ",Email=" + email;
	}
	
	
     
}
