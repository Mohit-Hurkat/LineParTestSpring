package com.test.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.test.bean.QuestionAnalytics;

public interface QuestionAnalyticsDao {
	boolean insert(QuestionAnalytics question) throws IOException, ClassNotFoundException, SQLException;
	List<QuestionAnalytics> displayTop(int subjectId) throws IOException, ClassNotFoundException, SQLException;
	QuestionAnalytics search(int subjectId) throws IOException, ClassNotFoundException, SQLException;
	boolean test(int questionId) throws IOException, ClassNotFoundException, SQLException;
	List<QuestionAnalytics> displayBottom(int subjectId) throws IOException, ClassNotFoundException, SQLException;
	boolean testBad(int questionId) throws IOException, ClassNotFoundException, SQLException;	
}
