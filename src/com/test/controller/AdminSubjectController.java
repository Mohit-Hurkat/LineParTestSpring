package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Subject;
import com.test.bl.QuestionLogic;
import com.test.bl.StudentLogic;
import com.test.bl.SubjectLogic;

@Controller
@SessionAttributes({})
public class AdminSubjectController{
	private SubjectLogic subjectLogic=new SubjectLogic();
	private QuestionLogic questionLogic=new QuestionLogic();
	private StudentLogic studentLogic=new StudentLogic();
    
	@RequestMapping(value="/deleteSubjectAdmin")
	public String DeleteSubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException{
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		return "./Admin/AdminSubject/deleteSubject";
	}
	
	@RequestMapping(value="/adminSubjectDelete")
	public String DeleteSubjectFinal(ModelMap model) throws ClassNotFoundException, IOException, SQLException{
		
		return "./Admin/AdminSubject/deleteSubject";
	}
	
	@RequestMapping(value="/displaySubjectAdmin")
	public String DisplaySubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException{
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		return "./Admin/AdminSubject/displaySubject";
	}
	
	@RequestMapping(value="/insertSubjectAdmin")
	public String InsertSubject(ModelMap model){
		return "./Admin/";
	}
	
	@RequestMapping(value="/searchSubjectAdmin")
	public String SearchSubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException{
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		return "./Admin/AdminSubject/searchSubject";
	}
	
	@RequestMapping(value="/updateSubjectAdmin")
	public String UpdateSubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException{
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		return "./Admin/AdminSubject/updateSubject";
	}
}
