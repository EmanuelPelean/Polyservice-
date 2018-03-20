/**
 * 
 */
package com.polyservice.factory;

import com.polyservice.dao.CourseDaoImpl;
import com.polyservice.dao.Dao;
import com.polyservice.dao.GuardianDaoImpl;
import com.polyservice.dao.MedicalDaoImpl;
import com.polyservice.dao.UserDaoImpl;

/**
 * @author Manu
 *
 */
public class DaoFactory {

	public static final String USERSDAO = "userdao";
	public static final String COURSEDAO = "coursedao";
	public static final String MEDICALDAO = "medicaldao";
	public static final String GUARDIANDAO = "guardiandao";
	
	public static Dao getInstance(String type) {

		Dao daoSelection = null;

		switch (type) {

		case USERSDAO:
			daoSelection = new UserDaoImpl();
			break;
		case COURSEDAO:
			daoSelection = new CourseDaoImpl();
			break;
		case MEDICALDAO:
			daoSelection = new MedicalDaoImpl();
			break;
		case GUARDIANDAO:
			daoSelection = new GuardianDaoImpl();
			break;
		default:
			break;
		}
		return daoSelection;
	}


}
