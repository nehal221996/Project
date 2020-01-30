package com.demo.service;

import java.util.List;

import com.demo.model.Admin;
import com.demo.model.Student;

public interface StudentService {

	List<Student> getStudentByEmail(String email);

	Student saveStudent(Student std);

	/*List<Student> getStudentList();*/

	void deleteData(int did);

	List<Student> studentBySchoolId(int id);

	Student getStudentDetail(String email, String pass);

	void updateDataById(Student std);

	Student getDataById(int uid);

	List<Student> getStudentById(int id);

	void updatePassword(String password, int id);

	List<Student> getStudentListBySchoolId(int schoolId);

	int updateRandomKey(String email, String randomKey);

	List<Student> getStudentByToken(String token);

	void removeStudent(Integer id);

	List<Student> getStudentByidandsid(int id, int studentId);

	void updateStudent(Student std);

	List<Student> getStudentsByPage(int id, int pageid, int total, String search);

	Long countEmployeesBySearch(int id, String search);

	List<Student> allStudent();
	
	Student getStudentByIdRest(int id);

	Admin getAdminDetail(String email, String pass);

	List<Student> getStudentsByPage(int page_id, int total, String search);

	int countEmployeesBySearch(String search);

}
