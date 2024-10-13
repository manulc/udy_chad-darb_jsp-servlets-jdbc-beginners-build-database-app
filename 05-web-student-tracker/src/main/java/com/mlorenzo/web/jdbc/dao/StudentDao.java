package com.mlorenzo.web.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.mlorenzo.web.jdbc.model.Student;

public class StudentDao {
	private final DataSource dataSource;
	
	public StudentDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Student> getStudents() throws SQLException {
		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from students order by last_name";
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while(myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				// create new  student object
				Student student = new Student(id, firstName, lastName, email);
				
				// add it to the list of students
				students.add(student);
			}
			
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
		
		return students;
	}
	
	public void addStudent(Student student) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement for insert
			String sql = "insert into students (first_name, last_name, email) values (?, ?, ?)";
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
			myStmt.setString(1, student.getFirstName());
			myStmt.setString(2, student.getLastName());
			myStmt.setString(3, student.getEmail());
			
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	public Student getStudent(String studentId) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql statement for get selected student
			String sql = "select * from students where id=?";
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values
			myStmt.setString(1, studentId);
			
			// execute query
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if(myRs.next()) {
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				return new Student(id, firstName, lastName, email);
			}
			else
				throw new Exception("Could not find student id " + studentId);
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}
	
	public void updateStudent(Student student) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql update statement
			String sql = "update students set first_name=?, last_name=?, email=? where id=?";
			myStmt = myConn.prepareStatement(sql);
			
			// set param values
			myStmt.setString(1, student.getFirstName());
			myStmt.setString(2, student.getLastName());
			myStmt.setString(3, student.getEmail());
			myStmt.setInt(4, student.getId());
			
			// execute sql statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	public void deleteStudent(String studentId) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql delete statement
			String sql = "delete from students where id=?";
			myStmt = myConn.prepareStatement(sql);
			
			// set param values
			myStmt.setString(1, studentId);
			
			// execute sql statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null)
				rs.close();
			
			if(stmt != null)
				stmt.close();
			
			if(conn != null)
				conn.close(); // doesn't really close it ... just puts back in connection pool
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
