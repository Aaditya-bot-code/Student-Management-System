package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Marks;
import util.DBConnection;




public class MarksDAO {
	public boolean addMarks(Marks marks)
	{
		boolean result=false;
		try
		{
			Connection con=DBConnection.getConnection();
			String sql="INSERT INTO marks(studentId,subject,marks)VALUES(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, marks.getStudentId());
			ps.setString(2, marks.getSubject());
			ps.setInt(3, marks.getMarks());
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
		return result;
	}


public ArrayList<Marks> getAllMarks()
{
	ArrayList<Marks> marksList =new ArrayList<>();
	try {
		Connection con=DBConnection.getConnection();
		String sql = "SELECT m.marksId, m.studentId, s.name, "
                + "m.subject, m.marks "
                + "FROM marks m "
                + "JOIN student s ON m.studentId = s.studentId";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Marks mark=new Marks();
			mark.setMarksId(rs.getInt("marksId"));
			mark.setStudentId(rs.getInt("studentId"));
			mark.setStudentName(rs.getString("name"));
			mark.setSubject(rs.getString("subject"));
			mark.setMarks(rs.getInt("marks"));
			marksList.add(mark);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return marksList;
	
}
public Marks getMarksById(int marksId) {

    Marks mark = null;

    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT m.marksId, m.studentId, s.name, "
                   + "m.subject, m.marks "
                   + "FROM marks m "
                   + "JOIN student s ON m.studentId = s.studentId "
                   + "WHERE m.marksId=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, marksId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            mark = new Marks();

            mark.setMarksId(rs.getInt("marksId"));
            mark.setStudentId(rs.getInt("studentId"));
            mark.setStudentName(rs.getString("name"));
            mark.setSubject(rs.getString("subject"));
            mark.setMarks(rs.getInt("marks"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return mark;
}
public boolean updateMarks(Marks mark)
{
	boolean result=false;
	try {
		Connection con=DBConnection.getConnection();
		String sql="UPDATE marks SET studentId=?, subject=?, marks=? "
                + "WHERE marksId=?";

		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1,mark.getStudentId());
		ps.setString(2,mark.getSubject());
		ps.setInt(3, mark.getMarks());
		ps.setInt(4, mark.getMarksId());
		 int rows=ps.executeUpdate();
		 if(rows>0)
		 {
			 result=true;
		 }
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return result;
}
public boolean deleteMarks(int marksId)
{
	boolean result=false;
	try
	{
		Connection con=DBConnection.getConnection();
		String sql="DELETE FROM marks WHERE marksId=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1,marksId);
		int rows=ps.executeUpdate();
		if(rows>0)
		{
			result=true;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return result;
}
}
