/**
 * 
 */
package com.polyservice.factory;

import com.polyservice.dao.UserDaoImpl;
import com.polyservice.dao.UsersDao;

/**
 * @author Manu
 *
 */
public class DaoFactory {
	
public static final String USERSDAO = "userdao";

	public static UsersDao getInstance(String type) {
		UserDaoImpl daoimpl = null;
		switch (type) {
		case USERSDAO: 
			daoimpl = new UserDaoImpl();
			break;
		default:
			break;
		}
		return daoimpl;
	}

}
