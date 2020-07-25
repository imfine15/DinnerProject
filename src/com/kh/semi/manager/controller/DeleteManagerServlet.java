package com.kh.semi.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.manager.model.service.ManagerService;
import com.kh.semi.manager.model.vo.ManagerVo;

/**
 * Servlet implementation class DeleteManagerServlet
 */
@WebServlet("/delete.ma")
public class DeleteManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String managerNo = request.getParameter("no");

		ManagerVo manager = new ManagerVo();
		manager.setManagerNo(managerNo);
		
		int result = new ManagerService().deleteManager(manager);
		
		if(result > 0) {
			response.sendRedirect("/semiproject/selectList.ma");
		} else {
			request.setAttribute("msg", "직원 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
