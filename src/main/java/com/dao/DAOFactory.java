package com.dao;


public class DAOFactory {
	
static adminDao Adao;
static facultyDao Fdao;
	static DepartmentDao Ddao;
	static RoomDao Rdao;
	static SubjectDao Sdao;
	static TimetableDao Tdao;
	static NotificationDAO Ndao;
	static ClassesDao Cdao;
	
	static {
		Adao = new adminDaoImpl();
		Fdao=new facultyDaoImpl();
		Ddao=new DepartmentDaoImpl();
		Rdao=new RoomDaoImpl();
		Sdao=new SubjectDaoImpl();
		Tdao=new TimetableDaoImpl();
		Ndao = new NotificationDaoImpl();
		Cdao=new ClassesDaoImpl();
	}

	
	public static NotificationDAO getNotificationDao() {
		//System.out.println("dao factory");
		return Ndao;
	}
	
	public static adminDao getAdminDao() {
		//System.out.println("dao factory");
		return Adao;
	}

	public static facultyDao getFacultyDao() {
		
		return Fdao;
	}

	public static DepartmentDao getDepartmentDao() {
		
		return Ddao;
	}
	
public static RoomDao getRoomDao() {
		
		return Rdao;
	}

public static SubjectDao getSubjectDao() {
	
	return Sdao;
}

public static TimetableDao getTimetableDao() {
	
	return Tdao;
}

public static ClassesDao getClassesDao() {
	// TODO Auto-generated method stub
	return Cdao;
}
}
