package com.example.swagger.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.swagger.user.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
}
