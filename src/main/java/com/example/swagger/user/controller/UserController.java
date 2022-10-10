package com.example.swagger.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.swagger.user.service.UserService;

@RestController
public class UserController {
		
	@Autowired
	UserService userService;

}
