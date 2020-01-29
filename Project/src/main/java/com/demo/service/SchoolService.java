package com.demo.service;

import java.util.List;

import com.demo.model.School;

public interface SchoolService {

	School saveSchool(School school);

	List<School> getSchoolByEmail(String email);

	School getSchoolDetail(String email, String pass);

	List<School> getSchoolList();

	School getSchoolById(int id);

	List<School> SchoolById(int id);

	void updatePassword(String newpassword, int id);

	boolean findSchoolBygoogle(String google_id, String email);

	List<School> getSchoolDetailById(int id);

	int updateRandomKey(String email, String randomKey);

	List<School> getSchoolByToken(String token);

	List<School> getSchool();

	void removeSchool(Integer id);

	void updateSchool(School s);

	

}
