package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class ReviewBoardLikeDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void likeInsert(ReviewBoardLikeVO vo)
	   {
		   try
		   {
			  conn=CreateConnection.getConnection();
			  String sql="INSERT INTO god_reivew_board_like_3 VALUES("
					    +"(SELECT NVL(MAX(lno)+1,1) FROM god_review_board_like_3),"
					    +"?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, vo.getGno());
			  ps.setString(2, vo.getId());
			  ps.executeUpdate();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();
		   }
		   finally
		   {
			  CreateConnection.disConnection(conn, ps);
		   }
	   }
	
	public int likeCount()
	   {
		   int count=0;
		   try
		   {
			  conn=CreateConnection.getConnection();
			  String sql="SELECT COUNT(*) FROM god_review_board_like_3";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  count=rs.getInt(1);
			  rs.close();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();
		   }
		   finally
		   {
			  CreateConnection.disConnection(conn, ps);
		   }
		   return count;
	   }
	
	public int myLikeCount(int gno,String id)
	   {
		   int count=0;
		   try
		   {
			  conn=CreateConnection.getConnection();
			  String sql="SELECT COUNT(*) FROM god_review_board_like_3 "
					    +"WHERE gno=? AND id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, gno);
			  ps.setString(2, id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  count=rs.getInt(1);
			  rs.close();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();
		   }
		   finally
		   {
			  CreateConnection.disConnection(conn, ps);
		   }
		   return count;
	   }
	
	public int reviewboardLikeCount(int no)
	   {
		   int count=0;
		   try
		   {
			  conn=CreateConnection.getConnection();
			  String sql="SELECT COUNT(*) FROM god_review_board_like_3 "
					    +"WHERE gno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, no);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  count=rs.getInt(1);
			  rs.close();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();
		   }
		   finally
		   {
			  CreateConnection.disConnection(conn, ps);
		   }
		   return count;
	   }
}
