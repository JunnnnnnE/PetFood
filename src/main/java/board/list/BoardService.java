package board.list;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.list.ArticleVO;

public class BoardService {
	BoardDAO boardDAO;
	public BoardService() {
		boardDAO = new BoardDAO();
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();
		List<ArticleVO> articlesList = boardDAO.selectAllArticles(pagingMap);
		int totArticles = boardDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);

		return articlesMap;
	}

//	public List<ArticleVO> listArticles() {
//		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
//		return articlesList;
//	}
	
	
	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}
	
	public int addArticle(ArticleVO article){
		return boardDAO.insertNewArticle(article);
	}

	public void modArticle(ArticleVO article) {
		boardDAO.updateArticle(article);
	}
	public List<Integer> removeArticle(int  articleNO) {
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);
		boardDAO.deleteArticle(articleNO);
		return articleNOList;
	}

	public Map SearchArticles(Map<String, Integer> pagingMap, String search, String searchtype) {
		Map articlesMap = new HashMap();
		
		List<ArticleVO> articlesList = boardDAO.searchArticles(search, searchtype);
		articlesMap.put("articlesList", articlesList);
		int totArticles = boardDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		
		return articlesMap;
	}
	
	// not use
	public List<ArticleVO> SearchArticles(String search, String searchtype) {
		List<ArticleVO> articlesList = boardDAO.searchArticles(search, searchtype);
		return articlesList;
	}
}
