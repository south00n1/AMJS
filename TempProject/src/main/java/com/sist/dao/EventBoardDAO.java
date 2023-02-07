package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.vo.EventBoardVO;
import com.sist.vo.NoticeBoardVO;

public class EventBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public List<EventBoardVO> boardListData(int page)
	{
		List<EventBoardVO> list=new ArrayList<EventBoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT gebno,name,subject,poster,TO_CHAR(regdate,'YYYY-MM-DD'),progress_status,event_date,hit,num "
					+"FROM (SELECT gebno,name,subject,poster,regdate,progress_status,event_date,hit,rownum as num "
					+"FROM (SELECT gebno,name,subject,poster,regdate,progress_status,event_date,hit "
					+ "FROM god_event_board_3 ORDER BY gebno ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				EventBoardVO vo=new EventBoardVO();
				vo.setGebno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setPoster(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setProgress_status(rs.getString(6));
				vo.setEvent_date(rs.getString(7));
				vo.setHit(rs.getInt(8));
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
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_event_board_3";
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
	
	public int eventboardRowCount() // 갯수 출력 , 총페이지 
	   {
		   int count=0;
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT COUNT(*) FROM god_event_board_3";
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
	
	public EventBoardVO eventboardDetailData(int gebno)
	{
		EventBoardVO vo=new EventBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_event_board_3 SET "
					+"hit=hit+1 "
					+"WHERE gebno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gebno);
			ps.executeUpdate();
			
			sql="SELECT gebno,name,subject,content,content_poster,TO_CHAR(regdate,'YYYY-MM-DD'),hit,progress_status,event_date "
					+"FROM god_event_board_3 "
					+"WHERE gebno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gebno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGebno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setContent_poster(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			vo.setProgress_status(rs.getString(8));
			vo.setEvent_date(rs.getString(9));
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
	
	public ArrayList<EventBoardVO> eventboardFindData(int page,String ss)
	   {
		   ArrayList<EventBoardVO> list=new ArrayList<EventBoardVO>();
		   try
		   {
			   conn=CreateConnection.getConnection();
				String sql="SELECT gebno,name,subject,poster,TO_CHAR(regdate,'YYYY-MM-DD'),progress_status,event_date,hit,num "
						+"FROM (SELECT gebno,name,subject,poster,regdate,progress_status,event_date,hit,rownum as num "
						+"FROM (SELECT gebno,name,subject,poster,regdate,progress_status,event_date,hit "
						+"FROM god_event_board_3 "
					    +"WHERE subject LIKE '%'||?||'%' ORDER BY gebno ASC)) "
						+"WHERE num BETWEEN ? AND ?";

			   // 인라인뷰 => Top-N만 가능 
			   // 인기순위 5개 
			   ps=conn.prepareStatement(sql);
			   int rowSize=12;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   ps.setString(1, ss);
			   ps.setInt(2, start);
			   ps.setInt(3, end);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
					EventBoardVO vo=new EventBoardVO();
					vo.setGebno(rs.getInt(1));
					vo.setName(rs.getString(2));
					vo.setSubject(rs.getString(3));
					vo.setPoster(rs.getString(4));
					vo.setDbday(rs.getString(5));
					vo.setProgress_status(rs.getString(6));
					vo.setEvent_date(rs.getString(7));
					vo.setHit(rs.getInt(8));
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
