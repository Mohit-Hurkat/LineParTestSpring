package com.test.bean;

public class QuestionAnalytics {
   private int questionId;
   private int subjectId;
   private String question;
   private String ans;
   private int analytics;
   
   public QuestionAnalytics(){
	   
   }
   
   
   public QuestionAnalytics(int questionId, int subjectId, String question, String ans, int analytics) {
	super();
	this.questionId = questionId;
	this.subjectId = subjectId;
	this.question = question;
	this.ans = ans;
	this.analytics = analytics;
   }


public int getQuestionId() {
	return questionId;
}


public void setQuestionId(int questionId) {
	this.questionId = questionId;
}


public int getSubjectId() {
	return subjectId;
}


public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}


public String getQuestion() {
	return question;
}


public void setQuestion(String question) {
	this.question = question;
}


public String getAns() {
	return ans;
}


public void setAns(String ans) {
	this.ans = ans;
}


public int getAnalytics() {
	return analytics;
}


public void setAnalytics(int analytics) {
	this.analytics = analytics;
}


@Override
public String toString() {
	return "QuestionAnalytics [questionId=" + questionId + ", subjectId=" + subjectId + ", question=" + question
			+ ", ans=" + ans + ", analytics=" + analytics + "]";
}
   
   
}
