package com.hy.myapp.openTalk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hy.myapp.openTalk.model.service.OpenTalkService;
import com.hy.myapp.openTalk.model.vo.OpenTalk;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class OpenTalkController {
	
	@Autowired
	private OpenTalkService opentalkService;
	
	@GetMapping("connect-form")
	public String connect() {
		
		return "openTalk/connect";
	}
	
	//@GetMapping("group-chat")
	//public String group() {
		
	//	return "openTalk/openTalk";
	//}
	
	@GetMapping("group-chat")  //조회된 채팅 내역 전달 
    public String getOpenTalkMessages(Model model) {
        List<OpenTalk> openTalkList = opentalkService.selectMessage();
        model.addAttribute("openTalkList", openTalkList);
        log.info("OpenTalk List: {}", openTalkList);
        return "openTalk/openTalk";
    }
	
	
	
	
}
