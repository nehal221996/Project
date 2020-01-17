package com.demo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.SchoolDao;
import com.demo.dao.StudentDao;
import com.demo.model.Student;
import com.demo.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	StudentDao studentDao;

	public List<Student> getStudentByEmail(String email)
	{
		return studentDao.getStudentByEmail(email);
	}

	public void saveStudent(Student std)
	{
		studentDao.saveStudent(std);
		
	}

	/*public List<Student> getStudentList()
	{
		return studentDao.getStudentList();
	}*/

	public void deleteData(int did) 
	{
		studentDao.deleteData(did);
	}

	public List<Student> studentBySchoolId(int id)
	{
		return studentDao.studentBySchoolId(id);
	}

	public Student getStudentDetail(String email, String pass)
	{
		return studentDao.getStudentDetail(email,pass);
	}

	public void updateDataById(Student std) 
	{
		studentDao.updateDataById(std);
	}

	public Student getDataById(int uid)
	{
		return studentDao.getDataById(uid);
	}

	public List<Student> getStudentById(int id)
	{
		return studentDao.getStudentById(id);
	}

	public void updatePassword(String password, int id)
	{
		 studentDao.updatePassword(password,id);
	}

	@Override
	public List<Student> getStudentListBySchoolId(int schoolId)
	{
		// TODO Auto-generated method stub
		return studentDao.getStudentListBySchoolId(schoolId);
	}
}
