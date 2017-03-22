package com.test.bl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.test.bean.QuestionAnalytics;
import com.test.dao.QuestionAnalyticsDao;
import com.test.dao.QuestionAnalyticsDaoImpl;


public class QuestionAnalyticsLogic 
{
	private QuestionAnalyticsDao qdao=new QuestionAnalyticsDaoImpl();
	
	public boolean insert(QuestionAnalytics question) throws IOException, ClassNotFoundException, SQLException
	{
		return qdao.insert(question);
		
	}
	public QuestionAnalytics search(int question_Id) throws IOException, ClassNotFoundException, SQLException
	{
		return qdao.search(question_Id);
		
	}
	public List<QuestionAnalytics> displayTop(int subjectId) throws IOException, ClassNotFoundException, SQLException
	{
		return qdao.displayTop(subjectId);
		
	}
	
	public List<QuestionAnalytics> displayBottom(int subjectId) throws IOException, ClassNotFoundException, SQLException
	{
		return qdao.displayBottom(subjectId);
		
	}
	
	public boolean test(int questionId) throws IOException, ClassNotFoundException, SQLException{
		return qdao.test(questionId);
	}
	
	public boolean testBad(int questionId) throws IOException, ClassNotFoundException, SQLException{
		return qdao.testBad(questionId);
	}
}
