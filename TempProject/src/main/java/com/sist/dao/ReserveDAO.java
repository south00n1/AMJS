package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

/*
 * 
GENO    NOT NULL NUMBER        
POSTER  NOT NULL VARCHAR2(260) 
TITLE   NOT NULL VARCHAR2(150) 
TITLE2           VARCHAR2(150) 
KIND             VARCHAR2(60)  
PERIOD  NOT NULL VARCHAR2(100) 
LOC     NOT NULL VARCHAR2(60)  
LOC2             VARCHAR2(100) 
AREA             VARCHAR2(200) 
AREA2            VARCHAR2(200) 
ITEM             CLOB          
HOST             VARCHAR2(450) 
URL              VARCHAR2(200) 
PRICE            CLOB          
TIME             VARCHAR2(400) 
HASHTAG          CLOB          
GOOD             NUMBER        
CONTENT          CLOB          
HIT              NUMBER   
 */

public class ReserveDAO {
  private Connection conn;
  private PreparedStatement ps;
  
  public List<ExhibitionVO> exhibitionListData(String ed)
  {
	  List<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="SELECT geno,poster,title,loc,rownum "
				    +"FROM god_exhibition_3 "
				    +"WHERE rownum<=50 AND area LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, ed);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  ExhibitionVO vo=new ExhibitionVO();
			  vo.setGeno(rs.getInt(1));
			  vo.setPoster(rs.getString(2));
			  vo.setTitle(rs.getString(3));
			  vo.setLoc(rs.getString(4));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  CreateConnection.disConnection(conn, ps);
	  }
	  return list;
  }
}