package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Admin;
import com.test.bean.Student;
import com.test.bean.User;
import com.test.bl.AdminLogic;
import com.test.bl.StudentLogic;

@Controller
@RequestMapping("/")
@SessionAttributes({ "studentSession", "adminSession" ,"message","message1" })
public class LoginActivityContoller {
	private AdminLogic adminLogic = new AdminLogic();
	private StudentLogic studentLogic = new StudentLogic();

	@RequestMapping(method = RequestMethod.GET)
	public String newLogin(ModelMap model) {
		Student student = new Student();
		model.addAttribute("student", student);
		User user = new User();
		model.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(ModelMap model, @Valid Student student, BindingResult result)
			throws ClassNotFoundException, IOException, SQLException {
		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "home"; // "redirect:/signUp/";
		} else {
			if (studentLogic.insert(student)) {
				return "./Student/success";
			}
		}
		return "lost";
	}

	@RequestMapping(value = "/logIn", method = RequestMethod.POST)

	public String logIn(ModelMap model, @Valid User user, BindingResult result)
			throws ClassNotFoundException, IOException, SQLException {
		if (result.hasErrors()) {
			model.addAttribute("student", new Student());
			return "home";
		} else {
			if (user.getUsername().equals("admin")) {
				if (adminLogic.check(user.getUsername(), user.getPassword())) {
					Admin admin = adminLogic.search(user.getUsername());
					model.addAttribute("adminSession", admin);
					return "/Admin/adminPreloader";
				} else {
					model.addAttribute("message", "Invalid Credentials");
					model.addAttribute("message1", "Hey Admin,We Don't Expect This From You.");
					return "lost";
				}
			} else {
				if (studentLogic.check(user.getUsername(), user.getPassword())) {
					Student student = studentLogic.search(user.getUsername());
					model.addAttribute("studentSession", student);
					return "/Student/student";
				} else {
					model.addAttribute("message", "Invalid Credentials");
					model.addAttribute("message1", "Please Go Back To LogIn");
					return "lost";
				}

			}
		}
	}

	@RequestMapping(value = "/StudentBack", method = RequestMethod.POST)
	public String StudentBack(ModelMap model) {
		return "./Student/student";
	}

	@RequestMapping(value = "/AdminBack", method = RequestMethod.POST)
	public String AdminBack(ModelMap model) {
		return "./Admin/adminSignIn";
	}
	
	@RequestMapping(value = "/Lost")
	public String Lost(ModelMap model) {
		return "lost";
	}
	
	@RequestMapping(value = "/admin")
	public String Admin(ModelMap model) {
		return "/Admin/adminSignIn";
	}
	
	@RequestMapping(value = "/student")
	public String Student(ModelMap model) {
		return "/Student/student";
	}


}
