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
		String adType = request.getParameter("adType");

		
		AdVO ad = new AdVO();
		ad.setAdName(adName);
		ad.setAdPhone(adPhone);
		ad.setAdEmail(adEmail);
		ad.setAdEnpName(adEnpName);
		ad.setAdEnpAddress(adEnpAddress);
		ad.setAdEnpType(adEnpType);
		ad.setSearchPath(searchPath);
		ad.setCounselContent(counselContent);
		ad.setAdType(adType);
	
		
		int result = new AdService().insertAd(ad);
		
		System.out.println("result : " + result);
		
		String page = "";
		if(result > 0 ) {
			page = "/semiproject/views/ad/adSuccess.jsp";
			
		} else {
			page = "/semiproject/views/common/errorPage.jsp";
			request.setAttribute("mag", "광고문의 접수에 실패했습니다.");
		}
		response.sendRedirect(page);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
