package com.dao;


import java.util.List;

import com.model.Faculty;

public interface facultyDao {
	
	boolean validate(Faculty faculty);
    String show_msg(String email,String pass);
    int register(Faculty f);
    List<Faculty> getAllFaculty();
    Faculty getFacultyById(int id);
    boolean updateFaculty(Faculty f);
    public boolean deleteFaculty(int id);
}
