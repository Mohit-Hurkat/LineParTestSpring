package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Student;
import com.test.bean.Subject;
import com.test.bean.User;
import com.test.bl.StudentLogic;
import com.test.bl.SubjectLogic;

@Controller
@SessionAttributes({"stud","studentSession","user"})
public class StudentActivityController{
	private SubjectLogic subjectLogic=new SubjectLogic();
	private StudentLogic studentLogic=new StudentLogic();
	
	@RequestMapping(value="/studentTest", method = RequestMethod.POST)
	public String GiveTest(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		if(subjectDisplay!=null){
			model.addAttribute("subjectDisplay",subjectDisplay);
			return "./Student/studentGiveTest";
		}
		return "./Student/student";
	}
	
	@RequestMapping(value="/studentUpdate")
	public String StudentUpdate(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		System.out.println("f");
		Student student=(Student) model.get("studentSession");
		student=studentLogic.search(student.getUsername());
		model.addAttribute("student", student);
			return "./Student/studentUpdateInfo";
	}
	
	@RequestMapping(value="/studentUpdateFinal")
	public String StudentUpdateFinal(ModelMap model,Student student) throws ClassNotFoundException, IOException, SQLException {
		System.out.println("g");
		System.out.println(student);
		Student stud=(Student) model.get("studentSession");
		student.setUsername(stud.getUsername());
		System.out.println(student);
		if(studentLogic.update(student.getUsername(), student)){
			model.addAttribute("studentMessage", "Successfully Updated.");
			return "./Student/updateStudent";
		}
		return "./Student/student";
		
	}
	
	@RequestMapping(value="/StudentBack", method = RequestMethod.POST)
	public String StudentBack(ModelMap model) {
		return "./Student/student";
	}
}
