package com.demo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.SchoolDao;
import com.demo.model.School;
import com.demo.service.SchoolService;

@Service
public class SchoolServiceImpl implements SchoolService {
	@Autowired
	SchoolDao schoolDao;

	public School saveSchool(School school) {
		return schoolDao.saveSchool(school);
		
	}

	public List<School> getSchoolByEmail(String email) {
		return schoolDao.getSchoolByEmail(email);
	}

	public School getSchoolDetail(String email, String pass) {
		return schoolDao.getSchoolDetail(email, pass);
	}

	public List<School> getSchoolList() {
		return schoolDao.getSchoolList();
	}

	public School getSchoolById(int id) {
		return schoolDao.getSchoolById(id);
	}

	public List<School> SchoolById(int id) {
		return schoolDao.SchoolById(id);
	}

	public void updatePassword(String newpassword, int id) {
		schoolDao.updatePassword(newpassword, id);
	}

	@Override
	public boolean findSchoolBygoogle(String google_id, String email) {
		return schoolDao.findSchoolBygoogle(google_id, email);
	}

	@Override
	public List<School> getSchoolDetailById(int id) {
		return schoolDao.getSchoolDetailById(id);
	}

	@Override
	public int updateRandomKey(String email, String randomKey) {
		return schoolDao.updateRandomKey(email, randomKey);

	}

	@Override
	public List<School> getSchoolByToken(String token) {
		// TODO Auto-generated method stub
		return schoolDao.getSchoolByToken(token);
	}

	@Override
	public List<School> getSchool() {
		return schoolDao.getSchool();
	}

}
