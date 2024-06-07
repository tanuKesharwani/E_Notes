package com.User;

public class UserDetails {
    private int userId;
	private String uname;
	private String uemail;
	private String upass;
	
	
	
	public UserDetails(int userId, String uname, String uemail, String upass) {
		super();
		this.userId = userId;
		this.uname = uname;
		this.uemail = uemail;
		this.upass = upass;
	}
	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	
	
	
	

	
}
