package com.sist.dao;
import java.util.*;

import com.sist.vo.ExhibitionVO;

import java.sql.*;
public class ExhibitionDAO {
   private Connection conn;
   private PreparedStatement ps;
  /*
   *  Geno,poster,title,period
  */
   // 기능 ===> 페이징
   // 1. 전체 출력 
   public ArrayList<ExhibitionVO> exhibitionAllListData(int page)
   {
	   ArrayList<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT geno,poster,title,period,num "
				     +"FROM (SELECT geno,poster,title,period,rownum as num "
				     +"FROM (SELECT /*+ INDEX_ASC(god_exhibition_3 ge_geno_pk)*/ geno,poster,title,period  "
				     +"FROM god_exhibition_3)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ExhibitionVO vo=new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
	           vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setPeriod(rs.getString(4));
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
   public int exhibitionAllTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM god_exhibition_3";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return total;
   }
   
   // 메인페이지에서 쓸거 만든거에요!
   public List<ExhibitionVO> normalExhibitionData() {
	   List<ExhibitionVO> list = new ArrayList<ExhibitionVO>();
	   try {
		   conn = CreateConnection.getConnection();
		   String sql = "SELECT geno, poster, title, title2, period, kind "
		   			  + "FROM god_exhibition_3 "
		   			  + "WHERE kind = '일반전시회 (B2C)'";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   ExhibitionVO vo = new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setTitle2(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setKind(rs.getString(6));
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
   
   public List<ExhibitionVO> tradeExhibitionData() {
	   List<ExhibitionVO> list = new ArrayList<ExhibitionVO>();
	   try {
		   conn = CreateConnection.getConnection();
		   String sql = "SELECT geno, poster, title, title2, period, kind "
				   + "FROM god_exhibition_3 "
				   + "WHERE kind = '무역전시회 (B2B)'";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   ExhibitionVO vo = new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setTitle2(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setKind(rs.getString(6));
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
   //------------------------- 여기까지!
}
//   // 2. 특가
//   public ArrayList<VO> goodsSpecialListData(int page)
//   {
//	   ArrayList<GoodsVO> list=new ArrayList<GoodsVO>();
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT no,goods_name,goods_poster,num "
//				     +"FROM (SELECT no,goods_name,goods_poster,rownum as num "
//				     +"FROM (SELECT /*+ INDEX_ASC(goods_new gn_no_pk)*/no,goods_name,goods_poster "
//				     +"FROM goods_special)) "
//				     +"WHERE num BETWEEN ? AND ?";
//		   ps=conn.prepareStatement(sql);
//		   int rowSize=20;
//		   int start=(rowSize*page)-(rowSize-1);
//		   int end=rowSize*page;
//		   ps.setInt(1, start);
//		   ps.setInt(2, end);
//		   ResultSet rs=ps.executeQuery();
//		   while(rs.next())
//		   {
//			   GoodsVO vo=new GoodsVO();
//			   vo.setNo(rs.getInt(1));
//			   vo.setGoods_name(rs.getString(2));
//			   vo.setGoods_poster(rs.getString(3));
//			   list.add(vo);
//		   }
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return list;
//   }
//   public int goodsSpecialTotalPage()
//   {
//	   int total=0;
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM goods_new";
//		   ps=conn.prepareStatement(sql);
//		   ResultSet rs=ps.executeQuery();
//		   rs.next();
//		   total=rs.getInt(1);
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return total;
//   }
//   // 3. 베스트
//   public ArrayList<GoodsVO> goodsBestListData(int page)
//   {
//	   ArrayList<GoodsVO> list=new ArrayList<GoodsVO>();
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT no,goods_name,goods_poster,num "
//				     +"FROM (SELECT no,goods_name,goods_poster,rownum as num "
//				     +"FROM (SELECT /*+ INDEX_ASC(goods_best gb_no_pk)*/no,goods_name,goods_poster "
//				     +"FROM goods_best)) "
//				     +"WHERE num BETWEEN ? AND ?";
//		   ps=conn.prepareStatement(sql);
//		   int rowSize=20;
//		   int start=(rowSize*page)-(rowSize-1);
//		   int end=rowSize*page;
//		   ps.setInt(1, start);
//		   ps.setInt(2, end);
//		   ResultSet rs=ps.executeQuery();
//		   while(rs.next())
//		   {
//			   GoodsVO vo=new GoodsVO();
//			   vo.setNo(rs.getInt(1));
//			   vo.setGoods_name(rs.getString(2));
//			   vo.setGoods_poster(rs.getString(3));
//			   list.add(vo);
//		   }
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return list;
//   }
//   public int goodsBestTotalPage()
//   {
//	   int total=0;
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM goods_best";
//		   ps=conn.prepareStatement(sql);
//		   ResultSet rs=ps.executeQuery();
//		   rs.next();
//		   total=rs.getInt(1);
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return total;
//   }
//   // 4. 신상품 
//   public ArrayList<GoodsVO> goodsNewListData(int page)
//   {
//	   ArrayList<GoodsVO> list=new ArrayList<GoodsVO>();
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT no,goods_name,goods_poster,num "
//				     +"FROM (SELECT no,goods_name,goods_poster,rownum as num "
//				     +"FROM (SELECT /*+ INDEX_ASC(goods_new gn_no_pk)*/no,goods_name,goods_poster "
//				     +"FROM goods_new)) "
//				     +"WHERE num BETWEEN ? AND ?";
//		   ps=conn.prepareStatement(sql);
//		   int rowSize=20;
//		   int start=(rowSize*page)-(rowSize-1);
//		   int end=rowSize*page;
//		   ps.setInt(1, start);
//		   ps.setInt(2, end);
//		   ResultSet rs=ps.executeQuery();
//		   while(rs.next())
//		   {
//			   GoodsVO vo=new GoodsVO();
//			   vo.setNo(rs.getInt(1));
//			   vo.setGoods_name(rs.getString(2));
//			   vo.setGoods_poster(rs.getString(3));
//			   list.add(vo);
//		   }
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return list;
//   }
//   public int goodsNewTotalPage()
//   {
//	   int total=0;
//	   try
//	   {
//		   conn=CreateConnection.getConnection();
//		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM goods_new";
//		   ps=conn.prepareStatement(sql);
//		   ResultSet rs=ps.executeQuery();
//		   rs.next();
//		   total=rs.getInt(1);
//		   rs.close();
//	   }catch(Exception ex)
//	   {
//		   ex.printStackTrace();
//	   }
//	   finally
//	   {
//		   CreateConnection.disConnection(conn, ps);
//	   }
//	   return total;
//   }
//}