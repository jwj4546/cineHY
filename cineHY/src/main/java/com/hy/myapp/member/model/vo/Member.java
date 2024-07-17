package com.hy.myapp.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Member {

	
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phoneNo;
	private String address;
	private String gender;
	private String birthDate;
	private String preGenre1;
	private String preGenre2;
	private String userNick;
	private Date joinDate;
	private Date modifyDate;
	private String status;
	private String profileUrl;
	
}
