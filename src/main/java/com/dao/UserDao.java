package com.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.AddDetails;
import com.User.UserDetails;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addUser(UserDetails us) {
		
		boolean f=false;
		try {
			PreparedStatement ps=conn.prepareStatement(  
					"insert into registration(Name,Emaill,Password) values(?,?,?)");  

						 
						
						ps.setString(1,us.getUname());  
						ps.setString(2,us.getUemail());  
						ps.setString(3,us.getUpass());  
					

						
						//	System.out.println(n+" "+p+" "+e+" "+c+" "+con+" "+add);
							int i=ps.executeUpdate(); 
							
							System.out.println("hey");
							if(i>0)  {
							 f=true;
							}
							
						          
							}catch (Exception e2) {System.out.println(e2);}
						
		
		return f;
		
	}
	
	
	
	
public List<AddDetails> getUser(int id){
		
		List<AddDetails>list=new ArrayList<>();
		
		AddDetails ad=null;
		try {
			PreparedStatement ps=conn.prepareStatement(  
					"select * from Addnote where userID=? order by questionID DESC");
			ps.setInt(1, id);
			ResultSet j=ps.executeQuery();
			
			while(j.next()) {
				ad=new AddDetails();
				ad.setId(j.getInt(1));
				ad.setTitle(j.getString(2));
				ad.setContent(j.getString(3));
				list.add(ad);
				System.out.println(list);
				
			}
		
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		

    return list;
	
		
	}


public boolean Deletenotes(int n) {
	
	boolean f=false;
	try {
		String qu="delete from Addnote where questionID=?";
		PreparedStatement ps=conn.prepareStatement(qu);
		ps.setInt(1,n);
		
		int x=ps.executeUpdate();
		//System.out.println("update");
		if(x==1) {
			f=true;
			//System.out.println("deleted");
		}
		
		
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return f;
	
	
}



public AddDetails getDatabyID(int id){
	AddDetails ad=null;
	try {
		
		String  q2="select * from Addnote where questionID=?";
		PreparedStatement ps=conn.prepareStatement(q2);
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			ad=new AddDetails();
			ad.setId(rs.getInt(1));
			ad.setTitle(rs.getString(2));
			ad.setContent(rs.getString(3));
		}
	}
	catch(Exception e){
		e.printStackTrace();
		
	}
	
	return ad;
	
	
	
}
	
	

public boolean updateuser(int id,String title,String content) {
	boolean f=false;
	try {
		//System.out.println(id+title+content);
		String s="update Addnote set Question=?,Solution=? where QuestionID=?";
		
		PreparedStatement ps=conn.prepareStatement(s);
		/*
		 * ps.setInt(1, id); ps.setString(2, title); ps.setString(3, content);
		 */
		
		ps.setString(1, title);
        ps.setString(2, content);
        ps.setInt(3, id);
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
			System.out.println("update successfully");
		}
		
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
		
	}
	
	
	
	
	return f;
	
	
	
	
}
	
	
	
	
	
	
//	
//	
//public boolean loginUser(UserDetails us) {
//		
//		boolean f=false;
//		try {
//			PreparedStatement ps=conn.prepareStatement(  
//					"select * from registration where email=? && Passwords=?");
//			ps.setString(1,us.getUemail());
//			ps.setString(2,us.getUpass());
//			
//			ResultSet rs=ps.executeQuery();
////			while(rs.next()) {
////				System.out.println(rs.getString(1)+"  "+rs.getString(2));  
////				
////			}
//		     if (rs.next()) {
//		    	 f=true;
//		    	
//		     }
//		     }
//		catch(Exception e) {
//			System.out.println(e);
//		}
//		
//		return f;
//		
//	}
//	
	
	
}
