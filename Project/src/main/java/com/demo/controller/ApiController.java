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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Admin;
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
		System.out.println("studentList " + studentList);
		resp.put("data", studentList);
		return resp;

	}

	@RequestMapping(value = "/getAllSchool", method = RequestMethod.GET)
	public Map<String, Object> getAllSchool(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		List<School> schoolList = schoolService.getSchool();
		Map<String, Object> resp = new HashMap<String, Object>();
		System.out.println("schoolList " + schoolList);
		resp.put("data", schoolList);
		return resp;

	}

	@RequestMapping(value = "/getAllStudent", method = RequestMethod.GET)
	public Map<String, Object> getAllStudent(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		List<Student> s = studentService.allStudent();
		System.out.println(s);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("data", s);
		return resp;

	}

	// for ajax call in student_view
	@RequestMapping(value = "/studentPagination/{pageNo}/{propertyPerPage}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getEmployeePage(HttpServletRequest request, @PathVariable Integer pageNo,
			@PathVariable Integer propertyPerPage) throws ParseException {
		System.out.println("pageno " + pageNo);
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		int sid = school.getId();
		System.out.println("schoolId " + sid);
		String search = request.getParameter("search[value]");
		System.out.println("search is:" + search);
		int page_id = pageNo;
		int total = propertyPerPage;
		if (page_id == 1) { // do nothing!

		} else {
			page_id = (page_id - 1) * total + 1;
		}
		List<Student> std = studentService.getStudentsByPage(sid, page_id, total, search);
		Long search_size = studentService.countEmployeesBySearch(sid, search);
		System.out.println("stduentList " + std);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("data", std);
		map.put("recordsTotal", search_size);
		map.put("recordsFiltered", search_size);
		return map;

	}

	@RequestMapping(value = "/delete")
	public ModelAndView deleteData(@RequestParam(value = "id", required = true) Integer id,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		if (school == null) {

			return new ModelAndView("redirect:/school/index");
		} else {
			ModelAndView m = new ModelAndView();
			studentService.deleteData(id);
			m.setViewName("redirect:/school/student_view");
			return m;
		}
	}

}
