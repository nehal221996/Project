package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.service.SchoolService;
import com.demo.service.StudentService;

@Controller
@RequestMapping(value = "/school")
public class StudentController 
{
	SchoolService schoolService;
	
	StudentService studentService;
}
