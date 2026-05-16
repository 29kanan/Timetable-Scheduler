package com.dao;

import java.sql.*;


import com.model.Admin;
import com.util.*;

public class adminDaoImpl implements adminDao {

	@Override
	public boolean validate(Admin admin) {
		
		boolean status=false;
		
		  try(  Connection con = DBConnection.getConnection();
		            PreparedStatement ps = con.prepareStatement(
			                "SELECT * FROM admin WHERE email=? AND password=?;"
			            );) {
	          

	            ps.setString(1, admin.getEmail());
	            ps.setString(2, admin.getPassword());

	            ResultSet rs = ps.executeQuery();
	            
	            
	            if(rs.next())
	            {
	               String username=rs.getString("username");
	                       admin.setUsername(username);
	                       status = true;
	            }
	           

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		return status;
	}

	@Override
	public boolean approveFaculty(int id) {
		boolean status=false;
		int x=0,y=0;
		 try( Connection con = DBConnection.getConnection();
		            PreparedStatement ps = con.prepareStatement(
		            		"SELECT * FROM regteacher WHERE faculty_id=?;");
		           ) {
			 ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            if(rs.next()) {
	                String name = rs.getString("name");
	                String email = rs.getString("email");
	                String password = rs.getString("password");
	                String dept = rs.getString("dept");
	               String ph=rs.getString("phone");
	              
	                PreparedStatement ps2 = con.prepareStatement(
	                		"INSERT INTO login_teacher(email,password,username,dept,phone) VALUES(?,?,?,?,?);");
	                
	                ps2.setString(1, email);
	                ps2.setString(2, password);
	                ps2.setString(3, name);
	                ps2.setString(4, dept);
	                ps2.setString(5, ph);
	                 x=ps2.executeUpdate();

	                if(x!=0) {
	                	
	                	PreparedStatement msg = con.prepareStatement(
	                			"UPDATE fac_msg SET msg=? WHERE email=?");
	              		msg.setString(1, "Your account has been APPROVED by admin!");
	                		msg.setString(2, email);
	                		msg.executeUpdate();

	                	
	                PreparedStatement ps3 = con.prepareStatement(
	                    "DELETE FROM regteacher WHERE faculty_id=?;");
	                ps3.setInt(1, id);
	                 y=ps3.executeUpdate();
	                
	                if(y!=0) {
	                status=true;
	                }
	                
	                }
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	          }

		 
		return status;
	}

	@Override
	public boolean rejectFaculty(int id) {
		
		boolean status=false;
		int x=0,y=0;
		 try(Connection con = DBConnection.getConnection();
				 PreparedStatement ps = con.prepareStatement(
		            		"SELECT * FROM regteacher WHERE faculty_id=?;");
		            ) {
			 ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            if(rs.next()) {
	            	 int fid=rs.getInt("faculty_id");
	                String name = rs.getString("name");
	                String email = rs.getString("email");
	                String password = rs.getString("password");
	                String dept = rs.getString("dept");
	               String ph=rs.getString("phone");
	             // System.out.println("selected");
	                PreparedStatement ps2 = con.prepareStatement(
	                		"INSERT INTO rejected_teacher(faculty_id,email,password,name,dept,phone) VALUES(?,?,?,?,?,?);");
	                
	                ps2.setInt(1, fid);
	                ps2.setString(2, email);
	                ps2.setString(3, password);
	                ps2.setString(4, name);
	                ps2.setString(5, dept);
	                ps2.setString(6, ph);
	                 x=ps2.executeUpdate();

	                if(x!=0) {
	                //	 System.out.println("inserted");
	                	PreparedStatement msg = con.prepareStatement(
	                			"UPDATE fac_msg SET msg=? WHERE email=?");
	              		msg.setString(1,"Your account request has been REJECTED by admin.");
	                		msg.setString(2, email);
	                		msg.executeUpdate();
	                	
	                PreparedStatement ps3 = con.prepareStatement(
	                    "DELETE FROM regteacher WHERE faculty_id=?;");
	                ps3.setInt(1, id);
	                 y=ps3.executeUpdate();
	                
	                if(y!=0) {
	                	 // System.out.println("deleted");
	                status=true;
	                }
	              }
	            }
		     }catch(Exception e) {
	            e.printStackTrace();
	        }
		return status;
	}

}
