package com.dao;

public interface ForgotPasswordDAO {

	
	    boolean verifyEmailAndPhone(String email, String phone);

	   
	    boolean updatePassword(String email, String newPassword);

	 
	}



