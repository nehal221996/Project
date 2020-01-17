package com.demo.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.dao.StudentDao;
import com.demo.model.Student;



@Repository
@Transactional
public class StudentDaoImpl implements StudentDao
{
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Student> getStudentByEmail(String email)
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where email=:email";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	public void saveStudent(Student std)
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.save(std);
		t.commit();
		
	}

	/*public List<Student> getStudentList()
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		List<Student> allStd=session.createQuery("from Student").list();
		t.commit();
		return allStd;
	}*/

	public void deleteData(int did) 
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student s=session.load(Student.class, did);
		session.delete(s);
		System.out.println("Student deleted successfully, person details=" + s);
		t.commit();
	}

	public List<Student> studentBySchoolId(int id) 
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where schoolId=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	public Student getStudentDetail(String email, String pass)
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t=session.beginTransaction();
		String SQL_QUERY="from Student where email=:email and password=:pass"  ;
		Query query=session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		Student s= (Student) query.uniqueResult();
		t.commit();
		return s;
	}

	public void updateDataById(Student std)
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.update(std);
		t.commit();
	}

	public Student getDataById(int uid) 
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student u= (Student) session.createQuery("from Student u where id="+uid).uniqueResult();
		t.commit();
		return u;
				
	}

	public List<Student> getStudentById(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student where id=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<Student> std = query.list();
		t.commit();
		return std;
	
		
	}

	public void updatePassword(String password, int id) 
	{
		System.out.println("In password reset User dao");
		Session session = sessionFactory.getCurrentSession();
		System.out.println(password);
		Transaction t = session.beginTransaction();
		Query query = session.createQuery("update Student set password=:pass where id=:id");
		query.setParameter("pass", password);
		query.setParameter("id", id);
		 query.executeUpdate();
		// Commit the transaction and close the session
		t.commit();

	}

	@Override
	public List<Student> getStudentListBySchoolId(int schoolId) 
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where schoolId=:schoolId";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("schoolId", schoolId);
		List<Student> std = query.list();
		t.commit();
		return std;
	}
}
