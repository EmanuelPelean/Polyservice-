package com.polyservice.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.util.HibernateUtility;

public class CourseDaoImpl implements CourseDao {

	private static SessionFactory sessionFactory;

	public CourseDaoImpl() {
		sessionFactory = HibernateUtility.getSessionFactory();

	}
	
	@Override
	public void insertCourseInfo(CourseSelectionDto courseInfo) {
	
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(courseInfo);
		tx.commit();
		session.close();
	}

}
