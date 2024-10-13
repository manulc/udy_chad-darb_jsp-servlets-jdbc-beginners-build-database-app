package com.mlorenzo.service;

import java.util.ArrayList;
import java.util.List;

import com.mlorenzo.model.Student;

public class StudentService {
	
	public static List<Student> getStudents() {
		List<Student> students = new ArrayList<>();
		
		students.add(new Student("Mary", "Smith", "mary.smith@email.com"));
		students.add(new Student("John", "Doe", "john.doe@email.com"));
		students.add(new Student("Ajay", "Rao", "ajay.roe@email.com"));
		
		return students;
	}

}
