package com.demo.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.School;
import com.demo.service.SchoolService;

@Controller
public class GoogleController

{
	@Autowired
	SchoolService schoolService;

	@RequestMapping(value = "/callback")
	public String signPage(WebRequest request, Model model, HttpServletRequest req, HttpSession session)
			throws MalformedURLException, IOException, ParseException {
		String code = request.getParameter("code");
		System.out.println(code);
		System.out.println("controller");
		String tokeUrl = "https://www.googleapis.com/oauth2/v4/token";
		HttpsURLConnection httpClient = (HttpsURLConnection) new URL(tokeUrl).openConnection();
		String client_id = "732118873335-vcaolepnkn18gu13tlonpo6p1i5beotc.apps.googleusercontent.com";
		String redirect_uri = "http://localhost:8080/callback";
		String c_s = "5lT1G2FVFALWEUZRO60WdtUk";
		String scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile openid";

		String urlParameters = "code=" + code + "&redirect_uri=" + redirect_uri + "&client_id=" + client_id
				+ "&client_secret=" + c_s + "&scope=" + scope + "&grant_type=authorization_code";
		httpClient.setDoOutput(true); // to use Url connection for output

		try (DataOutputStream wr = new DataOutputStream(httpClient.getOutputStream())) {
			wr.writeBytes(urlParameters);
			wr.flush();
		}
		// System.out.println(urlParameters);
		int responseCode = httpClient.getResponseCode(); // Ok
		System.out.println("\nSending 'POST' request to URL : " + tokeUrl);
		System.out.println("Post parameters : " + urlParameters);
		System.out.println("Response Code : " + responseCode);
		String res = null;
		try (BufferedReader in = new BufferedReader(new InputStreamReader(httpClient.getInputStream()))) {

			String line;
			StringBuilder response = new StringBuilder();

			while ((line = in.readLine()) != null) {
				response.append(line);
			}

			// print result
			System.out.println(response.toString());
			res = response.toString();
		} finally {
			httpClient.disconnect();
		}
		System.out.println("check " + res);
		JSONParser parser = new JSONParser();
		JSONObject newJObject = (JSONObject) parser.parse(res);
		String accesstoken = (String) newJObject.get("access_token");
		System.out.println(accesstoken);

		// http get request

		String proUrl = "https://www.googleapis.com/userinfo/v2/me";
		HttpsURLConnection httpClient1 = (HttpsURLConnection) new URL(proUrl).openConnection();
		httpClient1.setRequestMethod("GET");
		httpClient1.setRequestProperty("Authorization", "Bearer " + accesstoken + "");
		// String urlParameter = "Bearer=" + accesstoken + "";
		int responseCode1 = httpClient1.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + proUrl);
		System.out.println("Response Code : " + responseCode1); // ok
		String res_profile = null;

		try (BufferedReader in = new BufferedReader(new InputStreamReader(httpClient1.getInputStream()))) {

			String line1;
			StringBuilder response = new StringBuilder();

			while ((line1 = in.readLine()) != null) {
				response.append(line1);
			}

			// print result
			System.out.println("profile");
			System.out.println(response.toString());
			res_profile = response.toString();
		} finally {
			httpClient1.disconnect();
		}

		JSONParser parser1 = new JSONParser();
		JSONObject newJObject1 = (JSONObject) parser1.parse(res_profile);
		String google_id = (String) newJObject1.get("id");
		String name = (String) newJObject1.get("name");
		String picture = (String) newJObject1.get("picture");
		String email = (String) newJObject1.get("email");
		System.out.println(email);
		System.out.println(name);

		boolean userFound;
		userFound = schoolService.findSchoolBygoogle(google_id, email);
		System.out.println(userFound);

		if (userFound == true) {
			List<School> school = schoolService.getSchoolByEmail(email);

			String school_email = null;
			int school_id = 0;
			String school_pass = null;

			School s = null;
			s = school.get(0);
			school_email = s.getSchool_email();
			school_id = s.getId();
			school_pass = s.getSchool_pass();
			System.out.println(school_email);
			System.out.println(school_id);
			System.out.println(school_pass);

			session = req.getSession();
			session.setAttribute("school", s);

			return ("redirect:/school/display");

		} else {
			model.addAttribute("google_id", google_id);
			model.addAttribute("school_name", name);
			model.addAttribute("image", picture);
			model.addAttribute("school_email", email);
			// model.addAttribute("password", pass);
			ModelAndView page = new ModelAndView();
			page.setViewName("signup");
			return "/signup";
		}

	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView showRegistration() {
		// HttpSession session = request.getSession();
		// String email = (String) session.getAttribute("email");
		// String login = (String) session.getAttribute("login_as");
		// System.out.println(login);
		ModelAndView page = new ModelAndView();
		page.setViewName("signup");
		return page;
	}

	// saving user through google sign in
	@RequestMapping(value = "/school/form", method = RequestMethod.POST)
	public ModelAndView saveSchool(@RequestParam("google_id") String google_id,
			@RequestParam("school_email") String school_email, @RequestParam("school_pass") String school_pass,
			@RequestParam("picture_url") String picture_url, @RequestParam("school_name") String school_name)
			throws IOException {

		String pass = encryptThisString(school_pass);

		School school = new School();
		school.setSchool_name(school_name);
		school.setSchool_email(school_email);
		school.setSchool_pass(pass);
		school.setGoogle_id(google_id);
		school.setPicture_url(picture_url);

		schoolService.saveSchool(school);
		ModelAndView page = new ModelAndView();
		page.setViewName("successRegister");
		return page;

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
