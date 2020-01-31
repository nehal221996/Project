package com.demo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.SchoolDao;
import com.demo.dao.StudentDao;
import com.demo.model.Admin;
import com.demo.model.Student;
import com.demo.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDao studentDao;

	public List<Student> getStudentByEmail(String email) {
		return studentDao.getStudentByEmail(email);
	}

	public Student saveStudent(Student std) {
		return studentDao.saveStudent(std);

	}

	/*
	 * public List<Student> getStudentList() { return studentDao.getStudentList(); }
	 */

	public void deleteData(int did) {
		studentDao.deleteData(did);
	}

	public List<Student> studentBySchoolId(int id) {
		return studentDao.studentBySchoolId(id);
	}

	public Student getStudentDetail(String email, String pass) {
		return studentDao.getStudentDetail(email, pass);
	}

	public void updateDataById(Student std) {
		studentDao.updateDataById(std);
	}

	public Student getDataById(int uid) {
		return studentDao.getDataById(uid);
	}

	public List<Student> getStudentById(int id) {
		return studentDao.getStudentById(id);
	}

	public void updatePassword(String password, int id) {
		studentDao.updatePassword(password, id);
	}

	@Override
	public List<Student> getStudentListBySchoolId(int schoolId) {
		// TODO Auto-generated method stub
		return studentDao.getStudentListBySchoolId(schoolId);
	}

	@Override
	public int updateRandomKey(String email, String randomKey) {

		return studentDao.updateRandomKey(email, randomKey);
	}

	@Override
	public List<Student> getStudentByToken(String token) {

		return studentDao.getStudentByToken(token);
	}

	@Override
	public void removeStudent(Integer id) {
		studentDao.removeStudent(id);

	}

	@Override
	public List<Student> getStudentByidandsid(int id, int studentId) {
		return studentDao.getStudentByidandsid(id, studentId);
	}

	@Override
	public void updateStudent(Student std) {
		studentDao.updateStudent(std);

	}

	@Override
	public List<Student> getStudentsByPage(int id, int pageid, int total, String search) {
		return studentDao.getStudentsByPage(id, pageid, total, search);
	}

	@Override
	public Long countEmployeesBySearch(int id, String search) {
		return studentDao.countEmployeesBySearch(id, search);
	}

	@Override
	public List<Student> allStudent() {
		return studentDao.allStudent();
	}

	@Override
	public Student getStudentByIdRest(int id) {// TODO Auto-generated method stub
		return studentDao.getStudentByIdRest(id);
	}

	@Override
	public Admin getAdminDetail(String email, String pass) {
		return studentDao.getAdminDetail(email,pass);
	}

	@Override
	public List<Student> getStudentsByPage(int page_id, int total, String search) {
		return studentDao.getStudentsByPage( page_id, total, search);
	}

	@Override
	public Long countEmployeesBySearch(String search) {
		return studentDao.countEmployeesBySearch( search);
	}

}
