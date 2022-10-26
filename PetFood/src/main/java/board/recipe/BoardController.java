package board.recipe;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;


@WebServlet("/recipe/*")
public class BoardController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\recipe_image";
	BoardService boardService;
	ArticleVO articleVO;


	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		articleVO = new ArticleVO();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		try {
			//List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
			if (action == null) {	
				String _section=request.getParameter("section");
				String _pageNum=request.getParameter("pageNum");
				int section = Integer.parseInt(((_section==null)? "1":_section) );
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				Map<String, Integer> pagingMap = new HashMap<String, Integer>();
				pagingMap.put("section", section);
				pagingMap.put("pageNum", pageNum);
				Map articlesMap=boardService.listArticles(pagingMap);
				articlesMap.put("section", section);
				articlesMap.put("pageNum", pageNum);
				
				request.setAttribute("articlesMap", articlesMap);
				nextPage = "/board/re_listArticles.jsp";
				
			} else if (action.equals("/listArticles.do")) {
			
				String _section=request.getParameter("section");
				String _pageNum=request.getParameter("pageNum");
				int section = Integer.parseInt(((_section==null)? "1":_section) );
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				Map pagingMap=new HashMap();
				pagingMap.put("section", section);
				pagingMap.put("pageNum", pageNum);
				Map articlesMap=boardService.listArticles(pagingMap);
				articlesMap.put("section", section);
				articlesMap.put("pageNum", pageNum);				
				
				
				request.setAttribute("articlesMap", articlesMap);
				nextPage = "/board/re_listArticles.jsp";
				
			} else if (action.equals("/articleForm.do")) {
				nextPage = "/board/re_articleForm.jsp";
				
			} else if (action.equals("/addArticle.do")) {
				int articleNO=0;
				Map<String, String> articleMap = upload(request, response);
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				

				articleVO.setId("testuser");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				articleNO= boardService.addArticle(articleVO);
				if(imageFileName!=null && imageFileName.length()!=0) {
				    File srcFile = new 	File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(ARTICLE_IMAGE_REPO +"\\"+articleNO);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					srcFile.delete();
				}
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				         +"  alert('새글이 등록되었습니다');" 
						 +" location.href='"+request.getContextPath()+"/recipe/listArticles.do';"
				         +"</script>");

				return;
			}else if(action.equals("/viewArticle.do")){
				String articleNO = request.getParameter("articleNO");
				articleVO=boardService.viewArticle(Integer.parseInt(articleNO));
				request.setAttribute("article",articleVO);
				nextPage = "/board/re_viewArticle.jsp";
				
				
			} else if (action.equals("/modArticle.do")) {
				Map<String, String> articleMap = upload(request, response);
				int articleNO = Integer.parseInt(articleMap.get("articleNO"));
				articleVO.setArticleNO(articleNO);
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");

				articleVO.setId("tetuser");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				boardService.modArticle(articleVO);
				if (imageFileName != null && imageFileName.length() != 0) {
					String originalFileName = articleMap.get("originalFileName");
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					;
					File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
					oldFile.delete();
				}
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "  alert('수정되었습니다^^');" + " location.href='" + request.getContextPath()
						+ "/recipe/viewArticle.do?articleNO=" + articleNO + "';" + "</script>");
				return;
				
			} else if (action.equals("/removeArticle.do")) {
				int articleNO = Integer.parseInt(request.getParameter("articleNO"));
				List<Integer> articleNOList = boardService.removeArticle(articleNO);
				for (int _articleNO : articleNOList) {
					File imgDir = new File(ARTICLE_IMAGE_REPO + "\\" + _articleNO);
					if (imgDir.exists()) {
						FileUtils.deleteDirectory(imgDir);
					}
				}
				
				System.out.println("삭제됨");
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "  alert('삭제햇다');" + " location.href='" + request.getContextPath()
				+ "/recipe/listArticles.do';" + "</script>");
				return;
			} else if (action.equals("/setMainPage.do")) {
				List<ArticleVO> vo = boardService.getMainPage();
				System.out.println(vo);
				
				request.setAttribute("recipeArticles", vo);
				nextPage = "/view/main.jsp";
				
				
			}
			
			
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> articleMap = new HashMap<String, String>();
		String encoding = "utf-8";
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("fileItem.getFieldName()" + fileItem.getFieldName());

					System.out.println("fileItem.getSize()" + fileItem.getSize() + "bytes");

					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}

						String fileName = fileItem.getName().substring(idx + 1);
						System.out.println("파일 생성이름:" + fileName);
						articleMap.put(fileItem.getFieldName(), fileName);  
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						fileItem.write(uploadFile);

					} // end if
				} // end if
			} // end for
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleMap;
	}

}
