package board.list;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.list.ArticleVO;

public class BoardDAO {
	private final String BOARD_INSERT = "INSERT INTO t_petfood_board (articleNO, title, content, imageFileName, id) VALUES (?, ? ,?, ?, ?)"; 
	private final String BOARD_UPDATE = "update t_petfood_board set title=?,content=?";
	private final String BOARD_UPDATE_COUNT = "update t_petfood_board set count=? where articleNO=?";
	private final String BOARD_DELETE = "DELETE FROM t_petfood_board WHERE articleNO=?";
	private final String BOARD_GET = "select * from t_petfood_board where articleNO=?";
	private final String BOARD_LIST = "SELECT * from t_petfood_board";
	private final String BOARD_GET_NEW_ARTICLE = "SELECT  max(articleNO) from t_petfood_board";

	private final String BOARD_SEARCH = "SELECT * from t_petfood_board WHERE ";
	
	
	
	private DataSource dataFactory;
	Connection conn;
	PreparedStatement pstmt;

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("mariadb");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<ArticleVO> selectAllArticles(Map pagingMap){
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		int section = (Integer)pagingMap.get("section");
		int pageNum=(Integer)pagingMap.get("pageNum");

		
		System.out.println(section + " : 세션 수 뜨나보자");
		System.out.println(pageNum + " : 페이지 수 뜨나보자");
		try{
		   conn = dataFactory.getConnection();
		   
		   String query = "select * from ("
		   		+ "select row_number() over(order by articleNO desc) as 'recNum',"
		   		+ " articleNO,  title, id, writedate, imageFileName"
		   		+ " from t_petfood_board"
		   		+ " where articleNO"
		   		+ " ) as c"
		   		+ " where  c.recNum between(?-1)*100+(?-1)*12+1 and (?-1)*100+?*12";		 

			
		   System.out.println(query);
		   pstmt= conn.prepareStatement(query);
		    
			
			 pstmt.setInt(1, section); 
			 pstmt.setInt(2, pageNum); 
			 pstmt.setInt(3, section);
			 pstmt.setInt(4, pageNum);
			 
			 
			
			

					 
		   ResultSet rs =pstmt.executeQuery();
		   while(rs.next()){
  
		      int articleNO = rs.getInt("articleNO");
		      String title = rs.getString("title");
		      String id = rs.getString("id");
		      Date writeDate= rs.getDate("writeDate");
		      String imageFileName= rs.getString("imageFileName");


		      ArticleVO article = new ArticleVO();

		      article.setArticleNO(articleNO);
		      article.setTitle(title);
		      article.setId(id);
		      article.setWriteDate(writeDate);
		      article.setImageFileName(imageFileName);

		      System.out.println("add간다");
		      articlesList.add(article);	
		      
		   } //end while
		   rs.close();
		   pstmt.close();
		   conn.close();
	  }catch(Exception e){
	     e.printStackTrace();	
	  }
	  return articlesList; 
    } 
	
	
	public List<ArticleVO> selectAllArticles() {
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		try {
			conn = dataFactory.getConnection();
//			String query = "SELECT articleNO,title,content,id, writeDate" + " from t_petfood_board";
			String query = BOARD_LIST;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int articleNO = rs.getInt("articleNO");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				Date writeDate = rs.getDate("writeDate");
				ArticleVO article = new ArticleVO();
				article.setArticleNO(articleNO);
				article.setTitle(title);
				article.setContent(content);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articlesList;
	}

	private int getNewArticleNO() {
		try {
			conn = dataFactory.getConnection();
//			String query = "SELECT  max(articleNO) from t_petfood_board ";
			String query = BOARD_GET_NEW_ARTICLE;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			if (rs.next())
				return (rs.getInt(1) + 1);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int insertNewArticle(ArticleVO article) {
		int articleNO = getNewArticleNO();
		try {
			conn = dataFactory.getConnection();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
//			String query = "INSERT INTO t_petfood_board (articleNO, title, content, imageFileName, id)"
//					+ " VALUES (?, ? ,?, ?, ?)";
			String query = BOARD_INSERT;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, imageFileName);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleNO;
	}

	public ArticleVO selectArticle(int articleNO){
		ArticleVO article=new ArticleVO();
		try{
			conn = dataFactory.getConnection();
//			String query ="select articleNO,title,content, imageFileName,id,writeDate, count"
//				                     +" from t_petfood_board" 
//				                     +" where articleNO=?";
			String query = BOARD_GET;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs =pstmt.executeQuery();
			rs.next();
			int _articleNO =rs.getInt("articleNO");
			String title = rs.getString("title");
			String content =rs.getString("content");
		    String imageFileName = rs.getString("imageFileName"); 
			String id = rs.getString("id");
			Date writeDate = rs.getDate("writeDate");
			int count = rs.getInt("count");
			
			updateArticleCount(count, _articleNO); 
			
			article.setArticleNO(_articleNO);
			article.setTitle(title);
			article.setContent(content);
			article.setImageFileName(imageFileName);
			article.setId(id);
			article.setWriteDate(writeDate);
			article.setCount(count+1);
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();	
		}
			return article;
	}

	public void updateArticleCount(int count, int articleNO) {
		try {
			conn = dataFactory.getConnection();
//			String query = "update t_petfood_board  set count=?";
//			query += " where articleNO=?";
			
			String query = BOARD_UPDATE_COUNT;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, count+1);
			pstmt.setInt(2, articleNO);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticle(ArticleVO article) {
		int articleNO = article.getArticleNO();
		String title = article.getTitle();
		String content = article.getContent();
		String imageFileName = article.getImageFileName();
		try {
			conn = dataFactory.getConnection();
//			String query = "update t_petfood_board set title=?,content=?";
			String query = BOARD_UPDATE;
			
			if (imageFileName != null && imageFileName.length() != 0) {
				query += ",imageFileName=?";
			}
			query += " where articleNO=?";
			
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, articleNO);
			} else {
				pstmt.setInt(3, articleNO);
			}
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteArticle(int  articleNO) {
		try {
			conn = dataFactory.getConnection();
//			String query = "DELETE FROM t_petfood_board WHERE articleNO=?";
			String query = BOARD_DELETE;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Integer> selectRemovedArticles(int  articleNO) {
		List<Integer> articleNOList = new ArrayList<Integer>();
		try {
			conn = dataFactory.getConnection();
//			String query = "SELECT articleNO FROM t_petfood_board  ";
			String query = BOARD_LIST;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				articleNO = rs.getInt("articleNO");
				articleNOList.add(articleNO);
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleNOList;
	}

	public int selectTotArticles() {
		try {
			conn = dataFactory.getConnection();
			String query = "select count(articleNO) from t_petfood_board ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				return (rs.getInt(1));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<ArticleVO> searchArticles(String search, String searchtype) { // searchtype : TITLE/CONTENT/BOTH
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		try {
			conn = dataFactory.getConnection();
//			String query = "SELECT articleNO,title,content,id, writeDate from t_petfood_board WHERE title like'%" + search + "%'";
//			query += " or content like" + "'%" + search + "%'";
			
			
			String query = BOARD_SEARCH;
			if (searchtype.equals("TITLE")) {
				query += " title like'%" + search + "%'";
			}
			else if (searchtype.equals("CONTENT")) {
				query += " content like'%" + search + "%'";				
			}
			else if (searchtype.equals("BOTH")) {
				query += " title like'%" + search + "%' or content like" + "'%" + search + "%'";				
			}
			
			System.out.println(query);
			pstmt = conn.prepareStatement(query);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int articleNO = rs.getInt("articleNO");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				Date writeDate = rs.getDate("writeDate");
				ArticleVO article = new ArticleVO();
				article.setArticleNO(articleNO);
				article.setTitle(title);
				article.setContent(content);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articlesList;
	}
}
