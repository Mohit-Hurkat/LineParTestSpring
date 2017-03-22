package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Question;
import com.test.bean.Result;
import com.test.bean.Student;
import com.test.bean.Subject;
import com.test.bl.QuestionAnalyticsLogic;
import com.test.bl.QuestionLogic;
import com.test.bl.ResultLogic;
import com.test.bl.StudentLogic;
import com.test.bl.SubjectLogic;
import com.test.bl.TestLogic;

@Controller
@SessionAttributes({"studentSession","subjectDisplay","sessionSubjectId","sessionQuestions"})
public class StudentActivityController{
	private SubjectLogic subjectLogic=new SubjectLogic();
	private StudentLogic studentLogic=new StudentLogic();
	private TestLogic lc=new TestLogic();
	private QuestionLogic questionLogic=new QuestionLogic();
	private ResultLogic resultLogic=new ResultLogic();
	private QuestionAnalyticsLogic quesAnalyticsLogic=new QuestionAnalyticsLogic();
	
	
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
		List<Subject> sub=new ArrayList<>();
		if(!subjectDisplay.equals(sub)){
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
		System.out.println(student+"a1");
		int subjectId=(int) model.get("sessionSubjectId");
		System.out.println(subjectId+"b2");
		List<Question> quest=new ArrayList<>();
		quest=lc.getQuestions(student.getUsername(), subjectId);
		model.addAttribute("sessionQuestions", quest);
		return "./Test/giveTest";
	}
	
	@RequestMapping(value="/ResultSubmit",method = RequestMethod.POST)
	public String ResultSubmit(ModelMap model,HttpServletRequest request) throws ClassNotFoundException, IOException, SQLException, InterruptedException {
		Student student=(Student) model.get("studentSession");
		int subjectId=(int) model.get("sessionSubjectId");
		Enumeration<String> questions = request.getParameterNames();
		int count=0;
		while (questions.hasMoreElements()) {
			String question = questions.nextElement();
			int questionId = Integer.parseInt(question);
			String answer= questionLogic.answer(questionId);
			System.out.println(answer);
			System.out.println(request.getParameter(question));
			if(answer.equals(request.getParameter(question))){
				count=count+10;
				quesAnalyticsLogic.test(questionId);
			}
			else{
				quesAnalyticsLogic.testBad(questionId);
			}
		}
		model.addAttribute("testResult", count);
		resultLogic.set(student.getUsername(), subjectId, count);
		Subject subject=subjectLogic.search(subjectId);
		model.addAttribute("Subject", subject);
		return "./Student/printBack";
	}
	
	@RequestMapping(value="/studentResult")
	public String StudentResult(ModelMap model) throws ClassNotFoundException, IOException, SQLException, InterruptedException {
		Student student=(Student) model.get("studentSession");
		List<Result> resultList=resultLogic.show(student.getUsername());
		List<Question> result=new ArrayList<>();
		if(!resultList.equals(result)){
			model.addAttribute("resultList", resultList);
			return "./Student/studentPrevResult";
		}
		return null;
	}
	
}