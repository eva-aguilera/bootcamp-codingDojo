package com.codingdojo.TGA.Repo;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.TGA.Models.User;

public interface UserRepo extends CrudRepository<User, Long>{
	
	User findByEmail(String email);

}
