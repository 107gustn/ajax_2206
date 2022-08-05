package com.care.ajax;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController //데이터만 return 시켜줌
public class TestController {
	
	@GetMapping(value = "test", produces = "application/json; charset=utf-8")
	public String test() {
		return "안녕하세요"; //메세지값 리턴시켜줌
	}
	
	@GetMapping(value = "rest", produces = "application/json; charset=utf-8")
	public String get() {
		return "{\"key\" : \"get : 데이터 요청\"}";
	}
	
	@PostMapping(value = "rest", produces = "application/json; charset=utf-8")
	public String post() {
		return "{\"key\" : \"post : 데이터 추가\"}";
	}
	
	@PutMapping(value = "rest", produces = "application/json; charset=utf-8")
	public String put() {
		return "{\"key\" : \"put : 데이터 수정\"}";
	}
	
	@DeleteMapping(value = "rest", produces = "application/json; charset=utf-8")
	public String delete() {
		return "{\"key\" : \"delete : 데이터 삭제\"}";
	}
	
	static int cnt = 0;
	static Map<String, InfoDTO> DB = new HashMap<>();
	@GetMapping(value = "users", produces = "application/json; charset=utf-8")
	public ArrayList<InfoDTO> users() {
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		for(int i=cnt ; i<cnt+10 ; i++) {
			InfoDTO info = new InfoDTO();
			info.setName("홍길동" + i);
			info.setAge(10 + i);
			
			list.add(info);
			DB.put("홍길동" + i, info);
		}
		cnt += 10;
		return list;
	}
	
	@GetMapping(value="user", produces = "application/json; charset=utf-8")
	public InfoDTO user(@RequestParam String id ) {
		System.out.println("id : " + id);
		return DB.get(id);
	}
	
	@GetMapping(value="user2/{userId}", produces = "application/json; charset=utf-8") //{가변적인 데이터를 받아줌}
	public InfoDTO user2( @PathVariable String userId ) { //@PathVariable: 경로값을 변수처럼 처리해줌
		return DB.get(userId);
	}
	
	@PutMapping(value="modify", produces = "application/json; charset=utf-8")
	public void modify(@RequestBody InfoDTO dto) {
		DB.replace(dto.getName(), dto );
	}
	
	@PostMapping(value="membership", produces = "application/json; charset=utf-8")
	public Boolean membership(@RequestBody Map<String, String> map) {
		System.out.println(map.get("uId"));
		System.out.println(map.get("uName"));
		System.out.println(map.get("uAge"));
		System.out.println(map.get("uAddr"));
		System.out.println(map.get("uPhone"));
		return false;
	}
	

}
