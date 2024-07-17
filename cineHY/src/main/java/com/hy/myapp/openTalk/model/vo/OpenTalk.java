package com.hy.myapp.openTalk.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OpenTalk {
	private String talkId;
	private String userId;
	private String talkContent;
	private String talkSendDate;
	private String userImg;
	private String status;

}
