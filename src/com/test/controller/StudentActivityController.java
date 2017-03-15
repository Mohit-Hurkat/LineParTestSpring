package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Question;
import com.test.bean.Result;
import com.test.bean.Student;
import com.test.bean.Subject;
import com.test.bl.StudentLogic;
import com.test.bl.SubjectLogic;
import com.test.bl.TestLogic;

@Controller
@SessionAttributes({"studentSession","subjectDisplay","sessionSubjectId"})
public class StudentActivityController{
	private SubjectLogic subjectLogic=new SubjectLogic();
	private StudentLogic studentLogic=new StudentLogic();
	private TestLogic lc=new TestLogic(); 
	
	@RequestMapping(value="/StudentBack", method = RequestMethod.POST)
	public String StudentBack(ModelMap model) {
		return "./Student/student";
	}
	
	@RequestMapping(value="/studentUpdate")
	public String StudentUpdate(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		Student student=(Student) model.get("studentSession");
		student=studentLogic.search(student.getUsername());
		model.addAttribute("student", student);
			return "./Student/studentUpdateInfo";
	}
	
	@RequestMapping(value="/studentUpdateFinal")
	public String StudentUpdateFinal(ModelMap model,Student student) throws ClassNotFoundException, IOException, SQLException {
		Student stud=(Student) model.get("studentSession");
		student.setUsername(stud.getUsername());
		if(studentLogic.update(student.getUsername(), student)){
			model.addAttribute("studentMessage", "Successfully Updated.");
			return "./Student/updateStudent";
		}
		return "./Student/student";
		
	}
	
	@RequestMapping(value="/studentResult", method = RequestMethod.POST)
	public String PrevResult(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		if(subjectDisplay!=null){
			model.addAttribute("subjectDisplay",subjectDisplay);
			return "./Student/studentGiveTest";
		}
		return "./Student/student";
	}
	
	@RequestMapping(value="/studentTest")
	public String GiveTest(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay=subjectLogic.displayAll();
		if(subjectDisplay!=null){
			model.addAttribute("subjectDisplay",subjectDisplay);
			Subject subject=new Subject();
			model.addAttribute("subject", subject);
			return "./Student/studentGiveTest";
		}
		return "./Student/student";
	}
	
	@RequestMapping(value="/testSubject")
	public String TestSubject(ModelMap model,Subject subject) throws ClassNotFoundException, IOException, SQLException, InterruptedException {
		subject=subjectLogic.search(subject.getSubjectId());
		Student student=(Student) model.get("studentSession");
		List<Result> result=new ArrayList<>();
		if(lc.giveTest(student.getUsername(), subject.getSubjectId()).equals(result) ){
			{
				if(lc.check_questions(subject.getSubjectId(),student.getUsername()))
				{
					if(lc.dateCheck(subject.getSubjectId())){
						model.addAttribute("sessionSubjectId",subject.getSubjectId());
						return "./Test/Rules";
					}
				}
			}
		}
		return "./lost";
	}
	
	
	@RequestMapping(value="/GiveTestFinal")
	public String GiveTestFinal(ModelMap model) throws ClassNotFoundException, IOException, SQLException, InterruptedException {
		Student student=(Student) model.get("studentSession");
		int subjectId=(int) model.get("sessionSubjectId");
		List<Question> quest=new ArrayList<>();
		quest=lc.getQuestions(student.getUsername(), subjectId);
		model.addAttribute("Questions", quest);
		return "./Test/giveTest";
	}
	
}
