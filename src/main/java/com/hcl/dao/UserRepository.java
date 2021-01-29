package com.hcl.dao;

import org.springframework.data.repository.CrudRepository;
import com.hcl.model.User;

public interface UserRepository extends CrudRepository<User, Long> {
	User findByUserEmail(String userEmail);	
}
