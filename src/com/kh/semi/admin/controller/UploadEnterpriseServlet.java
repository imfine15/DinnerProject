package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

/**
 * Servlet implementation class UploadEnterpriseServlet
 */
@WebServlet("/uploadEnp.up")
public class UploadEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("no");
		
		EnpUpVo enp = new EnpUpVo();
		enp.setEnpNo(enpNo);
		
		int result = new EnpService().uploadEnp(enp);
		
		System.out.println("result1 : " +result);
		
		String page = "";
		if(result > 0 ) {
			
			response.sendRedirect("/semiproject/selectEntList.up");
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
			request.getRequestDispatcher(page).forward(request, response);
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
