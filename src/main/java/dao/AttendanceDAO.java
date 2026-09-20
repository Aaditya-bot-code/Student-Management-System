package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Attendance;
import model.Student;
import util.DBConnection;


public class AttendanceDAO {
	public boolean addAttendance(Attendance attendance)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			String sql="INSERT INTO attendance(studentId,date,status) VALUES(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, attendance.getStudentId());
			ps.setString(2, attendance.getDate());
			ps.setString(3, attendance.getStatus());
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
	public ArrayList<Attendance> getAllAttendance()
	{
		ArrayList<Attendance> attendanceList=new ArrayList<>();
		try {
			Connection con=DBConnection.getConnection();
			String sql = "SELECT a.attendanceId, a.studentId, "
	                   + "s.name, a.date, a.status "
	                   + "FROM attendance a "
	                   + "JOIN student s ON a.studentId = s.studentId "
	                   + "ORDER BY a.date DESC";

			PreparedStatement ps=con.prepareStatement(sql);
	        ResultSet rs=ps.executeQuery();
	        while(rs.next()) {
	        	Attendance attendance=new Attendance();
	        	attendance.setAttendanceId(rs.getInt("attendanceId"));
	        	attendance.setStudentId(rs.getInt("studentId"));
	        	attendance.setStudentName(rs.getString("name"));
	        	attendance.setDate(rs.getString("date"));
	        	attendance.setStatus(rs.getString("status"));
	        	attendanceList.add(attendance);
	      }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return attendanceList;
	}
	public boolean deleteAttendance(int attendanceId) {

	    try {
	        Connection con = DBConnection.getConnection();

	        String sql = "DELETE FROM attendance WHERE attendanceId = ?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, attendanceId);

	        int rows = ps.executeUpdate();

	        System.out.println("Rows deleted = " + rows);

	        ps.close();
	        con.close();

	        return rows > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	public Attendance getAttendanceById(int attendanceId) {

	    Attendance attendance = null;

	    try {
	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM attendance WHERE attendanceId=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, attendanceId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            attendance = new Attendance();

	            attendance.setAttendanceId(
	                    rs.getInt("attendanceId"));

	            attendance.setStudentId(
	                    rs.getInt("studentId"));

	            attendance.setDate(
	                    rs.getString("date"));

	            attendance.setStatus(
	                    rs.getString("status"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return attendance;
	}
	public boolean updateAttendance(Attendance attendance)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			String sql="UPDATE attendance SET studentId=?,date=?,status=?"+"WHERE attendanceId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,attendance.getStudentId());
			ps.setString(2, attendance.getDate());
			ps.setString(3, attendance.getStatus());
			ps.setInt(4, attendance.getAttendanceId());
			int rows=ps.executeUpdate();
			return rows>0;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<Attendance> searchAttendanceByStudentId(int studentId)
	{
		ArrayList<Attendance> attendanceList=new ArrayList<>();
		try {
			Connection con=DBConnection.getConnection();
			String sql = "SELECT a.attendanceId, a.studentId, s.name, a.date, a.status "
			           + "FROM attendance a "
			           + "JOIN student s ON a.studentId = s.studentId "
			           + "WHERE a.studentId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, studentId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Attendance attendance=new Attendance();
				attendance.setAttendanceId(rs.getInt("attendanceId"));
				attendance.setStudentId(rs.getInt("studentId"));
				attendance.setStudentName(rs.getString("name"));
				attendance.setDate(rs.getString("date"));
				attendance.setStatus(rs.getString("status"));
				attendanceList.add(attendance);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return attendanceList;
	}
	public ArrayList<Attendance> searchAttendanceByDate(String date)
	{
		ArrayList<Attendance> attendanceList=new ArrayList<>();
		try {
			Connection con=DBConnection.getConnection();
			String sql = "SELECT a.attendanceId, a.studentId, s.name, a.date, a.status "
			           + "FROM attendance a "
			           + "JOIN student s ON a.studentId = s.studentId "
			           + "WHERE a.date=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, date);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Attendance attendance=new Attendance();
				attendance.setAttendanceId(rs.getInt("attendanceId"));
				attendance.setStudentId(rs.getInt("studentId"));
				attendance.setStudentName(rs.getString("name"));
				attendance.setDate(rs.getString("date"));
				attendance.setStatus(rs.getString("status"));
				attendanceList.add(attendance);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return attendanceList;
	}
	public ArrayList<Attendance> searchAttendanceByStatus(String status)
	{
		ArrayList<Attendance> attendanceList=new ArrayList<>();
		try {
			Connection con=DBConnection.getConnection();
			String sql = "SELECT a.attendanceId, a.studentId, s.name, a.date, a.status "
	                   + "FROM attendance a "
	                   + "JOIN student s ON a.studentId = s.studentId "
	                   + "WHERE a.status=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, status);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Attendance attendance=new Attendance();
				attendance.setAttendanceId(rs.getInt("attendanceId"));
				attendance.setStudentId(rs.getInt("studentId"));
				attendance.setStudentName(rs.getString("name"));
				attendance.setDate(rs.getString("date"));
				attendance.setStatus(rs.getString("status"));
				attendanceList.add(attendance);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return attendanceList;
	}
	
	
	}
