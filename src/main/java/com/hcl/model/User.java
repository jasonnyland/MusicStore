package com.hcl.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String userEmail;
	private String userPass;
	private String userName;
	private String userPhone;
	private String userStreet1;
	private String userStreet2;
	private String userCity;
	private String userState;
	private String userCountry;
	private boolean admin = false;
}
