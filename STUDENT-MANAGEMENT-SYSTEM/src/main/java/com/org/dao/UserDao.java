package com.org.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.Helper.HelperClass;
import com.org.dto.User;

public class UserDao {

	public void saveUser(User user) {

		Connection con = HelperClass.getConnection();
		String query = "insert into user (name,age,email,password,mobile) values(?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setLong(5, user.getMobile());
			int row_affected = pst.executeUpdate();
			if (row_affected > 0) {
				System.out.println("data inserted");
				con.close();
			} else {
				System.out.println("some thing went wrong..try again...");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public User fetchUserfetchUserByEmailAndPassword(String email, String password) {

		User user = null;
		Connection con = HelperClass.getConnection();
		String query = "select * from user where email = ? and password = ?  ";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				String name = rst.getString("name");
				int age = rst.getInt("age");
				long mobile = Long.parseLong(rst.getString("mobile"));
				String email1 = rst.getString("email");
				String password1 = rst.getString("password");

				user = new User();
				user.setId(rst.getInt("id"));
				user.setName(name);
				user.setAge(age);
				user.setMobile(mobile);
				user.setEmail(email1);
				user.setPassword(password1);

			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public User updateUserById(User user) {

		Connection con = HelperClass.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement("update user set name=?,age=?,email=?,password=?,mobile=? where id=?");
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setLong(5, user.getMobile());
			pst.setInt(6, user.getId());
			
			pst.executeUpdate();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public User fetchUserById(int id) {
		
		Connection con = HelperClass.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement("select * from user where id = ?");
			pst.setInt(1, id);
			ResultSet rst = pst.executeQuery();
			User user = null;
			while(rst.next()) {
				
				String name = rst.getString("name");
				int age = rst.getInt("age");
				long mobile = rst.getLong("mobile");
				String email = rst.getString("email");
				String pwd = rst.getString("password");
				
				user = new User();
				user.setId(rst.getInt("id"));
				user.setName(name);
				user.setAge(age);
				user.setMobile(mobile);
				user.setEmail(email);
				user.setPassword(pwd);
				
			}
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<User> fetchAllUsers() {

		Connection con = HelperClass.getConnection();
		User user = null;
		List<User> list = new ArrayList<User>();
		try {
			PreparedStatement pst = con.prepareStatement("select * from user");
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				int id = rst.getInt("id");
				String name = rst.getString("name");
				int age = rst.getInt("age");
				String email = rst.getString("email");
				long mobile = rst.getLong("mobile");

				user = new User();
				user.setId(id);
				user.setName(name);
				user.setAge(age);
				user.setEmail(email);
				user.setMobile(mobile);
				list.add(user);
//				name age email mobile
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public void deleteUserById(int id) {
		
		Connection con = HelperClass.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement("delete from user where id = ?");
			pst.setInt(1, id);
			int row_deleted = pst.executeUpdate();
			if (row_deleted > 0) {
				System.out.println("user deleted");
			} else {
				System.out.println("user not deleted");
			}
			
		}	
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
