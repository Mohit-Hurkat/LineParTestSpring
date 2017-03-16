package com.test.bean;

import java.util.Date;

public class Result {
	 private String username;
     private int subject_Id;
     private int result;
     private Date time_;
     
	public Result(String username, int subject_Id, int result, Date time_) {
		super();
		this.username = username;
		this.subject_Id = subject_Id;
		this.result = result;
		this.time_ = time_;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getSubject_Id() {
		return subject_Id;
	}

	public void setSubject_Id(int subject_Id) {
		this.subject_Id = subject_Id;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public Date getTime_() {
		return time_;
	}

	public void setTime_(Date time_) {
		this.time_ = time_;
	}

	@Override
	public String toString() {
		return "Result [username=" + username + ", subject_Id=" + subject_Id + ", result=" + result + ", time_=" + time_
				+ "]";
	}
     
     
     
}
