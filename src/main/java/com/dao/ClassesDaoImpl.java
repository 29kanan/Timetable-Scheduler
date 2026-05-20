package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConnection;

import com.model.*;

public class ClassesDaoImpl implements ClassesDao {

	    Connection con = null;

	    public boolean addClass(Classes_name c) {

	        boolean f = false;

	        try {

	            con = DBConnection.getConnection();

	            String q = "insert into Classes_name(class_name, sem, dept_id) values(?,?,?)";

	            PreparedStatement ps = con.prepareStatement(q);

	            ps.setString(1, c.getClassName());
	            ps.setString(2, c.getSem());
	            ps.setInt(3, c.getDeptId());

	            ps.executeUpdate();

	            f = true;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return f;
	    }

	    public List<Classes_name> getAllClasses() {

	        List<Classes_name> list = new ArrayList<>();

	        try {

	            con = DBConnection.getConnection();

	            String q = "select * from Classes_name";

	            PreparedStatement ps = con.prepareStatement(q);

	            ResultSet rs = ps.executeQuery();

	            while(rs.next()) {

	            	Classes_name c = new Classes_name();

	                c.setClassId(rs.getInt("class_id"));
	                c.setClassName(rs.getString("class_name"));
	                c.setSem(rs.getString("sem"));
	                c.setDeptId(rs.getInt("dept_id"));

	                list.add(c);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

	    public boolean deleteClass(int id) {

	        boolean f = false;

	        try {

	            con = DBConnection.getConnection();

	            String q = "delete from Classes_name where class_id=?";

	            PreparedStatement ps = con.prepareStatement(q);

	            ps.setInt(1, id);

	            ps.executeUpdate();

	            f = true;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return f;
	    }
	    
	 // Get Class By ID
	    public Classes_name getClassById(int classId) {

	    	Classes_name c = null;

	        try {

	            Connection con = DBConnection.getConnection();

	            String sql = "SELECT * FROM Classes_name WHERE class_id=?";

	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setInt(1, classId);

	            ResultSet rs = ps.executeQuery();

	            if(rs.next()) {

	                c = new Classes_name();

	                c.setClassId(rs.getInt("class_id"));
	                c.setClassName(rs.getString("class_name"));
	                c.setSem(rs.getString("sem"));
	                c.setDeptId(rs.getInt("dept_id"));

	            }

	        } catch(Exception e) {

	            e.printStackTrace();
	        }

	        return c;
	    }
	 // Update Class
	    public boolean updateClass(Classes_name c) {

	        boolean flag = false;
            String sql = "UPDATE Classes_name SET class_name=?, sem=?, dept_id=? WHERE class_id=?";

	        try( Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(sql);) {

	           
	            ps.setString(1, c.getClassName());
	            ps.setString(2, c.getSem());
	            ps.setInt(3, c.getDeptId());
	            ps.setInt(4, c.getClassId());

	            int i = ps.executeUpdate();

	            if(i > 0) {

	                flag = true;
	            }

	        } catch(Exception e) {

	            e.printStackTrace();
	        }

	        return flag;
	    }
	}