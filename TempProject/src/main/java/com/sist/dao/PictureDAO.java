package com.sist.dao;

import java.util.*;

import com.sist.vo.PictureVO;

import java.sql.*;

public class PictureDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 1. 그림 목록 출력
	public ArrayList<PictureVO> PictureListData(int page) {
		ArrayList<PictureVO> list = new ArrayList<PictureVO>();
		try {
			conn = CreateConnection.getConnection();
			String sql = "SELECT gpno, image, title, name, content, num "
					+ "FROM (SELECT gpno, image, title, name, content, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(god_picture_3 gp_gpno_pk)*/gpno, image, title, name, content "
					+ "FROM god_picture_3)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 20;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PictureVO vo = new PictureVO();
				vo.setGpno(rs.getInt(1));
				vo.setImage(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setContent(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	public int PictureListTotalPage() {
	      int total=0;
	      try {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT CEIL(COUNT(*)/20.0) FROM god_picture_3";
	         ps=conn.prepareStatement(sql);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         total=rs.getInt(1);
	         rs.close();
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return total;
	   }
	
	// 2. 그림 상세보기
	
}
