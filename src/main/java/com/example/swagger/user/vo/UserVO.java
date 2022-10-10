package com.example.swagger.user.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {
	private String userEmail;
	private String userPwd;
	private String userNm;
	private String userGubun;
	private Timestamp userIndt;
	private String userUseyn;
}
