package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.Department;
import com.util.DBConnection;

public class DepartmentDaoImpl implements DepartmentDao {

	
	public Department getDepartmentById(int id) {
	    Department d = null;
	    try(  Connection con = DBConnection.getConnection();
		        PreparedStatement ps = con.prepareStatement("SELECT * FROM Departments WHERE dept_id=?");
	 	       ) {
	       ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            d = new Department();
	            d.setDept_id(rs.getInt("dept_id"));
	            d.setDept_name(rs.getString("dept_name"));
	            d.setHOD_name(rs.getString("HOD_name"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return d;
	}

	public int updateDepartment(Department d) {
	    int status = 0;
	    try(Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE Departments SET dept_name=?,HOD_name=? WHERE dept_id=?"
	        );) {
	        
	        ps.setString(1, d.getDept_name());
	        ps.setString(2, d.getHOD_name());
	        ps.setInt(3, d.getDept_id());

	        status = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}

	public int deleteDepartment(int id) {
	    int status = 0;
	    try( Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement("DELETE FROM Departments WHERE dept_id=?");
	       ) {
	        ps.setInt(1, id);
	        status = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}

	public  int addDepartment(Department d) {
        int status = 0;
        try( Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Departments(dept_name, HOD_name) VALUES (?,?)"
            );) {
           
            ps.setString(1, d.getDept_name());
            ps.setString(2, d.getHOD_name());

            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Department> getAllDepartments() {
        List<Department> list = new ArrayList<>();
        try(  Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Departments");
                ResultSet rs = ps.executeQuery();
) {
          
            while (rs.next()) {
                Department d = new Department();
                d.setDept_id(rs.getInt("dept_id"));
                d.setDept_name(rs.getString("dept_name"));
                d.setHOD_name(rs.getString("HOD_name"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
