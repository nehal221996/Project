package com.demo.restController;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.demo.model.School;
import com.demo.model.Student;
import com.demo.service.SchoolService;
import com.demo.service.StudentService;

@RestController
@RequestMapping(value = "/api")
public class SchoolRestApiController {

	@Autowired
	SchoolService schoolService;

	@Autowired
	StudentService studentService;

	@GetMapping("/school_token")
	public Map<String, Object> getCompanyByToken(
			@RequestHeader(name = "Authorization", required = false) String token) {

		System.out.println(token);

		if (token != null) {
			boolean isValid = token
					.matches("([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})");
			System.out.print("checking string is valid uuid" + isValid);
			if (isValid == true) {
				Map<String, Object> map = new HashMap<String, Object>();
				List<School> school = schoolService.getSchoolByToken(token);
				map.put("date", school);
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
			System.out.print("map" + map);
			return map;
		}

	}

	// for all school
	@GetMapping(value = "/school")
	public List<School> getSchool() {
		return schoolService.getSchool();
	}

	// for School save
	@PostMapping(value = "/school/schoolSave")
	public @ResponseBody School create(@RequestBody School school) {
		String encodedPassword = encryptThisString(school.getSchool_pass());
		school.setSchool_pass(encodedPassword);
		return schoolService.saveSchool(school);
	}

	// delete school
	@DeleteMapping("/school/delete/{id}")
	public void deleteSchool(@PathVariable Integer id) {
		schoolService.removeSchool(id);
	}

	// get school by id
	@GetMapping("/school/{id}")
	public School getSchoolById(@PathVariable Integer id) {
		return schoolService.getSchoolById(id);

	}

	//updating school info
	@PutMapping("/school/update/{id}")
	public void updateSchool(@PathVariable Integer id, @RequestBody School school) {
			School s=schoolService.getSchoolById(id);
			s.setSchool_name(school.getSchool_name());
			s.setImage(school.getImage());
			schoolService.updateSchool(s);
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
