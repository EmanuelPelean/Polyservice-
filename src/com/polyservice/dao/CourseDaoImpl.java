package com.polyservice.dao;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;
import com.polyservice.util.HibernateUtility;

public class CourseDaoImpl implements Dao {

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
	
	@Override
	public void updateCourseInfo(CourseSelectionDto courseInfo) {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(courseInfo);
		tx.commit();
		session.close();
		
	}
	
	@Override
	public boolean courseRegistrationCheck(String userId) {
		boolean result = false;
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Criteria crit = session.createCriteria(CourseSelectionDto.class);
		crit.add(Restrictions.like("studentID", userId));
		ArrayList<CourseSelectionDto> list = (ArrayList<CourseSelectionDto>) crit.list();
		
		if (list.size() > 0) {
			result = true;
		} 
		
		tx.commit();
		session.close();
		return result;
	}

	@Override
	public void insertUser(StudentInfoDto newUser) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudentInfoDto getUserInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(StudentInfoDto newUser) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean userRegistrationCheck(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertMedicalInfo(MedicalHistoryDto medicalInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMedicalInfo(MedicalHistoryDto medicalInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean medicalRegistrationCheck(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertGuardianInfo(GuardianInfoDto medicalInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateGuardianInfo(GuardianInfoDto medicalInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean guardianRegistrationCheck(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

}
