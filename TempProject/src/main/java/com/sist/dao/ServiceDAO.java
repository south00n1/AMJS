package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
/* 
GANO       NOT NULL NUMBER         
SUBJECT    NOT NULL VARCHAR2(1000) 
TYPE       NOT NULL VARCHAR2(20)   
CONTENT    NOT NULL CLOB           
PWD        NOT NULL VARCHAR2(20)   
REGDATE             DATE           
ANS_STATE           VARCHAR2(20)   
HIT                 NUMBER         
GROUP_ID   NOT NULL NUMBER         
GROUP_STEP          NUMBER         
GROUP_TAB           NUMBER         
ID                  VARCHAR2(20)

group_id : 댓글 그룹 번호
group_step : 그룹 내 출력 순서
group_tab : 댓글/대댓글/대대댓글
root : 댓글 소속
depth : 포함 대댓글 갯수
                     group_id   group_step    group_tab    root    depth 
    1AAAAAA             1           1             0          0       2           
      => 2BBBBBB        1           2             1          1       0
      => 3CCCCCC        1           3             1          1       1
         => 4DDDDDDDD   1           4             2          3       0
    EEEEEE              2           1             0
      =>KKKKKK          2           2             1
*/
public class ServiceDAO {
	private Connection conn;
	private PreparedStatement ps;
	/* **** 참조키 id 해결하기 insert가 안됨 **** */
	//QNA 목록 출력
	public List<AskVO> qnaListData(int page){
		List<AskVO> list=new ArrayList<AskVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT gano,id,subject,type,ans_state,group_tab,hit,TO_CHAR(regdate,'YYYY-MM-DD'),depth,num "
					+ "FROM (SELECT gano,id,subject,type,ans_state,group_tab,hit,regdate,depth,rownum as num "
					+ "FROM (SELECT gano,id,subject,type,ans_state,group_tab,hit,regdate,depth "
					+ "FROM god_ask_3 ORDER BY group_id DESC, group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=rowSize*(page-1)+1;
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				AskVO vo=new AskVO();
				vo.setGano(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setType(rs.getString(4));
				vo.setAns_state(rs.getString(5));
				vo.setGroup_tab(rs.getInt(6));
				vo.setHit(rs.getInt(7));
				vo.setDbday(rs.getString(8));
				vo.setDepth(rs.getInt(9));
				list.add(vo);
			}
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	//QNA 목록 번호
	public int qnaRowCount(){
		int count=0;
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM god_ask_3";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return count;
	}
	//QNA 상세 출력
	public AskVO qnaDetailData(int no, int type) {
		AskVO vo=new AskVO();
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			if(type==1) {
				sql="UPDATE god_ask_3 "
						+ "SET hit=hit+1 "
						+ "WHERE gano=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
			
			sql="SELECT gano,subject,type,content,ans_state,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM god_ask_3 "
					+ "WHERE gano=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGano(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setAns_state(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	//QNA 작성
	public void qnaInsert(AskVO vo, String id) {
		try {
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_ask_3(gano,id,pwd,subject,type,content,group_id) "
					+ "VALUES(ga_gano_seq_3.nextval,?,?,?,?,?,(SELECT NVL(MAX(group_id)+1,1) "
					+ "FROM god_ask_3))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getType());
			ps.setString(5, vo.getContent());
			ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	//QNA 답변
	public void qnaReplyInsert(int no, String id, AskVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT group_id,group_step,group_tab,type "
					+ "FROM god_ask_3 "
					+ "WHERE gano=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
	  		rs.next();
	  		AskVO rvo=new AskVO();
	  		rvo.setGroup_id(rs.getInt(1));
	  		rvo.setGroup_step(rs.getInt(2));
	  		rvo.setGroup_tab(rs.getInt(3));
	  		rvo.setType(rs.getString(4));
	  		rs.close();
	  		
	  		sql="UPDATE god_ask_3 "
	     		   + "SET group_step=group_step+1 "
	     		   + "WHERE group_id=? "
	     		   + "AND group_step>?";
	     	ps=conn.prepareStatement(sql);
	     	ps.setInt(1, rvo.getGroup_id());
	     	ps.setInt(2, rvo.getGroup_step());
	     	ps.executeUpdate();
			
	     	if(id.equals("master")) {
	     		sql="INSERT INTO god_ask_3(gano,id,pwd,subject,type,content,regdate,hit,"
	     				+ "group_id,group_step,group_tab,root,depth) "
	     				+ "VALUES(ga_gano_seq_3.nextval,?,?,'답변입니다.',?,?,SYSDATE,0,?,?,?,?,0)";
	     		ps=conn.prepareStatement(sql);
	     		ps.setString(1, id);
	     		ps.setString(2, vo.getPwd());
	     		ps.setString(3, rvo.getType());
	     		ps.setString(4, vo.getContent());
	     		ps.setInt(5, rvo.getGroup_id());
	     		ps.setInt(7, rvo.getGroup_step()+1);
	     		ps.setInt(8, rvo.getGroup_tab()+1);
	     		ps.setInt(9, no);
	     		ps.executeUpdate();
	     	}
			
			sql="UPDATE god_ask_3 "
					+ "SET depth=depth+1 "
					+ "WHERE gano=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	//QNA 수정
	public boolean qnaUpdate(AskVO vo) {
		boolean bCheck=false;
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT pwd FROM god_ask_3 "
					+ "WHERE gano=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getGano());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				sql="UPDATE god_ask_3 "
						+ "SET subject=?, content=?, type=? "
						+ "WHERE gano=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getSubject());
				ps.setString(2, vo.getContent());
				ps.setString(3, vo.getType());
				ps.setInt(4, vo.getGano());
				ps.executeUpdate();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	//QNA 삭제
	public boolean qnaDelete(int no, String pwd) {
		boolean bCheck=false;
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT pwd,root,depth "
					+ "FROM god_ask_3 "
					+ "WHERE gano=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			int root=rs.getInt(2);
			int depth=rs.getInt(3);
			rs.close();
			
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				if(depth==0) {
					sql="DELETE FROM god_ask_3 "
							+ "WHERE gano=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
				} else {
					String msg="삭제된 게시물입니다";
					sql="UPDATE god_ask_3 "
							+ "SET subject=?, content=? "
							+ "WHERE gano=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setString(2, msg);
					ps.setInt(3, no);
					ps.executeUpdate();
				}
			}
			
			if(root!=0) {
				sql="UPDATE god_ask_3 "
						+ "SET depth=depth-1 "
						+ "WHERE gano=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, root);
				ps.executeUpdate();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	//QNA 검색
}
