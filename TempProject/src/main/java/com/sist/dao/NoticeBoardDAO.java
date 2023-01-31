package com.sist.dao;
import java.util.*;

import com.sist.vo.NoticeBoardVO;

import java.sql.*;
public class NoticeBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	public List<NoticeBoardVO> boardListData(int page)
	{
		List<NoticeBoardVO> list=new ArrayList<NoticeBoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT gnbno,type,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					+"FROM (SELECT gnbno,type,subject,name,regdate,hit,rownum as num "
					+"FROM (SELECT /*+ INDEX_DESC(project_freeboard gnb_gnbno_pk_3)*/ gnbno,type,subject,name,regdate,hit "
					+ "FROM god_notice_board_3)) "
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
				NoticeBoardVO vo=new NoticeBoardVO();
				vo.setGnbno(rs.getInt(1));
				vo.setType(rs.getString(2));
				vo.setSubject(rs.getString(3));
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
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_notice_board_3";
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
	public int noticeboardRowCount() // 갯수 출력 , 총페이지 
	   {
		   int count=0;
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT COUNT(*) FROM god_notice_board_3";
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
	
	public NoticeBoardVO boardDetailData(int gnbno)
	{
		NoticeBoardVO vo=new NoticeBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_notice_board_3 SET "
					+"hit=hit+1 "
					+"WHERE gnbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gnbno);
			ps.executeUpdate();
			
			sql="SELECT gnbno,name,type,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+"FROM god_notice_board_3 "
					+"WHERE gnbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gnbno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGnbno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setSubject(rs.getString(4));
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
}
