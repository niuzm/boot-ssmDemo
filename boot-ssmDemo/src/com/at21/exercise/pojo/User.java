package com.at21.exercise.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class User {
	private String u_id;
	private String u_username;
	private String u_name;
	private String  u_sex;
	private String  u_nation;
	private Date  u_birthday;
	private String  u_card_id;
	private String  u_married;
	private String  u_phone;
	private String u_now_addr;
	private String u_email;
	private String u_before_addr;
	private String u_status;
	private String u_password;

	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_nation() {
		return u_nation;
	}
	public void setU_nation(String u_nation) {
		this.u_nation = u_nation;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	public Date getU_birthday() {
		return u_birthday;
	}
	public void setU_birthday(Date u_birthday) {
		this.u_birthday = u_birthday;
	}
	public String getU_card_id() {
		return u_card_id;
	}
	public void setU_card_id(String u_card_id) {
		this.u_card_id = u_card_id;
	}
	public String getU_married() {
		return u_married;
	}
	public void setU_married(String u_married) {
		this.u_married = u_married;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_now_addr() {
		return u_now_addr;
	}
	public void setU_now_addr(String u_now_addr) {
		this.u_now_addr = u_now_addr;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_before_addr() {
		return u_before_addr;
	}
	public void setU_before_addr(String u_before_addr) {
		this.u_before_addr = u_before_addr;
	}
	public String getU_status() {
		return u_status;
	}
	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_username=" + u_username + ", u_name=" + u_name + ", u_sex=" + u_sex
				+ ", u_nation=" + u_nation + ", u_birthday=" + u_birthday + ", u_card_id=" + u_card_id + ", u_married="
				+ u_married + ", u_phone=" + u_phone + ", u_now_addr=" + u_now_addr + ", u_email=" + u_email
				+ ", u_before_addr=" + u_before_addr + ", u_status=" + u_status + ", u_password=" + u_password + "]";
	}
	
}
