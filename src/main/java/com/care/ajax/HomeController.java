package com.care.ajax;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Handles requests for the application home page.
 */
@Controller //페이지, 데이터를 return 해줌 
//@RestController //데이터만 return 해줌
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("non_ajax")
	public String non_ajax() {
		return "non_ajax";
	}
	
	@GetMapping("ajax01")
	public String ajax01() {
		System.out.println("aaaa");
		return "ajax";
	}
	
	@GetMapping("ajax02")
	public String ajax02() {
		System.out.println("aaaa");
		return "ajax02";
	}
	
	static int cnt = 0;
	@GetMapping("ajax_result02")
	@ResponseBody //return값을 jsp페이지가 아닌 data값으로 돌려줌
	public String ajax_result02() {
		return ++cnt + ""; //숫자 + 문자열 = 문자열 //문자열로 변환해서 돌려줌
	}
	
	@GetMapping("ajax03")
	public String ajax03() {
		return "ajax03";
	}
	
	@PostMapping(value="ajax_result03", produces = "application/json; charset=utf8") //produces: 받는타입 명시
	@ResponseBody
	public InfoDTO ajax_result03(@RequestBody InfoDTO dto) {
		System.out.println("이름 : " + dto.getName());
		System.out.println("나이 : " + dto.getAge());
		return dto;
	}
	
	@GetMapping("ajax04")
	public String ajax04() {
		return "ajax04";
	}
	
	@PostMapping(value="ajax_result04", produces = "application/json; charset=utf8") //produces: 받는타입 명시
	@ResponseBody
	public Map ajax_result04(@RequestBody Map dto) { //dto에 없는 형식의 값이 들어오면 Map으로 받아준다.
		System.out.println("이름 : " + dto.get("name")); //키값으로 값을 꺼내온다
		System.out.println("나이 : " + dto.get("age"));
		System.out.println("주소 : " + dto.get("addr"));
		return dto;
	}
	
	@GetMapping("rest01")
	public String rest01() {
		return "rest01";
	}
	
	@GetMapping("getuser")
	public String getuser() {
		return "getuser";
	}
	
}
