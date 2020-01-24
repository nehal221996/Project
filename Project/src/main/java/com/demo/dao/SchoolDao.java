package com.demo.dao;

import java.util.List;

import com.demo.model.School;
import com.demo.model.Student;

public interface SchoolDao {

	void saveSchool(School school);

	List<School> getSchoolByEmail(String email);

	School getSchoolDetail(String email, String pass);

	List<School> getSchoolList();

	School getSchoolById(int id);

	List<School> SchoolById(int id);

	void updatePassword(String newpassword, int id);

	boolean findSchoolBygoogle(String google_id, String email);

	List<School> getSchoolDetailById(int id);

	int updateRandomKey(String email, String uniqueId);

	List<School> getSchoolByToken(String token);

	

}
