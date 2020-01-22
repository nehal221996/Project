package com.demo.restController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api")
public class SchoolRestApiController {
	
	
	@GetMapping("/school_token")
	public Map<String, Object> getCompanyByToken(
			@RequestHeader(name = "Authorization", required=false) String token) {
		
		System.out.println(token);

		if (token != null) {
			boolean isValid = token
					.matches("([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})");
			System.out.print("checking string is valid uuid" + isValid);

			Map<String, Object> map = new HashMap<String, Object>();
			return map;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("status", "401");
			map.put("error", "Unauthorized Access");
			System.out.print("map" + map);
			return map;
		}

	}
}
