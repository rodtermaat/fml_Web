/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.termaat.dao;
import com.termaat.bean.AddCheck;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import com.termaat.bean.ViewCheck;
import com.termaat.bean.EditCheck;
import com.termaat.bean.ManageCateg;

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

public static int addCheck(AddCheck a_chk, int theUser){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
        "INSERT INTO checkbook(checkDate,checkType, checkCategId,checkName, checkAmt, checkCleared, checkUser) values(?,?,?,?,?,?,?)"); 
        ps.setDate(1,a_chk.getCheckDate());  
        ps.setString(2,a_chk.getCheckType());  
        ps.setInt(3,a_chk.getCheckCategId());  
        ps.setString(4,a_chk.getCheckName());  
        ps.setInt(5,a_chk.getCheckAmt());  
        ps.setBoolean(6,a_chk.getIsCleared());
        ps.setInt(7, theUser);
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  

public static int updateCheck(EditCheck e_chk){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
                "UPDATE checkbook set checkDate=?, checkType=?," +
                " checkCategId=?,checkName=?,checkAmt=?," +
                " checkCleared=? where checkId=?");  
        ps.setDate(1,e_chk.getCheckDate());  
        ps.setString(2,e_chk.getCheckType());  
        ps.setInt(3,e_chk.getCheckCategId());  
        ps.setString(4,e_chk.getCheckName());  
        ps.setInt(5,e_chk.getCheckAmt());  
        ps.setBoolean(6,e_chk.getIsCleared());
        ps.setInt(7,e_chk.getCheckId());
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  

public static int deleteCheck(ViewCheck chk){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from checkbook where checkId=?");  
        ps.setInt(1,chk.getCheckId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}

public static List<ViewCheck> getCheckbook(int theUser){
    List<ViewCheck> list=new ArrayList<ViewCheck>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
        "SELECT (SELECT u.userUID FROM `user` u" + 
            " WHERE u.userId = c.checkUser) as checkUser," +
        " c.checkId, c.checkDate, c.checkType as typeName," +
        " (SELECT cat.categName FROM `category` cat" + 
            " WHERE cat.categId = c.checkCategId) as categName," + 
        " c.checkName, c.checkCleared, c.checkAmt," +
        " @balance:=@balance+c.checkAmt AS checkBal FROM `checkbook` c," +
        " (SELECT @balance:=0) AS t" +
        " WHERE c.checkUser =? ORDER BY c.checkDate, c.checkId;");
        
        ps.setInt(1,theUser);
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            ViewCheck chk=new ViewCheck();  
            chk.setCheckId(rs.getInt("checkId"));  
            chk.setCheckDate(rs.getDate("checkDate"));
            chk.setTypeName(rs.getString("typeName"));  
            chk.setCategName(rs.getString("categName"));
            chk.setCheckName(rs.getString("checkName"));
            chk.setCheckAmt(rs.getInt("checkAmt"));
            chk.setIsCleared(rs.getBoolean("checkCleared"));
            chk.setCheckBal((rs.getInt("checkBal")));
            list.add(chk);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;
}

public static List<ManageCateg> getCategories(int theUser){
    System.out.println("theUser " + theUser);
    List<ManageCateg> list=new ArrayList<ManageCateg>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                        "SELECT * from `category` WHERE categUser=?");
        
        ps.setInt(1,theUser);
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            ManageCateg cat=new ManageCateg();  
            cat.setCategId(rs.getInt("categId"));  
            cat.setCategName(rs.getString("categName"));
            cat.setCategBudgAmt(rs.getInt("categBudgAmt"));
            cat.setCategBudgFrq(rs.getString("categBudgFrq"));
            list.add(cat);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
    }

public static ViewCheck getCheckById(int id){  
    ViewCheck chk=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                "SELECT chk.checkId, chk.checkDate," + 
                        " chk.checkType as typeName, cat.categName," +
                        " chk.checkName, chk.checkAmt, chk.checkCleared" +
                        " FROM `checkbook` chk" +
                        " INNER JOIN `user` on chk.checkUser = user.userId" +
                                " AND user.userUID = 'Admin'" +
                        " INNER JOIN `category` cat" +
                                " on chk.checkCategId = cat.categId" +
                        " WHERE checkId=?");
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            chk=new ViewCheck();  
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

public static ManageCateg getCategById(int id){  
    ManageCateg cat=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                "SELECT * FROM `category` c WHERE c.categId=?");
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            cat=new ManageCateg();  
            cat.setCategId(rs.getInt("categId"));  
            cat.setCategName(rs.getString("categName"));  
            cat.setCategBudgAmt(rs.getInt("categBudgAmt"));  
            cat.setCategBudgFrq(rs.getString("categBudgFrq"));  
        }  
    }catch(Exception e){System.out.println(e);}  
    return cat;  
}

public static int addCateg(ManageCateg a_cat, int theUser){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
        "INSERT INTO category(categName,categBudgAmt, categBudgFrq, categUser) values(?,?,?,?)"); 
        ps.setString(1,a_cat.getCategName());  
        ps.setInt(2,a_cat.getCategBudgAmt());  
        ps.setString(3,a_cat.getCategBudgFrq());
        ps.setInt(4, theUser);
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  

public static int updateCategory(ManageCateg e_cat){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
                "UPDATE category set categName=?, categBudgAmt=?," +
                " categBudgFrq=? where categId=?");  
        ps.setString(1,e_cat.getCategName()); 
        ps.setInt(2,e_cat.getCategBudgAmt());  
        ps.setString(3,e_cat.getCategBudgFrq());  
        ps.setInt(4,e_cat.getCategId());
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}

public static int deleteCateg(ManageCateg cat){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from category where categId=?");  
        ps.setInt(1,cat.getCategId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}

public static String getBalance(Date enddate){
    String bal = null;
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(
                "SELECT SUM(checkAmt) AS balance FROM `checkbook` c WHERE c.checkDate<=?");
        ps.setDate(1,enddate);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){    
            bal = String.valueOf(rs.getInt("balance"));
        }  
    }catch(Exception e){System.out.println(e);}  
    return bal;
}
}
