package com.demo.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.demo.model.School;
import com.demo.model.Student;
import com.demo.service.SchoolService;
import com.demo.service.StudentService;

@RestController
@RequestMapping(value = "/api")
public class ApiController

{
	@Autowired
	SchoolService schoolService;

	@Autowired
	StudentService studentService;

	@RequestMapping(value = "/getSchools", method = RequestMethod.GET)
	public Map<String, Object> getSchools() throws MalformedURLException, IOException, ParseException {

		List<School> schoolList = schoolService.getSchoolList();
		// System.out.println(schoolList);
		System.out.println(schoolList.size());
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("data", schoolList);
		return resp;
	}

	@RequestMapping(value = "/getStudent", method = RequestMethod.GET)
	public Map<String, Object> getStudent(HttpServletRequest request) {

		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		int schoolId = school.getId();
		System.out.println("sid" + schoolId);
		List<Student> studentList = studentService.getStudentListBySchoolId(schoolId);
		Map<String, Object> resp = new HashMap<String, Object>();
		System.out.println("studentList " +studentList);
		resp.put("data", studentList);
		return resp;

	}
}
