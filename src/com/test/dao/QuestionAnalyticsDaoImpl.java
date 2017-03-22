package com.test.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test.bean.QuestionAnalytics;
import com.test.helper.JDBCConnection;

public class QuestionAnalyticsDaoImpl implements QuestionAnalyticsDao{
	private static final String SELECT_QUERY = "SELECT * FROM QUESTIONANALYTICS WHERE QUESTION_ID = ?";
	private static final String SELECT_ALL_DESC = "SELECT * FROM QUESTIONANALYTICS WHERE rownum <= 10 AND SUBJECT_ID = ? ORDER BY ANALYTICS DESC";
	private static final String SELECT_ALL_ASC = "SELECT * FROM QUESTIONANALYTICS WHERE rownum <= 10 AND SUBJECT_ID = ? ORDER BY ANALYSIS DESC";
    private static final String INSERT_QUERY="INSERT INTO QUESTIONANALYTICS(QUESTION_ID,SUBJECT_ID,QUESTION,ANS,ANALYTICS,ANALYSIS) VALUES(?,?,?,?,0,0)";
    private static final String UPDATE_QUERY = "UPDATE QUESTIONANALYTICS SET ANALYTICS=ANALYTICS+1 WHERE QUESTION_ID = ?";
    private static final String UPDATE_QUERY_BAD = "UPDATE QUESTIONANALYTICS SET ANALYSIS=ANALYSIS+1 WHERE QUESTION_ID = ?";
    private int question_id;
    private int subject_id;
    private String ques;
    private String ans;
    private int analytics;
    
    @Override
	public boolean insert(QuestionAnalytics question) throws IOException, ClassNotFoundException, SQLException{
		int numAffectedRows=0;
		Connection connection = JDBCConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUERY);
		preparedStatement.setInt(1, question.getQuestionId());
		preparedStatement.setInt(2, question.getSubjectId());
		preparedStatement.setString(3, question.getQuestion());
		preparedStatement.setString(4, question.getAns());
		numAffectedRows = preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
		return numAffectedRows > 0;
	}
    
   
    @Override
	public List<QuestionAnalytics> displayTop(int subjectId) throws IOException,ClassNotFoundException, SQLException{
    	QuestionAnalytics question = null;
    	List<QuestionAnalytics> questionList = new ArrayList<>();
		Connection connection = JDBCConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DESC);
		preparedStatement.setInt(1, subjectId);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			question_id = rs.getInt("QUESTION_ID");
			ques = rs.getString("QUESTION");
			ans=rs.getString("ANS");
			analytics=rs.getInt("ANALYTICS");
			question = new QuestionAnalytics(question_id, subjectId, ques,ans,analytics);
			questionList.add(question);
		}
		rs.close();
		preparedStatement.close();
		connection.close();
		return questionList;
	}
    
    @Override
	public List<QuestionAnalytics> displayBottom(int subjectId) throws IOException,ClassNotFoundException, SQLException{
    	QuestionAnalytics question = null;
    	List<QuestionAnalytics> questionList = new ArrayList<>();
		Connection connection = JDBCConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ASC);
		preparedStatement.setInt(1, subjectId);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			question_id = rs.getInt("QUESTION_ID");
			ques = rs.getString("QUESTION");
			ans=rs.getString("ANS");
			analytics=rs.getInt("ANALYSIS");
			question = new QuestionAnalytics(question_id, subjectId, ques,ans,analytics);
			questionList.add(question);
		}
		rs.close();
		preparedStatement.close();
		connection.close();
		return questionList;
	}
    
    @Override
   	public QuestionAnalytics search(int questionId)throws IOException,ClassNotFoundException, SQLException {
    	QuestionAnalytics question = null;
    	List<QuestionAnalytics> questionList = new ArrayList<>();
   		Connection connection = JDBCConnection.getConnection();
   		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_QUERY);
   		preparedStatement.setInt(1, questionId);
   		ResultSet rs = preparedStatement.executeQuery();
   		if(rs.next()){
   			subject_id = rs.getInt("SUBJECT_ID");
   			ques = rs.getString("QUESTION");
   			ans=rs.getString("ANS");
   			analytics = rs.getInt("ANSWER");
   			question = new QuestionAnalytics(question_id, subject_id, ques,ans,analytics);
   			questionList.add(question);
   		}
   		rs.close();
   		preparedStatement.close();
   		connection.close();
   		return question;
   	}
    
    @Override
   	public boolean test(int questionId)throws IOException, ClassNotFoundException, SQLException {
   		Connection connection = JDBCConnection.getConnection();
   		PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);
   		preparedStatement.setInt(1, questionId);
   		preparedStatement.executeQuery();
   		preparedStatement.close();
   		connection.close();
   		return true;
   	}
    
    @Override
   	public boolean testBad(int questionId)throws IOException, ClassNotFoundException, SQLException {
   		Connection connection = JDBCConnection.getConnection();
   		PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY_BAD);
   		preparedStatement.setInt(1, questionId);
   		preparedStatement.executeQuery();
   		preparedStatement.close();
   		connection.close();
   		return true;
   	}
    
}
