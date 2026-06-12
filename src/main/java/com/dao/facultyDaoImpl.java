package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Faculty;
import com.util.DBConnection;

public class facultyDaoImpl implements facultyDao {

	@Override
	public boolean validate(Faculty faculty) {
	
		boolean status=false;
		String query="SELECT * FROM login_teacher WHERE email=? AND password=?;";
		  try (Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
         ){
	            
	            ps.setString(1, faculty.getEmail());
	            ps.setString(2, faculty.getPassword());
	            ResultSet rs=ps.executeQuery();
	            if(rs.next())
	            {
	               String username=rs.getString("username");
	                       faculty.setUsername(username);
	                       
	                       int fid=rs.getInt("fac_id");
	                       faculty.setFac_id(fid);
	                       status = true;
	            }
	           

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		return status;
	}

	@Override
	public String show_msg(String email,String pass) {

		  String msg=null;
		  
		  try (Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM fac_msg WHERE email=? and password=?;");
        ){
	          

	            ps.setString(1,email);
	            ps.setString(2, pass);

	            ResultSet rs = ps.executeQuery();
	            
	            
	            if(rs.next())
	            {
	               String show_msg=rs.getString("msg");
	                      msg=show_msg;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		return msg;
	}
	
	
	public int register(Faculty f) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO regteacher(name,phone,email,dept,password,avail_start,avail_end) VALUES(?,?,?,?,?,?,?);");

            ps.setString(1, f.getUsername());
            ps.setString(2, f.getPhone());
            ps.setString(3, f.getEmail());
            ps.setString(4, f.getDept());
            ps.setString(5, f.getPassword());
            ps.setString(6, f.getAvailStart());
            ps.setString(7, f.getAvailEnd());
            status = ps.executeUpdate();
            if(status!=0) {
            	
            	PreparedStatement msg = con.prepareStatement(
            		    "INSERT INTO fac_msg(email, msg, password) VALUES(?, ?, ?)");
            		msg.setString(1, f.getEmail());
            		msg.setString(2, "pending");
            		msg.setString(3, f.getPassword());
            		msg.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Faculty> getAllFaculty() {
        List<Faculty> list = new ArrayList<>();
        try ( Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM login_teacher");
            ResultSet rs = ps.executeQuery();){
           

            while (rs.next()) {
                Faculty f = new Faculty();
                f.setFac_id(rs.getInt("fac_id"));
                f.setUsername(rs.getString("username"));
                f.setPhone(rs.getString("phone"));
                f.setEmail(rs.getString("email"));
                f.setDept(rs.getString("dept"));
                f.setAvailStart(rs.getString("avail_start"));
                f.setAvailEnd(rs.getString("avail_end"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Faculty getFacultyById(int id) {
        Faculty f = null;
        String query = "SELECT * FROM login_teacher WHERE fac_id=?";

        try( Connection con = DBConnection.getConnection();
        		  PreparedStatement ps = con.prepareStatement(query);
        		) {
          
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
           
            if (rs.next()) {
            	
                f = new Faculty();
                f.setFac_id(rs.getInt("fac_id"));
                f.setUsername(rs.getString("username"));
                f.setPassword(rs.getString("password"));
                f.setPhone(rs.getString("phone"));
                f.setEmail(rs.getString("email"));
                f.setDept(rs.getString("dept"));
                f.setAvailStart(rs.getString("avail_start"));
                f.setAvailEnd(rs.getString("avail_end"));
            }
        } catch (Exception e) {
        }
        return f;
    }

    
    // UPDATE
    public boolean updateFaculty(Faculty f) {

        boolean status = false;
        String sql = "UPDATE login_teacher SET email=?, username=?,password=?, phone=?,,dept=?, avail_start=?,avail_end=? WHERE fac_id=?";

        try (        Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
             ){

            ps.setString(1, f.getEmail());
            ps.setString(2, f.getUsername());
            ps.setString(3, f.getPassword());
            ps.setString(4, f.getPhone());
            ps.setString(5,f.getDept());
            ps.setString(6,f.getAvailStart());
            ps.setString(7,f.getAvailEnd());
            ps.setInt(8,f.getFac_id());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // Delete Faculty
    public boolean deleteFaculty(int id) {
        String sql="DELETE FROM login_teacher WHERE fac_id=?";

        try(Connection con = DBConnection.getConnection();
                PreparedStatement ps=con.prepareStatement(sql);
             ) {

            ps.setInt(1,id);

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
