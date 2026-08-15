package model;

public class Student {
	private int studentId;
	private String name;
	private String email;
	private  String phone;
	private  String department;
	private  int semester;
	public Student()
	{
		
	}
	public Student(String name,String email, String phone, String department,int semester)
	{
		this.name=name;
		this.email=email;
		this.phone=phone;
		this.department=department;
		this.semester=semester;	
	}
	public void setStudentId(int studentId)
	{
		this.studentId=studentId;	
	}
	public void setName(String name)
	{
		this.name=name;	
	}
	public void setEmail(String email)
	{
		this.email=email;	
	}
	public void setPhone(String phone)
	{
		this.phone=phone;	
	}
	public void setDepartment(String department)
	{
		this.department=department;	
	}
	public void setSemester(int semester)
	{
		this.semester=semester;	
	}
	public int getStudentId()
	{
		return studentId;
	}
	public String getName()
	{
		return name;
	}
	public String getEmail()
	{
		return email;
	}
	public String getPhone()
	{
		return phone;
	}
	public String getDepartment()
	{
		return department;
	}
	public int getSemester()
	{
		return semester;
	}
	
	
	

}
