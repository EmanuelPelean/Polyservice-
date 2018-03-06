/**
 * 
 */
package com.polyservice.dao;

import com.polyservice.dto.StudentInfoDto;

/**
 * @author Manu
 *
 */
public interface UsersDao {
	
	void insertUser(StudentInfoDto newUser);

}
