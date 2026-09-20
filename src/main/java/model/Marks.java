package model;

public class Marks {
	private int marksId;
	private int studentId;
	private String subject;
	private String studentName;
	private int marks;
	
	public int getMarksId()
	{
		return marksId;
	}
	public void setMarksId( int marksId)
	{
		this.marksId=marksId;
	}
	public int getStudentId()
	{
		return studentId;
	}
	public void setStudentId( int studentId)
	{
		this.studentId=studentId;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject( String subject)
	{
		this.subject=subject;
	}
	
	public String getStudentName()
	{
		return studentName;
	}
	public void setStudentName( String studentName)
	{
		this.studentName=studentName;
	}
	
	public int getMarks()
	{
		return marks;
	}
	public void setMarks( int marks)
	{
		this.marks=marks;
	}
	


}
