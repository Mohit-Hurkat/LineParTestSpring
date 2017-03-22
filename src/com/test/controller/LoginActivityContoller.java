package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.catalina.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Admin;
import com.test.bean.QuestionAnalytics;
import com.test.bean.Student;
import com.test.bean.Subject;
import com.test.bean.User;
import com.test.bl.AdminLogic;
import com.test.bl.QuestionAnalyticsLogic;
import com.test.bl.StudentLogic;
import com.test.bl.SubjectLogic;

@Controller
@RequestMapping("/")
@SessionAttributes({ "studentSession", "adminSession", "message", "message1" })
public class LoginActivityContoller {
	private AdminLogic adminLogic = new AdminLogic();
	private StudentLogic studentLogic = new StudentLogic();
	private QuestionAnalyticsLogic quesAnalyticsLogic = new QuestionAnalyticsLogic();
	private SubjectLogic subjectLogic = new SubjectLogic();

	@RequestMapping(method = RequestMethod.GET)
	public String newLogin(ModelMap model) {
		Student student = new Student();
		model.addAttribute("student", student);
		User user = new User();
		model.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(value = "/signUp")
	public String signUp(ModelMap model, @Valid Student student, BindingResult result)
			throws ClassNotFoundException, IOException, SQLException {
		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "home"; // "redirect:/signUp/";
		} else {
			student=studentLogic.search(student.getUsername());
			if(student==null){
			if (studentLogic.insert(student)) {
				model.addAttribute("success", "Sign up Successful");
				return "./Student/success";
			}
			else{
				model.addAttribute("success", "Sign up Unsuccessful");
				return "./Student/success";
			}
			}
			else{
				model.addAttribute("message", "Username Already Exist");
				model.addAttribute("message", "Please Sign Up Using Another Username");
				return "lost";
			}
		}
		
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
				Student student=studentLogic.search(user.getUsername());
				if(!student.equals(null)){
				if (studentLogic.check(user.getUsername(), user.getPassword())) {
					student = studentLogic.search(user.getUsername());
					model.addAttribute("studentSession", student);
					return "/Student/student";
				} else {
					model.addAttribute("message", "Invalid Credentials");
					model.addAttribute("message1", "Please Go Back To LogIn");
					return "lost";
				}

			}
				else{
					model.addAttribute("message", "Username Not Valid");
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

	@RequestMapping(value = "/AdminBack")
	public String AdminBack(ModelMap model) {
		return "./Admin/adminSignIn";
	}

	@RequestMapping(value = "/Analyticss")
	public String Analyticss(ModelMap model, Subject subject) throws ClassNotFoundException, IOException, SQLException {
		model.addAttribute("subjectAnalytics", subjectLogic.search(subject.getSubjectId()));
		List<QuestionAnalytics> quesAnalytics = (List<QuestionAnalytics>) quesAnalyticsLogic
				.displayTop(subject.getSubjectId());
		List<Integer> AnalyticsList = new ArrayList<>();
		int analytics = 0;
		AnalyticsList.add(analytics);
		for (QuestionAnalytics ques : quesAnalytics) {
			analytics = ques.getAnalytics();
			AnalyticsList.add(analytics);
		}
		AnalyticsList.add(50);
		AnalyticsList.add(50);
		AnalyticsList.add(50);
		AnalyticsList.add(50);
		model.addAttribute("AnalyticsListTop", AnalyticsList);
		model.addAttribute("QuesAnalyticsTop", quesAnalytics);
		quesAnalytics = null;
		quesAnalytics = (List<QuestionAnalytics>) quesAnalyticsLogic.displayBottom(subject.getSubjectId());
		List<Integer> AnalyticsList1 = new ArrayList<>();
		analytics = 0;
		AnalyticsList1.add(analytics);
		for (QuestionAnalytics ques : quesAnalytics) {
			analytics = ques.getAnalytics();
			AnalyticsList1.add(analytics);
		}
		AnalyticsList1.add(50);
		AnalyticsList1.add(50);
		AnalyticsList1.add(50);
		AnalyticsList1.add(50);
		model.addAttribute("AnalyticsListBottom", AnalyticsList1);
		model.addAttribute("QuesAnalyticsBottom", quesAnalytics);
		return "./Admin/AdminAdmin/analytics";
	}

	@RequestMapping(value = "/admin")
	public String Admin(ModelMap model) {
		return "/Admin/adminSignIn";
	}
	
	@RequestMapping(value = "/Lost")
	public String Lost(ModelMap model) {
		model.addAttribute("message", "Oops! It looks like you're lost.");
		model.addAttribute("message1", "Sorry about that.");
		return "lost";
	}

	@RequestMapping(value = "/student")
	public String Student(ModelMap model) {
		return "/Student/student";
	}

}
