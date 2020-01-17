package com.demo.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.School;
import com.demo.model.Student;
import com.demo.service.SchoolService;
import com.demo.service.StudentService;

@Controller
@RequestMapping(value = "/school")
public class LoginController {
	@Autowired
	StudentService studentService;

	@Autowired
	SchoolService schoolService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView blankRequest() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "/alllogin", method = RequestMethod.POST)
	public ModelAndView loginR(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("login_as") String login_as, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();

		// checking if user belongs to school or student
		if ("student".equals(login_as)) {
			String pass = encryptThisString(password);
			Student std = studentService.getStudentDetail(email, pass);
			
			/*int id = 0;
			for(Student s : std)
			{
				id = s.getId();
			}*/
			
			
			
			if (std != null) {
				HttpSession session = request.getSession();
				session.setAttribute("student", std);
				model.setViewName("redirect:profile");
				return model;
			} else {
				String msg = "Login Error";
				model.addObject("msg", msg);
				model.setViewName("login");
			}

		} else if ("school".equals(login_as)) {

			String pass = encryptThisString(password);
			School s = schoolService.getSchoolDetail(email, pass);
			if (s != null) {
				HttpSession session = request.getSession();
				session.setAttribute("school", s);
				model.setViewName("redirect:display");
				return model;
			} else {
				String msg = "Login Error";
				model.addObject("msg", msg);
				model.setViewName("login");

			}

		} else {
			ModelAndView page = new ModelAndView();
			page.setViewName("login");
			return page;
		}

		return model;

	}

	public static String encryptThisString(String input) {
		try {
			// getInstance() method is called with algorithm SHA-1
			MessageDigest md = MessageDigest.getInstance("SHA-1");

			// digest() method is called
			// to calculate message digest of the input string
			// returned as array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);

			// Add preceding 0s to make it 32 bit
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}

			// return the HashText
			return hashtext;
		}

		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return input;
	}

}
