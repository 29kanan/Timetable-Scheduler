package com.util;


public class sql_pass {
 static String pass;
 static String url;
 static String uname;
	static {
		pass = "Mahadev21";
	}
	static {
		uname = "root";
	}
	static {
		url="jdbc:Mysql://localhost:3306/timetable_db";
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
