/**
 * 
 */
package com.polyservice.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.polyservice.dto.StudentInfoDto;

/**
 * @author Manu
 *
 */
public class UserDaoImpl implements UsersDao{

	@Override
	public void insertUser(StudentInfoDto newUser) {
		// TODO Auto-generated method stub
		Configuration config = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(newUser);
		tx.commit();
		session.close();
	}

	
}
