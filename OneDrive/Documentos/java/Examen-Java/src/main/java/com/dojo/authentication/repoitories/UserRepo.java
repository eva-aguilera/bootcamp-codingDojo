package com.dojo.authentication.repoitories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.dojo.authentication.models.User;

public interface UserRepo extends CrudRepository<User, Long>{
	
	List<User> findAll();
	User findByEmail(String email);

}
