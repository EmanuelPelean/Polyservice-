/**
 * 
 */
package com.polyservice.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;
import com.polyservice.util.HibernateUtility;

/**
 * @author Manu
 *
 */
public class UserDaoImpl implements Dao{
	
	private static SessionFactory sessionFactory;
	
	public UserDaoImpl() {
		sessionFactory = HibernateUtility.getSessionFactory();
	}

	@Override
	public void insertUser(StudentInfoDto newUser) {
	
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(newUser);
		tx.commit();
		session.close();
	}

	@Override
	public void updateUser(StudentInfoDto newUser) {
	
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(newUser);
		tx.commit();
		session.close();
	}


	@Override
	public StudentInfoDto getUserInfo(String userId) {
		
		System.out.println("(UserDaoImpl)The user ID we are using to match with is " + userId);
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Criteria crit = session.createCriteria(StudentInfoDto.class);
		crit.add(Restrictions.like("studentID", userId));
		ArrayList<StudentInfoDto> list = (ArrayList<StudentInfoDto>) crit.list();
		
		StudentInfoDto user = (StudentInfoDto) list.get(0);
		tx.commit();
		session.close();
		return user;
	}
	
	@Override
	public boolean userRegistrationCheck(String userId) {
		boolean result = false;
		
		System.out.println("(UserDaoImpl)The user ID we are using to match with to see if the current user has basic info already in MySQL is " + userId);
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Criteria crit = session.createCriteria(StudentInfoDto.class);
		crit.add(Restrictions.like("studentID", userId));
		ArrayList<StudentInfoDto> list = (ArrayList<StudentInfoDto>) crit.list();
		
		if (list.size() > 0) {
			result = true;
		} 
		
		tx.commit();
		session.close();
		return result;
	}

	@Override
	public void insertCourseInfo(CourseSelectionDto courseInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCourseInfo(CourseSelectionDto courseInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean courseRegistrationCheck(String userId) {
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

	


	
