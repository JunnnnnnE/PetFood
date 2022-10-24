package login.controller;

import java.io.IOException;

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
      process(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      process(request, response);
   }
   private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String nextPage = "";   
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

//                nextPage = "/view/main.jsp"; //로그인 성공 했을때 넘어갈 페이지(메인)
                  nextPage = "/view/main.jsp";
                  
               } else {			// 로그인 실패
                  nextPage = "/login.jsp";
                  //response.sendRedirect("login.jsp");
               }
               
            } else if(path.equals("/logout.do")) {
               System.out.println("로그아웃 처리");
               
               //브라우저와 연결된 세션 객체를 강제 종료
               HttpSession session = request.getSession();
               session.invalidate();

               //세션 종료 후, 메인 화면으로 이동
               response.sendRedirect("login.jsp");
            }
            RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
            dispatch.forward(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
   }

}