/**
 * 
 */
package com.polyservice.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.polyservice.dto.StudentInfoDto;
import com.polyservice.util.HibernateUtility;

/**
 * @author Manu
 *
 */
public class UserDaoImpl implements UsersDao{
	
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
	public StudentInfoDto getUserInfo(String userId) {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Criteria crit = session.createCriteria(StudentInfoDto.class);
		Criterion userInfo = Restrictions.gt("studenID", userId);
		crit.setMaxResults(1);
		StudentInfoDto user = (StudentInfoDto) crit.uniqueResult();
		tx.commit();
		session.close();
		return user;
	}
}

	


	
