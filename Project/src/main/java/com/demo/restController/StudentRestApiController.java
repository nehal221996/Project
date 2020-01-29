package com.demo.restController;

import java.io.IOException;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.demo.model.School;
import com.demo.model.Student;
import com.demo.service.StudentService;

@RestController
@RequestMapping(value = "/api")
public class StudentRestApiController {
	@Autowired
	StudentService studentService;

	@GetMapping("/student_token")
	public Map<String, Object> getCompanyByToken(
			@RequestHeader(name = "Authorization", required = false) String token) {

		System.out.println(token);
		if (token != null) {
			boolean isValid = token
					.matches("([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})");
			System.out.print("checking string is valid uuid" + isValid);

			if (isValid == true) {
				Map<String, Object> map = new HashMap<String, Object>();
				List<Student> student = studentService.getStudentByToken(token);
				map.put("date", student);
				return map;
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("status", "401");
				map.put("error", "Unauthorized Access");
				System.out.print(map);
				return map;
			}
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("status", "401");
			map.put("error", "Unauthorized Access");
			System.out.print(map);
			return map;
		}

	}

	@GetMapping(value = "/studentBySchoolId/{schoolId}")
	public Map<String, Object> getStudent(@PathVariable Integer schoolId) {
		List<Student> studentList = studentService.getStudentListBySchoolId(schoolId);
		Map<String, Object> resp = new HashMap<String, Object>();
		System.out.println("studentList " + studentList);
		resp.put("data", studentList);
		return resp;

	}

	// delete company
	@DeleteMapping("/student/{id}")
	public void deleteCompany(@PathVariable Integer id) {
		studentService.removeStudent(id);
	}

	// getting all the student which is registered
	@GetMapping(value = "/student")
	public List<Student> getStudent() {
		return studentService.allStudent();
	}

	// getting student for particular id
	@GetMapping(value = "/student/{id}")
	public List<Student> getStudentById(@PathVariable Integer id) {
		return studentService.getStudentById(id);
	}

	// save student
	@PostMapping(value = "/student/save")
	public Student createStd(@RequestBody Student std) {
		String encodedPassword = encryptThisString(std.getPassword());
		std.setPassword(encodedPassword);
		return studentService.saveStudent(std);

	}

	// update student 
	@PutMapping("/student/update/{id}")
	public void updateStudent(@PathVariable Integer id, @RequestBody Student std) {
		Student s =studentService.getStudentByIdRest(id);
		s.setName(std.getName());
		s.setAddress(std.getAddress());
		s.setCity(std.getCity());
		s.setState(std.getState());
		studentService.updateStudent(std);
	}

	@GetMapping("/student/schoolId/{schoolId}")
	public List<Student> getStudentBySchoolId(@PathVariable Integer schoolId) {
		List<Student> std = studentService.studentBySchoolId(schoolId);
		return std;

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
			e.printStackTrace();
		}
		return input;
	}

}
