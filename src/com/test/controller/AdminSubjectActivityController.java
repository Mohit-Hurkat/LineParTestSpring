package com.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.bean.Subject;

import com.test.bl.SubjectLogic;

@Controller
@SessionAttributes({ "subjectIdSession" })
public class AdminSubjectActivityController {
	private SubjectLogic subjectLogic = new SubjectLogic();

	private Subject subject = new Subject();

	@RequestMapping(value = "/deleteSubjectAdmin")
	public String DeleteSubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay = subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		model.addAttribute("subject", subject);
		return "./Admin/AdminSubject/deleteSubject";
	}

	@RequestMapping(value = "/adminSubjectDelete")
	public String DeleteSubjectFinal(ModelMap model, Subject subject)
			throws ClassNotFoundException, IOException, SQLException {
		int subjectId = subject.getSubjectId();
		System.out.println(subjectId);
		if (subjectLogic.delete(subjectId)) {
			model.addAttribute("mess", "Successfully Deleted.");
			return "./Admin/adminSubject";
		} else {
			return "lost";
		}
	}

	@RequestMapping(value = "/displaySubjectAdmin")
	public String DisplaySubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay = subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		return "./Admin/AdminSubject/displaySubject";
	}

	@RequestMapping(value = "/insertSubjectAdmin")
	public String InsertSubject(ModelMap model) {
		model.addAttribute("subject", subject);
		return "./Admin/AdminSubject/insertSubject";
	}

	@RequestMapping(value = "/adminSubjectInsert")
	public String InsertSubjectFinal(ModelMap model, Subject subject)
			throws ClassNotFoundException, IOException, SQLException {
		if (subjectLogic.insert(subject)) {
			model.addAttribute("mess", "Successfully Inserted.");
			return "./Admin/adminSubject";
		} else {
			return "lost";
		}
	}

	@RequestMapping(value = "/updateSubjectAdmin")
	public String UpdateSubject(ModelMap model) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay = subjectLogic.displayAll();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		model.addAttribute("subject", subject);
		return "./Admin/AdminSubject/updateSubject";
	}

	@RequestMapping(value = "/adminSubjectUpdate")
	public String UpdateSubjectFinal(ModelMap model, Subject subject)
			throws ClassNotFoundException, IOException, SQLException {
		int subjectId = subject.getSubjectId();
		model.addAttribute("subjectIdSession", subjectId);
		subject = subjectLogic.search(subjectId);
		model.addAttribute("subjectUpdate", subject);
		return "./Admin/AdminSubject/updateSubjectFinal";
	}

	@RequestMapping(value = "/adminSubjectUpdateFinal")
	public String AdminUpdateSubjectFinal(ModelMap model, Subject subject)
			throws ClassNotFoundException, IOException, SQLException {
		int subjectId = (int) model.get("subjectIdSession");
		if (subjectLogic.update(subjectId, subject)) {
			model.addAttribute("mess", "Successfully Updated.");
			return "./Admin/adminSubject";
		} else {
			return "lost";
		}
	}
	
	
	@RequestMapping(value = "/SubjectSelect")
	public String AdminAnalytics(ModelMap model,Subject subject) throws ClassNotFoundException, IOException, SQLException {
		List<Subject> subjectDisplay = subjectLogic.displayAnalysis();
		model.addAttribute("subjectDisplayAll", subjectDisplay);
		model.addAttribute("subject", subject);
		return "./Admin/AdminAdmin/selectSubject";
	}
}
