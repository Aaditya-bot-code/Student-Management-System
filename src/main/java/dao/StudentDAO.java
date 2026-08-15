package dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Student;
import util.DBConnection;


public class StudentDAO {
	public boolean addStudent(Student student)
	{
		try {
			Connection con=DBConnection.getConnection();
			String sql="INSERT INTO student(name,email,phone,department,semester) VALUES(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,student.getName());
			ps.setString(2,student.getEmail());
			ps.setString(3,student.getPhone());
			ps.setString(4,student.getDepartment());
			ps.setInt(5,student.getSemester());
			int rows=ps.executeUpdate();
			if(rows>0)
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

public ArrayList<Student> getAllStudents()
{
	ArrayList<Student> studentList=new ArrayList<>();
	try {
		Connection con=DBConnection.getConnection();
		String sql="SELECT * FROM student";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) 
		{
			Student student=new Student();
			student.setStudentId(rs.getInt("studentId"));
			student.setName(rs.getString("name"));
			student.setEmail(rs.getString("email"));
			student.setPhone(rs.getString("phone"));
			student.setDepartment(rs.getString("department"));
			student.setSemester(rs.getInt("semester"));
			studentList.add(student);
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return studentList;
}
public Student getStudentById(int id)
{
	Student student=null;
	try
	{
		Connection con=DBConnection.getConnection();
		String sql="SELECT * FROM student WHERE studentId=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);;
		ResultSet rs=ps.executeQuery();
		if(rs.next()) 
		{
			student=new Student();
			student.setStudentId(rs.getInt("studentId"));
			student.setName(rs.getString("name"));
			student.setEmail(rs.getString("email"));
			student.setPhone(rs.getString("phone"));
			student.setDepartment(rs.getString("department"));
			student.setSemester(rs.getInt("semester"));
				
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		
	}
	return student;
}
public boolean updateStudent(Student student)
{
	try
	{
	Connection con=DBConnection.getConnection();
	String sql = "UPDATE student SET name=?, email=?, phone=?, department=?, semester=? WHERE studentId=?";
	PreparedStatement ps=con.prepareStatement(sql);
	
	ps.setString(1,student.getName());
	ps.setString(2,student.getEmail());
	ps.setString(3,student.getPhone());
	ps.setString(4,student.getDepartment());
	ps.setInt(5,student.getSemester());
	ps.setInt(6,student.getStudentId());
	int rows=ps.executeUpdate();
	return rows>0;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return false;
}
public boolean deleteStudent(int id)
{
	try
	{
		Connection con=DBConnection.getConnection();
		String sql="DELETE FROM student WHERE studentId=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		int rows=ps.executeUpdate();
		return rows>0;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return false;
}
public ArrayList<Student> searchStudents(String search) {

    ArrayList<Student> studentList = new ArrayList<>();

    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM student WHERE CAST(studentId AS CHAR) LIKE ? OR name LIKE ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, "%" + search + "%");
        ps.setString(2, "%" + search + "%");

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Student student = new Student();

            student.setStudentId(rs.getInt("studentId"));
            student.setName(rs.getString("name"));
            student.setEmail(rs.getString("email"));
            student.setPhone(rs.getString("phone"));
            student.setDepartment(rs.getString("department"));
            student.setSemester(rs.getInt("semester"));

            studentList.add(student);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return studentList;
}
public int getStudentCount()
{
	int count=0;
	try
	{
		Connection con=DBConnection.getConnection();
		String sql="SELECT COUNT(*) FROM student";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			count=rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return count;
}
public int getDepartmentCount()
{
	int count=0;
	try
	{
		Connection con=DBConnection.getConnection();
		String sql="SELECT COUNT(DISTINCT department) FROM student";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			count=rs.getInt(1);
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return count;
}
}

		