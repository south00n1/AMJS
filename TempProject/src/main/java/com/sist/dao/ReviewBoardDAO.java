package com.sist.dao;
import java.util.*;

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
			String sql="SELECT grbno,subject,display_name,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					+"FROM (SELECT grbno,subject,display_name,name,regdate,hit,rownum as num "
					+"FROM (SELECT /*+ INDEX_DESC(project_freeboard grb_grbno_pk_3)*/ grbno,subject,display_name,name,regdate,hit "
					+ "FROM god_review_board_3)) "
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
				vo.setGrbno(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setDisplay_name(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
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
	
	// 추가
	// 상세보기
	// 수정
	// 삭제
	// 검색
	// 댓글
	
	}
	
	public void boardInsert(ReviewBoardVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_review_board_3(grbno,name,subject,display_name,content,pwd) "
					+"VALUES(grb_grbno_seq_3.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getDisplay_name());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getPwd());
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
	public ReviewBoardVO boardDetailData(int grbno)
	{
		ReviewBoardVO vo=new ReviewBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_review_board_3 SET "
					+"hit=hit+1 "
					+"WHERE grbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grbno);
			ps.executeUpdate();
			
			sql="SELECT grbno,name,subject,display_name,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+"FROM god_review_board_3 "
					+"WHERE grbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grbno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGrbno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setDisplay_name(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
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
	
	
	
	
}
