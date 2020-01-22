package com.demo.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.model.Student;
import com.demo.service.StudentService;

@RestController
@RequestMapping(value = "/api")
public class StudentRestApiController
{
	@Autowired
	StudentService studentService;
	
	@GetMapping("/student_token")
	public Map<String, Object> getCompanyByToken(
			@RequestHeader(name = "Authorization", required=false) String token) {
				
		System.out.println(token);
		if (token != null)
		{
			boolean isValid = token
					.matches("([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})");
			System.out.print("checking string is valid uuid" + isValid);
			
			if (isValid == true)
			{
				Map<String, Object> map = new HashMap<String, Object>();
				List<Student> student=studentService.getStudentByToken(token);
				map.put("date", student);
				return map;
			}
			else
			{
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("status", "401");
				map.put("error", "Unauthorized Access");
				System.out.print(map);
				return map;
			}
		}
		else
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("status", "401");
			map.put("error", "Unauthorized Access");
			System.out.print(map);
			return map;
		}
		
		
		
	}
}
