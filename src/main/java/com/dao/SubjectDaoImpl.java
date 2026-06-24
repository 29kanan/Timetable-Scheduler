package com.dao;

import java.sql.*;
import java.util.*;

import com.model.Subject;
import com.util.DBConnection;

public class SubjectDaoImpl implements SubjectDao {

	
	public boolean addSubject(Subject s) {
		 boolean status=false;
		 int x=0;
		 String query = "INSERT INTO subjects(sub_name, sub_code, sub_abbr, subject_type, sem, dept_id,faculty_id,frequency) VALUES(?,?,?,?,?,?,?,?)";
         
        try(		Connection con = DBConnection.getConnection();
               PreparedStatement ps = con.prepareStatement(query);
            ) {
        	
            ps.setString(1, s.getSub_name());
            ps.setString(2, s.getSub_code());
            
            if(s.getSubject_type().equals("Lab")) {
                  ps.setString(3, s.getSub_abbr()+" lab");
            }
            else {
            	 ps.setString(3, s.getSub_abbr());
            }
            ps.setString(4, s.getSubject_type());
            ps.setString(5, s.getSem());
            ps.setInt(6, s.getDept_id());
            ps.setInt(7, s.getFac_id());
            ps.setInt(8, s.getFrequency());
            x= ps.executeUpdate();
            
            if(x!=0)
            	status=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT * from subjects";

        try(        Connection con = DBConnection.getConnection();
        		  PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
               ) {
           while (rs.next()) {
                Subject s = new Subject();
                s.setSub_id(rs.getInt(1));
                s.setSub_name(rs.getString(2));
                s.setSub_code(rs.getString(3));
                s.setSub_abbr(rs.getString(4));
                s.setSubject_type(rs.getString(5));
                s.setSem(rs.getString(6));
                s.setDept_id(rs.getInt(7));
                s.setFac_id(rs.getInt(8));
                s.setFrequency(rs.getInt(9));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Subject getSubjectById(int id) {
        Subject s = null;
        String query = "SELECT * FROM subjects WHERE sub_id=?";
        try (        Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ){
           ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = new Subject();
                s.setSub_id(rs.getInt(1));
                s.setSub_name(rs.getString(2));
                s.setSub_code(rs.getString(3));
                s.setSub_abbr(rs.getString(4));
                s.setSubject_type(rs.getString(5));
                s.setSem(rs.getString(6));
                s.setDept_id(rs.getInt(7));
                s.setFac_id(rs.getInt(8));
                s.setFrequency(rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return s;
    }

    public boolean updateSubject(Subject s) {
        String query = "UPDATE subjects SET sub_name=?, sub_code=?, sub_abbr=?, subject_type=?, sem=?, dept_id=?,faculty_id=?,frequency=? WHERE sub_id=?";

        try(    	Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
) {

            ps.setString(1, s.getSub_name());
            ps.setString(2, s.getSub_code());
          	 ps.setString(3, s.getSub_abbr());
            ps.setString(4, s.getSubject_type());
            ps.setString(5, s.getSem());
            ps.setInt(6, s.getDept_id());
            ps.setInt(7, s.getFac_id());
            ps.setInt(8, s.getFrequency());
            ps.setInt(9, s.getSub_id());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean deleteSubject(int id) {
        String query = "DELETE FROM subjects WHERE sub_id=?";

        try(    	Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }
    @Override
    public Subject getSubjectByAbbr(String subAbbr) {

        Subject s = null;

        try(Connection con =
                DBConnection.getConnection()) {

            String sql =
                "SELECT * FROM subjects " +
                "WHERE sub_abbr=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, subAbbr);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {

                s = new Subject();

                s.setSub_id(
                    rs.getInt("sub_id"));

                s.setSub_name(
                    rs.getString("sub_name"));

                s.setSub_code(
                    rs.getString("sub_code"));

                s.setSub_abbr(
                    rs.getString("sub_abbr"));

                s.setDept_id(
                    rs.getInt("dept_id"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return s;
    }
    @Override
    public List<Subject> getSubjectsByFacultyId(int facId) {

        List<Subject> list = new ArrayList<>();

        try(
            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(
                    "SELECT * FROM subjects WHERE fac_id=?")
        ){

            ps.setInt(1, facId);

            ResultSet rs =
                ps.executeQuery();

            while(rs.next()) {

                Subject s =
                    new Subject();

                s.setSub_id(
                    rs.getInt("sub_id"));

                s.setSub_name(
                    rs.getString("sub_name"));

                s.setSub_code(
                    rs.getString("sub_code"));

                s.setSub_abbr(
                    rs.getString("sub_abbr"));

                s.setSubject_type(
                    rs.getString("subject_type"));

                s.setSem(
                    rs.getString("sem"));

                s.setDept_id(
                    rs.getInt("dept_id"));

                s.setFac_id(
                    rs.getInt("fac_id"));

                s.setFrequency(
                    rs.getInt("frequency"));

                list.add(s);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }
	
}