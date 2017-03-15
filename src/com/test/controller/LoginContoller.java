package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.bean.Student;
import com.test.bean.User;
import com.test.bl.AdminLogic;

@Controller
@RequestMapping("/")
public class LoginContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminLogic adminLogic = new AdminLogic();
	
	@RequestMapping(method = RequestMethod.GET)
	public String newLogin(ModelMap model) {
		Student student = new Student();
		model.addAttribute("student", student);
		User user=new User();
		model.addAttribute("user", user);
		return "home";
	}
	
	@RequestMapping(value="/signIn", method = RequestMethod.POST)
	public String signIn(ModelMap model,@Valid Student student, BindingResult result) {
		if(result.hasErrors()){
			model.addAttribute("user", new User());
			return "home";
		}
		else{
			return "lost";
		}
	}
	
	@RequestMapping(value="/logIn", method = RequestMethod.POST)
	public String logIn(HttpSession session,ModelMap model,@Valid User user, BindingResult result) throws ClassNotFoundException, IOException, SQLException {
		if(result.hasErrors()){
			model.addAttribute("student", new Student());
			return "home";
		}
		else{
			if(user.getUsername().equals("admin")){
				if(adminLogic.check(user.getUsername(), user.getPassword())){
					session.setAttribute("admin", "admin");
					return"/Admin/adminSignIn";
				}
				else{
					session.setAttribute("message", "Invalid Credentials");
					session.setAttribute("message1", "Hey Admin,We Don't Expect This From You.");
					return "../lost";
				}
			}
			return "lost";
		}
	}
}
