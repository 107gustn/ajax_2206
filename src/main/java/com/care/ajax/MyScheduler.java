package com.care.ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class MyScheduler {
	
	//@Scheduled(cron = "0-59 * * * * *") //cron: 시간설정
	public void test() {
		System.out.println("매초 실행 됩니다.");
	}
}
