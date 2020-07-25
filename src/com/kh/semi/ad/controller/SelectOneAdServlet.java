package com.kh.semi.ad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.ad.model.service.AdService;
import com.kh.semi.ad.model.vo.AdVO;

/**
 * Servlet implementation class SelectOneAdServlet
 */
@WebServlet("/selectOneAd.ad")
public class SelectOneAdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneAdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adNo = request.getParameter("no");
		
		
		AdVO ad = new AdService().selectOneAd(adNo);
		
		String page = "";
		if(ad != null) {
			page="views/admin/adQuestion/adDetail.jsp";
			request.setAttribute("ad", ad);
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "내역 조회에 실패했습니다.");
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
