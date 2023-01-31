package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.EventBoardVO;

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
					+"FROM (SELECT /*+ INDEX_DESC(god_event_board_3 geb_gebno_pk_3)*/ gebno,name,subject,poster,regdate,progress_status,event_date,hit "
					+ "FROM god_event_board_3)) "
					+ "WHERE num BETWEEN ? AND ? "
					+ "ORDER BY gebno ASC";
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
	
}
