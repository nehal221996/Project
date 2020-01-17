package com.demo.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.config.ScheduledTaskHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.School;
import com.demo.model.Student;
import com.demo.service.SchoolService;
import com.demo.service.StudentService;
import com.demo.util.PDFGenerator;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = "/school")
public class SchoolController {
	@Autowired
	SchoolService schoolService;

	@Autowired
	StudentService studentService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView registration(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		School s = (School) session.getAttribute("school");
		model.setViewName("registration");
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@RequestParam("school_name") String school_name,
			@RequestParam("school_email") String school_email, @RequestParam("school_pass") String school_pass,
			@RequestParam("image") MultipartFile file) throws IOException {
		System.out.println(file);
		School school = new School();
		if (file != null && !file.isEmpty()) {
			byte[] bFile = new byte[(int) file.getSize()];
			bFile = file.getBytes();
			school.setImage(bFile);
			System.out.println(file.getSize());
		}

		school.setSchool_name(school_name);
		school.setSchool_email(school_email);
		school.setSchool_pass(encryptThisString(school_pass));
		System.out.println(school_pass);
		System.out.println(school);

		schoolService.saveSchool(school);
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:index");
		/*
		 * String msg = "Registration Successfully"; model.addObject("msg", msg);
		 */

		return model;

	}

	/*
	 * @RequestMapping("/display") public ModelAndView show(HttpServletRequest
	 * request) { HttpSession session=request.getSession(); School s=(School)
	 * session.getAttribute("school"); ModelAndView m=new ModelAndView(); if(s ==
	 * null) { m.setViewName("redirect:index");
	 * 
	 * } else { List<School> sdata=schoolService.getSchoolList();
	 * System.out.println("sdata"); System.out.println(sdata);
	 * m.addObject("sdata",sdata); m.addObject("school", s); String base64Encoded =
	 * Base64.getEncoder().encodeToString(s.getImage()); m.addObject("Image",
	 * base64Encoded); m.setViewName("school_profile");
	 * 
	 * } return m;
	 * 
	 * }
	 */

	@RequestMapping("/display")
	public ModelAndView show(HttpServletRequest request) {
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		ModelAndView m = new ModelAndView();
		if (school == null) {
			m.setViewName("redirect:index");

		} else {
			/*
			 * List<School> sdata=schoolService.getSchoolList();
			 * System.out.println("sdata"); System.out.println(sdata);
			 * m.addObject("sdata",sdata); m.addObject("school", s); String base64Encoded =
			 * Base64.getEncoder().encodeToString(s.getImage()); m.addObject("Image",
			 * base64Encoded); m.setViewName("school_profile");
			 */

			int schoolId = school.getId();
			System.out.println(schoolId);
			m.addObject("school", school);
			String base64Encoded = Base64.getEncoder().encodeToString(school.getImage());
			m.addObject("Image", base64Encoded);
			m.setViewName("school_profile");
		}
		return m;

	}

	@RequestMapping("/add_student")
	public ModelAndView register(HttpServletRequest request) {
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		ModelAndView page = new ModelAndView();

		if (school == null) {
			page.setViewName("redirect:index");
		} else {
			page.addObject("school", school);
			page.setViewName("add_student");
		}
		return page;

	}

	@RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
	public ModelAndView saveEmployee(HttpServletRequest request, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("dob") String dob, @RequestParam("gender") String gender,
			@RequestParam("address") String address, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("pincode") String pincode,
			@RequestParam("contact_no") String contact_no, @RequestParam("doj") String doj,
			@RequestParam("password") String password) {
		ModelAndView model = new ModelAndView();
		Student std = new Student();

		HttpSession session = request.getSession();
		School s = (School) session.getAttribute("school");
		int sid = s.getId();
		System.out.println(sid);

		// std.setId(id);
		std.setName(name);
		std.setEmail(email);
		std.setDob(dob);
		std.setGender(gender);
		std.setAddress(address);
		std.setState(state);
		std.setCity(city);
		std.setPincode(pincode);
		std.setContact_no(contact_no);
		std.setDoj(doj);
		std.setPassword(encryptThisString(password));
		std.setSchoolId(sid);
		/* std.setSchool_id(school_id); */

		studentService.saveStudent(std);
		model.addObject("student", s);
		model.setViewName("redirect:display");

		return model;
	}

