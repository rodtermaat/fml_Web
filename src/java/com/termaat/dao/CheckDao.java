/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.termaat.dao;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import com.termaat.bean.Check; 

/**
 *
 * @author termaat
 */
public class CheckDao {

public static Connection getConnection(){  
    Connection con=null;  
    try{  
        Class.forName("com.mysql.jdbc.Driver");  
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fuckmylife","root","wordpass");  
    }catch(Exception e){System.out.println(e);}  
    return con;  
}  

public static int update(Check chk){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
                "UPDATE checkbook set checkDate=?,checkTypeId=?," +
                " checkCategId=?,checkName=?,checkAmt=?," +
                " checkCleared=? where id=?");  
        ps.setDate(1,chk.getCheckDate());  
        ps.setInt(2,Integer.parseInt(chk.getTypeName()));  
        ps.setInt(3,Integer.parseInt(chk.getCategName()));  
        ps.setString(4,chk.getCheckName());  
        ps.setInt(5,chk.getCheckAmt());  
        ps.setBoolean(6,chk.getIsCleared());
        ps.setInt(7,chk.getCheckId());
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  

public static int delete(Check chk){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from checkbook where checkId=?");  
        ps.setInt(1,chk.getCheckId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}

public static List<Check> getAllRecords(){  
    List<Check> list=new ArrayList<Check>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                        "SELECT chk.checkId, chk.checkDate," + 
                        " typ.typeName, cat.categName," +
                        " chk.checkName, chk.checkAmt, chk.checkCleared" +
                        " FROM `checkbook` chk" +
                        " INNER JOIN `user` on chk.checkUser = user.userId" +
                                " AND user.userUID = 'Admin'" +
                        " INNER JOIN `category` cat" +
                                " on chk.checkCategId = cat.categId" +
                        " INNER JOIN `trantype` typ" +
                                " on chk.checkTypeId = typ.typeId");
        
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            Check chk=new Check();  
            chk.setCheckId(rs.getInt("checkId"));  
            chk.setCheckDate(rs.getDate("checkDate"));
            chk.setTypeName(rs.getString("typeName"));  
            chk.setCategName(rs.getString("categName"));
            chk.setCheckName(rs.getString("checkName"));
            chk.setCheckAmt(rs.getInt("checkAmt"));
            chk.setIsCleared(rs.getBoolean("checkCleared"));
            list.add(chk);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
    }

public static Check getRecordById(int id){  
    Check chk=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                "SELECT chk.checkId, chk.checkDate," + 
                        " typ.typeName, cat.categName," +
                        " chk.checkName, chk.checkAmt, chk.checkCleared" +
                        " FROM `checkbook` chk" +
                        " INNER JOIN `user` on chk.checkUser = user.userId" +
                                " AND user.userUID = 'Admin'" +
                        " INNER JOIN `category` cat" +
                                " on chk.checkCategId = cat.categId" +
                        " INNER JOIN `trantype` typ" +
                                " on chk.checkTypeId = typ.typeId" +
                        " WHERE checkId=?");
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            chk=new Check();  
            chk.setCheckId(rs.getInt("checkId"));  
            chk.setCheckDate(rs.getDate("checkDate"));  
            chk.setTypeName(rs.getString("typeName"));  
            chk.setCategName(rs.getString("categName"));  
            chk.setCheckName(rs.getString("checkName"));  
            chk.setCheckAmt(rs.getInt("checkAmt"));
            chk.setIsCleared(rs.getBoolean("checkCleared"));
        }  
    }catch(Exception e){System.out.println(e);}  
    return chk;  
}  
}
