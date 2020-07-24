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
 * Servlet implementation class InsertAdServlet
 */
@WebServlet("/insertAd.ad")
public class InsertAdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adName = request.getParameter("adName");
		String adPhone = request.getParameter("adPhone");
		String adEmail = request.getParameter("adEmail");
		String adEnpName = request.getParameter("adEnpName");
		String adEnpAddress = request.getParameter("adEnpAddress");
		String adEnpType = request.getParameter("adEnpType");
		String searchPath = request.getParameter("searchPath");
		String counselContent = request.getParameter("counselContent");
		//String adContent = request.getParameter("adContent");
		//String adTitle = request.getParameter("adTitle");
		
		AdVO ad = new AdVO();
		ad.setAdName(adName);
		ad.setAdPhone(adPhone);
		ad.setAdEmail(adEmail);
		ad.setAdEnpName(adEnpName);
		ad.setAdEnpAddress(adEnpAddress);
		ad.setAdEnpType(adEnpType);
		ad.setSearchPath(searchPath);
		ad.setCounselContent(counselContent);
		//ad.setAdContent(adContent);
		//ad.setAdTitle(adTitle);
		
//		System.out.println("adName : " + adName);
//		System.out.println("adPhone : " + adPhone);
//		System.out.println("adEmail : " + adEmail);
//		System.out.println("adEnpName : " + adEnpName);
//		System.out.println("adEnpAddress : " + adEnpAddress);
//		System.out.println("adEnpType : " + adEnpType);
//		System.out.println("searchPath : " + searchPath);
//		System.out.println("counselContent : " + counselContent);
//		System.out.println("adContent : " + adContent);
//		System.out.println("adTitle : " + adTitle);
		
		int result = new AdService().insertAd(ad);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
