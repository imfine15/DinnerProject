package com.kh.semi.ad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.ad.model.service.PartnerService;
import com.kh.semi.ad.model.vo.PartnerVO;

/**
 * Servlet implementation class InsertPartnerServlet
 */
@WebServlet("/insert.pa")
public class InsertPartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPartnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("pName");
		String phone=request.getParameter("pPhone");
		String mail=request.getParameter("pMail");
		String storeName=request.getParameter("pStoreName");
		String address=request.getParameter("pAddress");
		String kind=request.getParameter("pKind");
		String product = request.getParameter("product");
		String content = request.getParameter("pContent");
		
		PartnerVO partner = new PartnerVO();
		
		partner.setPartQName(name);
		partner.setPartQPhone(phone);
		partner.setPartQEmail(mail);
		partner.setPartQTitle(storeName);
		partner.setPartQAddress(address);
		partner.setPartQEnpType(kind);
		partner.setPartQType(product);
		partner.setPartQContent(content);
		
		int result = new PartnerService().insertPartnerQuestion(partner);
		
		if(result > 0) {
			response.sendRedirect("/semiproject/views/partner/partner_comp.jsp");
		} else { 
			request.setAttribute("msg", "제휴문의 등록 실패");
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
