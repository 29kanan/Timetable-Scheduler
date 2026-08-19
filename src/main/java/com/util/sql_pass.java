package com.util;


public class sql_pass {
 static String pass;
 static String url;
 static String uname;
	static {
		pass = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "2004";
	}
	static {
		uname = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
	}
	static {
		url = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/timetable_db";
	}
	public static String getPass() {
		return pass;
	}
	
	public static String getUrl() {
		return url;
	}
	public static String getUname() {
		return uname;
	}
	

	
}