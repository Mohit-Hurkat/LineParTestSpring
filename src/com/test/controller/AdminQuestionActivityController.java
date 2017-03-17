package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Question;
import com.test.bean.Subject;
import com.test.bl.QuestionLogic;
import com.test.bl.SubjectLogic;
@Controller
@SessionAttributes({ "questionIdSession","subjectIdSession","subjectDisplayAll","sessionHelper","question"})
public class AdminQuestionActivityController{
		private QuestionLogic questionLogic = new QuestionLogic();
		private Question question = new Question();
		private SubjectLogic subjectLogic=new SubjectLogic();
		private Subject subject=new Subject();

		@RequestMapping(value = "/deleteQuestionAdmin")
		public String DeleteQuestion(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
			List<Subject> subjectDisplay = subjectLogic.displayAll();
			model.addAttribute("subjectDisplayAll", subjectDisplay);
			model.addAttribute("subject", subject);
			model.addAttribute("sessionHelper", "delete");
			return "./Admin/AdminQuestion/Question";
		}

		@RequestMapping(value = "/displayQuestionAdmin")
		public String DisplayQuestion(ModelMap model,Subject subject) throws ClassNotFoundException, IOException, SQLException {
			List<Subject> subjectDisplay = subjectLogic.displayAll();
			model.addAttribute("subjectDisplayAll", subjectDisplay);
			model.addAttribute("subject", subject);
			model.addAttribute("sessionHelper", "display");
			return "./Admin/AdminQuestion/Question";
		}

		@RequestMapping(value = "/insertQuestionAdmin")
		public String InsertQuestion(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
			List<Subject> subjectDisplay = subjectLogic.displayAll();
			model.addAttribute("subjectDisplayAll", subjectDisplay);
			model.addAttribute("subject", subject);
			model.addAttribute("sessionHelper", "insert");
			return "./Admin/AdminQuestion/Question";
		}

		@RequestMapping(value = "/updateQuestionAdmin")
		public String UpdateQuestion(ModelMap model,Subject subject) throws ClassNotFoundException, IOException, SQLException {
			List<Subject> subjectDisplay = subjectLogic.displayAll();
			model.addAttribute("subjectDisplayAll", subjectDisplay);
			model.addAttribute("subject", subject);
			model.addAttribute("sessionHelper", "update");
			return "./Admin/AdminQuestion/Question";
		}


		@RequestMapping(value = "/AdminQuestionQuestion")
		public String AdminQuestionQuestion(ModelMap model, Subject subject) throws ClassNotFoundException, IOException, SQLException{
			String questionhelper=(String) model.get("sessionHelper");
			model.addAttribute("subjectIdSession", subject.getSubjectId());
			model.addAttribute("question",question);
			if(questionhelper.equals("insert")){
				return "./Admin/AdminQuestion/insertQuestion";
			}
			else if(questionhelper.equals("delete")){
				List<Question> questionDisplay = questionLogic.displayAll(subject.getSubjectId());
				model.addAttribute("questionDisplayAll", questionDisplay);
				return "./Admin/AdminQuestion/deleteQuestion";
			}
			else if(questionhelper.equals("display")){
				List<Question> questionDisplay = questionLogic.displayAll(subject.getSubjectId());
				model.addAttribute("questionDisplayAll", questionDisplay);
				return "./Admin/AdminQuestion/displayQuestion";
			}
			else if(questionhelper.equals("update")){
				List<Question> questionDisplay = questionLogic.displayAll(subject.getSubjectId());
				model.addAttribute("questionDisplayAll", questionDisplay);
				return "./Admin/AdminQuestion/updateQuestion";
			}
			return null;
		}
		
		
		@RequestMapping(value = "/adminQuestionInsert")
		public String QuestionInsert(ModelMap model,Question question) throws ClassNotFoundException, IOException, SQLException {
			question.setQuestionId(0);
			switch(question.getAnswer()){
			case 1:question.setAns(question.getChoice1());
			break;
			case 2:question.setAns(question.getChoice2());
			break;
			case 3:question.setAns(question.getChoice3());
			break;
			case 4:question.setAns(question.getChoice4());
			break;
			}
			if(question.getAnswer()>4||question.getAnswer()<1){
				return "lost";
			}
			if(questionLogic.insert(question)){
				model.addAttribute("mess", "Successfully Inserted.");
				return "./Admin/adminSubject";
			}
			return "lost";
	}
		
		@RequestMapping(value = "/adminQuestionDelete")
		public String AdminQuestionDelete(ModelMap model,Question question) throws ClassNotFoundException, IOException, SQLException {
			if (questionLogic.delete(question.getQuestionId())) {
				model.addAttribute("mess", "Successfully Deleted.");
				return "./Admin/adminSubject";
			} else {
				return "lost";
			}
		}
		
		@RequestMapping(value = "/adminQuestionUpdate")
		public String AdminQuestionUpdate(ModelMap model,Question question) throws ClassNotFoundException, IOException, SQLException {
			question=questionLogic.search(question.getQuestionId());
			model.addAttribute("question",question);
			return null;
		}
		
		@RequestMapping(value = "/adminQuestionUpdateFinal")
		public String AdminQuestionUpdateFinal(ModelMap model,Question question) throws ClassNotFoundException, IOException, SQLException {
			switch(question.getAnswer()){
			case 1:question.setAns(question.getChoice1());
			break;
			case 2:question.setAns(question.getChoice2());
			break;
			case 3:question.setAns(question.getChoice3());
			break;
			case 4:question.setAns(question.getChoice4());
			break;
			}
			if(question.getAnswer()>4||question.getAnswer()<1){
				return "lost";
			}
			if (questionLogic.update(question.getQuestionId(), question)) {
				model.addAttribute("mess", "Successfully Updated.");
				return "./Admin/adminSubject";
			} else {
				return "lost";
			}
		}
		
}