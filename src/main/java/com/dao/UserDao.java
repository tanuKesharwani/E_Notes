package com.dao;

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
					"select * from addnote where userID=? order by questionID DESC");
			ps.setInt(1, id);
			ResultSet j=ps.executeQuery();
			
			while(j.next()) {
				ad=new AddDetails();
				ad.setId(j.getInt(1));
				ad.setTitle(j.getString(3));
				ad.setContent(j.getString(4));
				list.add(ad);
				System.out.println(list);
				
			}
		
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		

    return list;
	
		
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
