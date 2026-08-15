package model;


public class Attendance {
	private int attendanceId;
	private int studentId;
	private String date;
	private String status;
	String studentName;
	public int  getAttendanceId()
	{
		return attendanceId;
	}
	public void setAttendanceId(int attendanceId)
	{
		this.attendanceId=attendanceId;
	}
	public int getStudentId()
	{
		return studentId;
	}
	public void setStudentId(int studentId)
	{
		this.studentId=studentId;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date=date;
	}
	public String getStatus()
	{
		return status;
	}
	public void setStatus(String status)
	{
		this.status=status;
	}
	public String getStudentName()
	{
		return studentName;
	}
	public void setStudentName(String studentName)
	{
		this.studentName=studentName;
	}
	
}
