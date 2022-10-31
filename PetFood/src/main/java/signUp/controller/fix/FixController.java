package signUp.controller.fix;

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

@WebServlet("/FixController/*")
public class FixController extends HttpServlet {
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
            HttpSession session = request.getSession();
                           
               //1. 사용자 입력 정보 추출
               UserVO user = (UserVO)session.getAttribute("user");
               String userId = user.getUserId();
	   
               //2. DB연동 처리
               FixVO vo = new FixVO();
               vo.setUserId(userId);

               FixDAO fixDAO = new FixDAO();
               FixVO fix = fixDAO.getFix(vo);
               
               session.setAttribute("fix", fix);

         } catch (Exception e) {
            e.printStackTrace();
         }

      response.sendRedirect("../PetFood/userFix.jsp");
   }

}