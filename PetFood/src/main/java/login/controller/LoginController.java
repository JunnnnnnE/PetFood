package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.user.UserVO;
import login.user.impl.UserDAO;

@WebServlet("/LoginController/*")
public class LoginController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
	  request.setCharacterEncoding("UTF-8");
      process(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      process(request, response);
   }
   private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String nextPage = "";  
	  request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html; charset=utf-8"); 
      try {
      //클라이언트의 요청 path 정보를 추출
            String uri = request.getRequestURI();
            String path = uri.substring(uri.lastIndexOf("/"));
            System.out.println(path);
            
            //2. 클라이언트의 요청 path에 따라 적절히 분기처리 한다.
            if(path.equals("/login.do")) {
               System.out.println("로그인 처리");
               
               //1. 사용자 입력 정보 추출
               String userId = request.getParameter("userId");
               String userPwd = request.getParameter("userPwd");
	   
               //2. DB연동 처리
               UserVO vo = new UserVO();
               vo.setUserId(userId);
               vo.setUserPwd(userPwd);

               UserDAO userDAO = new UserDAO();
               UserVO user = userDAO.getUser(vo);
               
               //3. 화면 네비게이션
               if(user != null) { 	// 로그인 성공
            	  HttpSession session = request.getSession();
   				  session.setAttribute("user", user);
   				  String n = (String)session.getAttribute("userName");

//                nextPage = "/view/main.jsp"; //로그인 성공 했을때 넘어갈 페이지(메인)
                  nextPage = "/view/main.jsp";
                  
               } else {			// 로그인 실패
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.println("<script language='javascript'>");
					out.println("alert('아이디,비밀번호가 잘못되었습니다.')");
					out.println("history.back()");
					out.println("</script>");

					out.flush();
					nextPage = "/login/login.jsp";
					return;
					// response.sendRedirect("login.jsp");
				}
               
            } else if(path.equals("/logout.do")) {
               System.out.println("로그아웃 처리");
               
               //브라우저와 연결된 세션 객체를 강제 종료
               HttpSession session = request.getSession();
               session.invalidate();

               //세션 종료 후, 메인 화면으로 이동
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				         +"  alert('로그아웃 되었습니다.');" 
						 +" location.href='"+request.getContextPath()
						 //+"/PetFoodBoard/listArticles.do';"
						 +"/view/main.jsp';"
				         +"</script>");
				return;
               //response.sendRedirect("../view/main.jsp");
               //System.out.println("main으로 이동");
            }
			else if (path.equals("/idFind.do")) {	// 아이디찾기

				// 1. 사용자 입력정보추출
				String userName = request.getParameter("user_Name");
				String userEmail = request.getParameter("user_Email");

				// 2. DB연동 처리
				UserVO vo = new UserVO();
				vo.setUserName(userName);
				vo.setUserEmail(userEmail);

				UserDAO userDAO = new UserDAO();
				UserVO user = userDAO.findUserId(vo);

				if (user == null) { // 아이디찾기 실패
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter id = response.getWriter();
					id.print("<script>" + "  alert('입력된 회원정보가 존재하지않습니다.');" 
							+ " location.href='" + request.getContextPath()
							+ "/login/id_find.jsp';" + "</script>");
					return;
				}

				String findId = user.getUserId();

				// 3. 화면 네비게이션
				if (findId != null) { // 아이디찾기 성공
					HttpSession session = request.getSession();
					session.setAttribute("findId", findId);

					nextPage = "/login/findIdResult.jsp";
				}
			}
			
			
			// 비밀번호찾기
			else if (path.equals("/pwFind.do")) {

				// 1. 사용자 입력정보추출
				String userId = request.getParameter("user_Id");
				String userName = request.getParameter("user_Name");
				String userEmail = request.getParameter("user_Email");

				// 2. DB연동 처리
				UserVO vo = new UserVO();
				vo.setUserId(userId);
				vo.setUserName(userName);
				vo.setUserEmail(userEmail);

				UserDAO userDAO = new UserDAO();
				UserVO user = userDAO.findUserPwd(vo);

				if (user == null) { // 비밀번호찾기 실패
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter id = response.getWriter();
					id.print("<script>" + "  alert('입력된 회원정보가 존재하지않습니다.');" 
							+ " location.href='" + request.getContextPath()
							+ "/login/id_find.jsp';" + "</script>");
					return;
				}

				String findPwd = user.getUserPwd();

				// 3. 화면 네비게이션
				if (findPwd != null) { // 비밀번호 성공
					HttpSession session = request.getSession();
					session.setAttribute("findPwd", findPwd);

					nextPage = "/login/findPwdResult.jsp";
				}
			}
            RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
            dispatch.forward(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
   }

}