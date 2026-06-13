package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.commons.dbcp2.BasicDataSource;

public class DBConnection {

		
		public static Connection getConnection() {
	        BasicDataSource dbcp=null;
	    	Connection conn=null;
			try{
				dbcp=new BasicDataSource();

			dbcp.setDriverClassName("com.mysql.cj.jdbc.Driver");

			dbcp.setUrl(sql_pass.getUrl());

			dbcp.setUsername(sql_pass.getUname());

			dbcp.setPassword(sql_pass.getPass());

			conn= dbcp.getConnection();
			//System.out.println("cann com");
			
			  if(dbcp!=null)dbcp.close();	
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		
		public static void clean(Statement st,Connection conn,BasicDataSource ds) {
			try {
				if(st!=null)st.close();
				if(conn!=null)conn.close();	
				if(ds!=null)ds.close();	
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
				
	    }
		public static void clean(PreparedStatement ps,Connection conn,BasicDataSource ds) {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();	
				if(ds!=null)ds.close();	
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
				
	    }
		public static void clean(PreparedStatement ps,Connection conn) {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();	
				
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
				
	    }
		public static void clean(ResultSet rs, PreparedStatement ps,Connection conn,BasicDataSource ds) {
			try {
				
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();	
				if(ds!=null)ds.close();	
				
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
	   }
		
		public static void clean(ResultSet rs,Statement st,Connection conn,BasicDataSource ds) {
			try {
				
				if(rs!=null)rs.close();
				if(st!=null)st.close();
				if(conn!=null)conn.close();	
				if(ds!=null)ds.close();	
				
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
	   }
		
		public static void clean(ResultSet rs,PreparedStatement ps,Connection conn) {
			try {
				
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();	
				
				}
			catch(Exception e) {
			e.printStackTrace();
		    }
	   }
	}

	
	