	@RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
	public ModelAndView updateEmployee(HttpServletRequest request, @RequestParam("id") int id,
			@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("dob") String dob,
			@RequestParam("gender") String gender, @RequestParam("address") String address,
			@RequestParam("city") String city, @RequestParam("state") String state,
			@RequestParam("pincode") String pincode, @RequestParam("contact_no") String contact_no,
			@RequestParam("doj") String doj, @RequestParam("password") String password) {
		ModelAndView model = new ModelAndView();
		Student std = new Student();

		HttpSession session = request.getSession();
		School s = (School) session.getAttribute("school");

		std.setId(id);
		std.setName(name);
		std.setEmail(email);
		std.setDob(dob);
		std.setGender(gender);
		std.setAddress(address);
		std.setState(state);
		std.setCity(city);
		std.setPincode(pincode);
		std.setContact_no(contact_no);
		std.setDoj(doj);
		std.setPassword(encryptThisString(password));
		// std.setSchoolId(schoolId);
		/* std.setSchool_id(school_id); */

		studentService.updateDataById(std);
		model.addObject("std", std);
		model.setViewName("redirect:profile");

		return model;
	}

	@RequestMapping(value = "/student_view", method = RequestMethod.GET)
	public ModelAndView getEmployee(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");

		if (school == null) {
			model.setViewName("redirect:index");

		} else {
			/*
			 * List<Student> stddata = studentService.getStudentList();
			 * System.out.println("stddata"); System.out.println(stddata);
			 * model.addObject("stddata", stddata); model.addObject("school", school);
			 * model.setViewName("student_view");
			 */

			int schoolId = school.getId();
			System.out.println("sid" + schoolId);
			List<Student> stddata = studentService.getStudentListBySchoolId(schoolId);
			System.out.println("stddata");
			System.out.println(stddata);
			model.addObject("stddata", stddata);
			model.addObject("school", school);
			model.setViewName("student_view");
		}
		return model;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteData(@RequestParam("did") int did) {
		ModelAndView m = new ModelAndView();
		studentService.deleteData(did);
		m.setViewName("redirect:student_view");
		return m;
	}

	// download the student list in pdf
	@GetMapping(value = "/studentdownload", produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> customerReport(HttpServletRequest request) throws IOException {
		
		   HttpSession session = request.getSession(); 
		   
		   System.out.println("studentDownload");
		   School s=(School) session.getAttribute("school");
		   int sid=s.getId();
		 
		   
		   /*Student s = (Student) session.getAttribute("s");
			int sid = s.getId();*/
		// int sid = s.getSchoolId();

		System.out.println("sid:" + sid);
		
		
		List<Student> student = studentService.studentBySchoolId(sid);
		School school = schoolService.getSchoolById(sid);
		ByteArrayInputStream bis = PDFGenerator.customerPDFReport(student, school);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=student_list.pdf");

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		Student student = (Student) session.getAttribute("student");

		if (student == null) {

			model.setViewName("redirect:index");
		} else {
			int schoolId = student.getSchoolId();
			model.addObject("school", school);
			model.addObject("student", student);

			// model.addObject("student", school);
			model.setViewName("student_profile");
		}
		return model;

		/*
		 * ModelAndView model=new ModelAndView(); HttpSession session =
		 * request.getSession(); School school=(School) session.getAttribute("school");
		 * Student student = (Student) session.getAttribute("student"); if(school ==
		 * null) { model.addObject("school", school); model.setViewName("admin"); } else
		 * { int schoolId = student.getSchoolId(); model.addObject("school", school);
		 * model.addObject("student", student); model.setViewName("student_profile"); }
		 * return model;
		 */
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView openLogout(HttpSession session) {

		session.invalidate();
		// session = request.getSession(false);
		// System.out.println("Session : " + session);
		ModelAndView page = new ModelAndView();
		School school = new School();
		Student student = new Student();
		page.addObject("student", student);
		page.addObject("school", school);
		page.setViewName("redirect:index");
		String msg = "You are Successfully Logout";
		page.addObject("msg", msg);
		return page;
	}

	@RequestMapping(value = "/update")
	public ModelAndView updateData(@RequestParam("uid") int uid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// School school=(School) session.getAttribute("school");
		Student student = (Student) session.getAttribute("student");
		ModelAndView m = new ModelAndView();

		if (student != null) {
			Student std = studentService.getDataById(uid);
			m.addObject("student", std);
			m.addObject("student", student);
			m.setViewName("updateStudent");

		} else {
			m.setViewName("redirect:index");
		}

		return m;
	}

	@RequestMapping(value = "/resetpassword")
	public ModelAndView resetPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// School school=(School) session.getAttribute("school");
		Student student = (Student) session.getAttribute("student");
		ModelAndView model = new ModelAndView();
		if (student == null) {
			model.setViewName("redirect:index");
		} else {
			model.addObject("student", student);
			model.setViewName("resetPassword");
		}
		return model;
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public ModelAndView updatePass(HttpServletRequest request, Model model, @RequestParam("pass") String new_password) {

		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		int id = student.getId();
		List<Student> std = studentService.getStudentById(id);
		String newpassword = encryptThisString(new_password);
		System.out.println("encrypted new password" + newpassword);
		studentService.updatePassword(newpassword, id);
		String msg = "Your Password is Successfully Reset";
		model.addAttribute("msg", msg);
		ModelAndView page = new ModelAndView();
		page.setViewName("student_profile");
		return page;

	}

	@RequestMapping(value = "/schoolResetPassword")
	public ModelAndView schoolResetPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		ModelAndView model = new ModelAndView();
		if (school == null) {
			model.setViewName("redirect:index");
		} else {
			model.addObject("school", school);
			model.setViewName("schoolResetPassword");
		}
		return model;
	}

	@RequestMapping(value = "/updateSchoolPass", method = RequestMethod.POST)
	public ModelAndView updateSchoolPass(HttpServletRequest request, Model model,
			@RequestParam("pass") String new_password) {

		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		int id = school.getId();
		List<School> std = schoolService.SchoolById(id);
		String newpassword = encryptThisString(new_password);
		System.out.println("encrypted new password" + newpassword);
		schoolService.updatePassword(newpassword, id);
		String msg = "Your Password is Successfully Reset";
		model.addAttribute("msg", msg);
		ModelAndView page = new ModelAndView();
		page.setViewName("redirect:display");
		return page;

	}

	@RequestMapping(value = "/schoolInfo", method = RequestMethod.GET)
	public ModelAndView schoolInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		School school = (School) session.getAttribute("school");
		ModelAndView model = new ModelAndView();
		if (student == null) {
			model.setViewName("redirect:index");
		} else {

			/*
			 * int Id = school.getId(); model.addObject("school", school);
			 * System.out.println(Id); String base64Encoded =
			 * Base64.getEncoder().encodeToString(school.getImage());
			 * model.addObject("Image", base64Encoded); model.addObject("student", student);
			 * model.setViewName("schoolInfo");
			 */

			int schoolId = student.getSchoolId();

			System.out.println(schoolId);
			/* List<School> s = schoolService.getSchoolDetailById(schoolId); */
			model.addObject("schoolId", schoolId);
			/* model.addObject("school", s); */
			model.addObject("student", student);
			model.setViewName("schoolInfo");
		}
		return model;
	}

	// representing the line chart doj vs no. of student
	@RequestMapping("/line")
	public ModelAndView showHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		School school = (School) session.getAttribute("school");
		ModelAndView model = new ModelAndView();
		if (school == null) {
			model.setViewName("redirect:index");
		} else {

			model.setViewName("linechart");

		}
		return model;
	}

