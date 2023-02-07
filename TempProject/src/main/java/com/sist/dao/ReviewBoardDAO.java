package com.sist.dao;
import java.util.*;

import com.sist.vo.NoticeBoardVO;
import com.sist.vo.ReviewBoardReplyVO;
import com.sist.vo.ReviewBoardVO;

import java.sql.*;
public class ReviewBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	// 목록 출력
	public List<ReviewBoardVO> boardListData(int page)
	{
		List<ReviewBoardVO> list=new ArrayList<ReviewBoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT no,subject,display_name,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,id,num "
					+"FROM (SELECT no,subject,display_name,name,regdate,hit,id,rownum as num "
					+"FROM (SELECT no,subject,display_name,name,regdate,hit,id "
					+ "FROM god_review_board_3 ORDER BY no DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ReviewBoardVO vo=new ReviewBoardVO();
				vo.setno(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setDisplay_name(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
				vo.setId(rs.getString(7));
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	public int boardTotalPage()
	{
		int total=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_review_board_3";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return total;
	}
	

	
	public void boardInsert(ReviewBoardVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_review_board_3(no,name,subject,display_name,content,pwd,id) "
					+"VALUES(grb_no_seq_3.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getDisplay_name());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getPwd());
			ps.setString(6, vo.getId());
			ps.executeUpdate();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		
	}
	// 상세보기
	public ReviewBoardVO boardDetailData(int no)
	{
		ReviewBoardVO vo=new ReviewBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_review_board_3 SET "
					+"hit=hit+1 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="SELECT no,name,subject,display_name,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit,count "
					+"FROM god_review_board_3 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setDisplay_name(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			vo.setCount(rs.getInt(8));
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	
	public int reviewboardRowCount() // 갯수 출력 , 총페이지 
	   {
		   int count=0;
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT COUNT(*) FROM god_review_board_3";
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
	
	public ReviewBoardVO boardUpdateData(int no)
	{
		ReviewBoardVO vo=new ReviewBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT no,name,subject,display_name,content "
					+ "FROM god_review_board_3 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setDisplay_name(rs.getString(4));
			vo.setContent(rs.getString(5));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	public boolean boardUpdate(ReviewBoardVO vo)
	{
		boolean bCheck=false;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT pwd FROM god_review_board_3 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getno());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				sql="UPDATE god_review_board_3 SET "
						+ "name=?,subject=?,display_name=?,content=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getDisplay_name());
				ps.setString(4, vo.getContent());
				ps.setInt(5, vo.getno());
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	
	// DELETE
	public boolean boardDelete(int no,String pwd)
	{
		boolean bCheck=false;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT pwd FROM god_review_board_3 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd))
			{
				bCheck=true;
				sql="DELETE FROM god_review_board_3 "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	/*
	 * GBRNO      NOT NULL NUMBER       
		NAME       NOT NULL VARCHAR2(34) 
		MSG        NOT NULL CLOB         
		REGDATE             DATE         
		GROUP_ID   NOT NULL NUMBER       
		GROUP_STEP          NUMBER       
		GROUP_TAB           NUMBER       
		ROOT                NUMBER       
		DEPTH               NUMBER       
		ID                  VARCHAR2(20) 
		GRBNO               NUMBER      
	*/
	//REPLY gbr_gbrno_seq_3 / god_board_reply_3
	public void replyInsert(ReviewBoardReplyVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_board_reply_3(rno,bno,id,name,msg,group_id) "
					+ "VALUES(gbr_gbrno_seq_3.nextval,?,?,?,?,(SELECT NVL(MAX(group_id)+1,1) FROM god_board_reply_3))";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getbno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getMsg());
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
	
	// REPLY READ
	public List<ReviewBoardReplyVO> replyListData(int bno)
	{
		List<ReviewBoardReplyVO> list=new ArrayList<ReviewBoardReplyVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT rno,bno,id,name,msg,group_tab,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
					+ "FROM god_board_reply_3 "
					+ "WHERE bno=? "
					+ "ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ReviewBoardReplyVO vo=new ReviewBoardReplyVO();
				vo.setrno(rs.getInt(1));
				vo.setbno(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setMsg(rs.getString(5));
				vo.setGroup_tab(rs.getInt(6));
				vo.setDbday(rs.getString(7));
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	// REPLY UPDATE
	public void replyUpdate(int rno,String msg)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_board_reply_3 SET "
					+ "msg=? "
					+ "WHERE rno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, msg);
			ps.setInt(2, rno);
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
	
	// RE REPLY
	public void replyReplyInsert(int root,ReviewBoardReplyVO vo)
	  {
		  try
		  {
			  conn=CreateConnection.getConnection();
			  conn.setAutoCommit(false);
			  //1. root가 가지고 있는 group_id,group_step, group_tab을 가지고 온다 
			  String sql="SELECT group_id,group_step,group_tab "
					    +"FROM god_board_reply_3 "
					    +"WHERE rno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, root);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  int gi=rs.getInt(1);
			  int gs=rs.getInt(2);
			  int gt=rs.getInt(3);
			  rs.close();
			  //2. group_step 증가 
			  sql="UPDATE god_board_reply_3 SET "
			     +"group_step=group_step+1 "
			     +"WHERE group_id=? AND group_step>?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, gi);
			  ps.setInt(2, gs);
			  ps.executeUpdate();//commit()
			  //3. INSERT commit() =======================> rollback은 수행을 하지 않는다(기술면접)
			  sql="INSERT INTO god_board_reply_3(rno,bno,id,name,msg,group_id,group_step,group_tab,root) "
			     +"VALUES(gbr_gbrno_seq_3.nextval,?,?,?,?,?,?,?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, vo.getbno());
			  ps.setString(2, vo.getId());
			  ps.setString(3, vo.getName());
			  ps.setString(4, vo.getMsg());
			  ps.setInt(5, gi);
			  ps.setInt(6, gs+1);
			  ps.setInt(7, gt+1);
			  ps.setInt(8, root);
			  ps.executeUpdate();
			  //4. UPDATE (depth증가) commit()
			  sql="UPDATE god_board_reply_3 SET "
				 +"depth=depth+1 "
				 +"WHERE rno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, root);
			  ps.executeUpdate();
			  conn.commit();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
			  try
			  {
				  conn.rollback();
			  }catch(Exception e) {}
		  }
		  finally
		  {
			  try
			  {
				  conn.setAutoCommit(true);
			  }catch(Exception ex) {}
			  CreateConnection.disConnection(conn, ps);
		  }
	  }
	
	// REPLY DELETE
	public void replyDelete(int rno)
	{
		try
		{
			conn=CreateConnection.getConnection();
			conn.setAutoCommit(false);
			String sql="SELECT root,depth FROM god_board_reply_3 "
					+ "WHERE rno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int root=rs.getInt(1);
			int depth=rs.getInt(2);
			rs.close();
			
			if(depth==0)
			{
				sql="DELETE FROM god_board_reply_3 "
						+ "WHERE rno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, rno);
				ps.executeUpdate();
				
				sql="UPDATE god_board_reply_3 SET "
						+ "depth=depth-1 "
						+ "WHERE rno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, root);
				ps.executeUpdate();
			}
			else
			{
				String msg="관리자가 삭제한 댓글입니다";
				sql="UPDATE god_board_reply_3 SET "
						+ "msg=? "
						+ "WHERE rno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, msg);
				ps.setInt(2, rno);
				ps.executeUpdate();
			}
			conn.commit();
		}catch(Exception ex)
		{
			ex.printStackTrace();
			try
			{
				conn.rollback();
			}catch(Exception e) {}
		}
		finally
		{
			try
			{
				conn.setAutoCommit(true);
				CreateConnection.disConnection(conn, ps);
			}catch(Exception ex) {}
		}
	}
	
	public ArrayList<ReviewBoardVO> reviewboardFindData(int page,String ss)
	   {
		   ArrayList<ReviewBoardVO> list=new ArrayList<ReviewBoardVO>();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT no,subject,display_name,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,id,num "
					     +"FROM (SELECT no,subject,display_name,name,regdate,hit,id,rownum as num "
					     +"FROM (SELECT no,subject,display_name,name,regdate,hit,id "
					     +"FROM god_review_board_3 "
					     +"WHERE subject LIKE '%'||?||'%' ORDER BY no DESC)) "
					     +"WHERE num BETWEEN ? AND ?";
			   ps=conn.prepareStatement(sql);
			   int rowSize=10;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   ps.setString(1, ss);
			   ps.setInt(2, start);
			   ps.setInt(3, end);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
					ReviewBoardVO vo=new ReviewBoardVO();
					vo.setno(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setDisplay_name(rs.getString(3));
					vo.setName(rs.getString(4));
					vo.setDbday(rs.getString(5));
					vo.setHit(rs.getInt(6));
					vo.setId(rs.getString(7));
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
