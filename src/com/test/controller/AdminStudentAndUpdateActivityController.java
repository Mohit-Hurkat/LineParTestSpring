package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Student;
import com.test.bl.StudentLogic;


@Controller
@SessionAttributes({  "studentDisplayAll","student" })
public class AdminStudentAndUpdateActivityController {
	private StudentLogic studentLogic = new StudentLogic();
	private Student student=new Student();
	
	@RequestMapping(value = "/deleteStudentAdmin")
	public String DeleteStudent(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Student> studentDisplay = studentLogic.displayAll();
		model.addAttribute("studentDisplayAll", studentDisplay);
		model.addAttribute("student", student);
		return "./Admin/AdminStudent/deleteStudent";
	}
	
	@RequestMapping(value = "/adminStudentDelete")
	public String AdminQuestionDelete(ModelMap model,Student student) throws ClassNotFoundException, IOException, SQLException {
		if(studentLogic.delete(student.getUsername())){
			model.addAttribute("mess", "Successfully Deleted.");
			return "./Admin/adminSubject";
		}
		return "lost";
	}
	
	@RequestMapping(value = "/viewStudentAdmin")
	public String AdminQuestionDisplay(ModelMap model,Student student) throws ClassNotFoundException, IOException, SQLException {
		List<Student> studentDisplay = studentLogic.displayAll();
		model.addAttribute("studentDisplayAll", studentDisplay);
		model.addAttribute("student", student);
		return "./Admin/AdminStudent/viewAllStudents";
	}
	
}
