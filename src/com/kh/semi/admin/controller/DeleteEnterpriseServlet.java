package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

/**
 * Servlet implementation class DeleteEnterpriseServlet
 */
@WebServlet("/deleteEnt.up")
public class DeleteEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		
		
		EnpUpVo enpUp = new EnpUpVo();
		enpUp.setEnpNo(enpNo);
		
		
		ArrayList<EnpUpVo> list = new AdminService().selectList();
		
		int result = new AdminService().deleteEnterprise(enpUp);
		
		System.out.println("result : " + result);
		
		String page ="";
		
		if(result > 0) {
			if(list != null) {
				page="views/admin/restaurant/restaurantUpload.jsp";
				request.setAttribute("list", list);
			} else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 조회 실패");
			}
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 삭제 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