	@RequestMapping(value = "/linechartdata")
	@ResponseBody
	public String getDataFromDisplay1(HttpServletRequest request) throws ParseException {
		
		HttpSession session = request.getSession();
		School s=(School) session.getAttribute("school");
		int sid=s.getId();
		List<Student> std=studentService.studentBySchoolId(sid);
		
		Map<String, Integer> map= new HashMap<String, Integer>();
		
		for(Student std1: std)
		{
			String date=std1.getDoj();
			System.out.println("date is:" +date);
		    DateFormat inputFormatter = new SimpleDateFormat("yyyy-MM-dd"); // converting string to date 
		    Date da = (Date) inputFormatter.parse(date);
		    DateFormat outputFormatter = new SimpleDateFormat("dd-MM-yyyy");// converting date to string again in
																								// dd-mm-yyyy formate
			String strDateTime = outputFormatter.format(da);
			
			System.out.println("String date is : " + strDateTime);
			
			if (map.containsKey(strDateTime))
			{
				int count = map.get(strDateTime); // counting no of employee join in same date
				map.put(strDateTime, count + 1);
			}
			else
			{
				map.put(strDateTime, 1);
			}
			
		}

		JsonArray jsonArrayCategory = new JsonArray();
		JsonArray jsonArraySeries = new JsonArray();
		JsonObject jsonObject = new JsonObject();
		for (Map.Entry<String, Integer> entry : map.entrySet())
		{
			jsonArrayCategory.add(entry.getKey());
			jsonArraySeries.add(entry.getValue());
		}
		jsonObject.add("categories", jsonArrayCategory);
		jsonObject.add("series", jsonArraySeries);
		// model.addObject("school", school);
		return jsonObject.toString();

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
