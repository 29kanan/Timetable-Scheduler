package com.dao;

import java.util.List;

import com.model.Classes_name;

public interface ClassesDao {
	
	public boolean addClass(Classes_name c);
	public List<Classes_name> getAllClasses();
	public boolean deleteClass(int id);
	 public Classes_name getClassById(int classId);
	public boolean updateClass(Classes_name c);
	 
}
