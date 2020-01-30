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
import com.demo.model.Admin;
import com.demo.model.School;
import com.demo.model.Student;



@Repository
@Transactional
public class StudentDaoImpl implements StudentDao {
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Student> getStudentByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where email=:email";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	public Student saveStudent(Student std) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.save(std);
		t.commit();
		return std;

	}

	/*
	 * public List<Student> getStudentList() { Session session =
	 * sessionFactory.getCurrentSession(); Transaction t =
	 * session.beginTransaction(); List<Student>
	 * allStd=session.createQuery("from Student").list(); t.commit(); return allStd;
	 * }
	 */

	public void deleteData(int did) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student s = session.load(Student.class, did);
		session.delete(s);
		System.out.println("Student deleted successfully, person details=" + s);
		t.commit();
	}

	public List<Student> studentBySchoolId(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where schoolId=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	public Student getStudentDetail(String email, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "from Student where email=:email and password=:pass";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		Student s = (Student) query.uniqueResult();
		t.commit();
		return s;
	}

	public void updateDataById(Student std) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.update(std);
		t.commit();
	}

	public Student getDataById(int uid) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student u = (Student) session.createQuery("from Student u where id=" + uid).uniqueResult();
		t.commit();
		return u;

	}

	public List<Student> getStudentById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student where id=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<Student> std = query.list();
		t.commit();
		return std;

	}

	public void updatePassword(String password, int id) {
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
	public List<Student> getStudentListBySchoolId(int schoolId) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where schoolId=:schoolId";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("schoolId", schoolId);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	@Override
	public int updateRandomKey(String email, String randomKey) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		System.out.println(email);
		System.out.println(randomKey);
		Query query = session.createQuery("update Student set studentRandom_key=:key where email=:email");
		query.setParameter("key", randomKey);
		query.setParameter("email", email);
		int result = query.executeUpdate();
		// Commit the transaction and close the session
		t.commit();
		return result;
	}

	@Override
	public List<Student> getStudentByToken(String token) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where studentRandom_key=:token";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("token", token);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	@Override
	public void removeStudent(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student u = (Student) session.load(Student.class, new Integer(id));
		if (null != u) {
			session.delete(u);
		}
		t.commit();
	}

	@Override
	public List<Student> getStudentByidandsid(int id, int schoolId) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from Student  where id=:id and schoolId=:schoolId";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		query.setParameter("schoolId", schoolId);
		List<Student> s = query.list();
		System.out.println("student"+s);
		t.commit();
		return s;
	
		
	}

	@Override
	public void updateStudent(Student std) 
	{
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.update(std);
		t.commit();
	}

	@Override
	public List<Student> getStudentsByPage(int id, int pageid, int total, String search) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = " from Student where  schoolId=:id and name Like concat('%',:searchName,'%')";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		query.setParameter("searchName", search);
		query.setFirstResult(pageid - 1);
		query.setMaxResults(total);
		List<Student> std = query.list();
		t.commit();
		return std;
	}

	@Override
	public Long countEmployeesBySearch(int id, String search) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "select count(*) from Student where  schoolId=:id and name Like concat('%',:searchName,'%')";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		query.setParameter("searchName", search);
		Long count = (Long) query.uniqueResult();
		List<Student> std = query.list();
		t.commit();
		return count;
	}

	@Override
	public List<Student> allStudent() {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		List<Student> allUser = session.createQuery("from Student").list();
		t.commit();
		return allUser;
	
	}

	@Override
	public Student getStudentByIdRest(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		Student s=session.load(Student.class,  new Integer(id));
		t.commit();
		return s;
		
	}

	@Override
	public Admin getAdminDetail(String email, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "from Admin where aemail=:email and pass=:pass";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		Admin a = (Admin) query.uniqueResult();
		t.commit();
		return a;
	}
}
