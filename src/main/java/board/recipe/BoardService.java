package board.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.list.ArticleVO;

public class BoardService {
	board.recipe.BoardDAO boardDAO;

	public BoardService() {
		boardDAO = new board.recipe.BoardDAO();
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();
		List<ArticleVO> articlesList = boardDAO.selectAllArticles(pagingMap);
		int totArticles = boardDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);

		return articlesMap;
	}

	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}

	public int addArticle(board.recipe.ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}

	public board.recipe.ArticleVO viewArticle(int articleNO) {
		board.recipe.ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}

	public void modArticle(board.recipe.ArticleVO article) {
		boardDAO.updateArticle(article);
	}

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);
		boardDAO.deleteArticle(articleNO);
		return articleNOList;
	}

	
	public Map SearchArticles(Map<String, Integer> pagingMap, String search, String searchtype) {
		Map articlesMap = new HashMap();
		
		List<board.recipe.ArticleVO> articlesList = boardDAO.searchArticlesRecipe(search, searchtype);
		articlesMap.put("articlesList", articlesList);
		int totArticles = boardDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		
		return articlesMap;
	}
	
	// not use
	public List<board.recipe.ArticleVO> SearchArticles(String search, String searchtype) {
		List<board.recipe.ArticleVO> articlesList = boardDAO.searchArticlesRecipe(search, searchtype);
		return articlesList;
	}
	
	
	
	
	
	
	public int addReply(board.recipe.ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}
	
	public List<board.recipe.ArticleVO> getMainPage() {
		return boardDAO.getMainPageInfo();
	}

}
