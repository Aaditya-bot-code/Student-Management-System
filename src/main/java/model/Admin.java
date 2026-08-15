package model;

public class Admin {
	private int adminid;
	private String username;
	private String password;
	public Admin()
	{
		
	}
	public Admin(String username,String password)
	{
		this.username=username;
		this.password=password;
		
	}
	public void setAdminid(int adminid)
	{
		this.adminid=adminid;
	}
	public void setUsername(String username)
	{
		this.username=username;
		
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public int getAdminid()
	{
		return adminid;
	}
	public String getUsername()
	{
		return username;
	}
	public String getPassword()
	{
		return password;
	}
	
	

}
