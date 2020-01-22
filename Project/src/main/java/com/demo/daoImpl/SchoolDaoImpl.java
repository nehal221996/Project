package com.demo.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.dao.SchoolDao;
import com.demo.model.School;
import com.demo.model.Student;

@Repository
@Transactional
public class SchoolDaoImpl implements SchoolDao {
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void saveSchool(School school) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		session.save(school);
		t.commit();
	}

	public List<School> getSchoolByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from School  where school_email=:email";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		List<School> s = query.list();
		t.commit();
		return s;
	}

	public School getSchoolDetail(String email, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "from School where school_email=:email and school_pass=:pass";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		School s = (School) query.uniqueResult();
		t.commit();
		return s;
	}

	public List<School> getSchoolList() {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		List<School> allUser = session.createQuery("from School").list();
		t.commit();
		return allUser;
	}

	public School getSchoolById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		School s = session.load(School.class, new Integer(id));
		t.commit();
		return s;
	}

	public List<School> SchoolById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from School where id=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<School> std = query.list();
		t.commit();
		return std;
	}

	public void updatePassword(String newpassword, int id) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println(newpassword);
		Transaction t = session.beginTransaction();
		Query query = session.createQuery("update School set school_pass=:pass where id=:id");
		query.setParameter("pass", newpassword);
		query.setParameter("id", id);
		query.executeUpdate();
		// Commit the transaction and close the session
		t.commit();
	}

	@Override
	public boolean findSchoolBygoogle(String google_id, String email) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from School  where school_email=:email and google_id=:gid";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("email", email);
		query.setParameter("gid", google_id);
		List<School> school = query.list();
		int school_size = school.size();
		boolean userFound;
		if (school_size > 0) {
			userFound = true;
		} else {
			userFound = false;
		}
		t.commit();
		return userFound;
	}

	@Override
	public List<School> getSchoolDetailById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "  from School where id=:id";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter("id", id);
		List<School> s = query.list();
		t.commit();
		return s;
	}

	@Override
	public int updateRandomKey(String email, String randomKey) {
		Session session = sessionFactory.getCurrentSession();
		Transaction t = session.beginTransaction();
		System.out.println(email);
		System.out.println(randomKey);
		Query query = session.createQuery("update School set random_key=:key where school_email=:email");
		query.setParameter("key", randomKey);
		query.setParameter("email", email);
		int result = query.executeUpdate();
		// Commit the transaction and close the session
		t.commit();
		return result;
	}

}
