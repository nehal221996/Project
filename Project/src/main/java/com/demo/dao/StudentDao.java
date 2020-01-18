package com.demo.dao;

import java.util.List;

import com.demo.model.Student;

public interface StudentDao {

	List<Student> getStudentByEmail(String email);

	void saveStudent(Student std);

	/* List<Student> getStudentList(); */

	void deleteData(int did);

	List<Student> studentBySchoolId(int id);

	Student getStudentDetail(String email, String pass);

	void updateDataById(Student std);

	Student getDataById(int uid);

	List<Student> getStudentById(int id);

	void updatePassword(String password, int id);

	List<Student> getStudentListBySchoolId(int schoolId);

}
