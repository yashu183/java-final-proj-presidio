package com.dao;

import com.entity.User;

public interface UsersList {
	public User findById(int id) throws Exception;
}
