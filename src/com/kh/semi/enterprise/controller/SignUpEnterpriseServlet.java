package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;
/*import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;*/

/**
 * Servlet implementation class SignUpEnterpriseServlet
 */
@WebServlet("/signUp.en")
public class SignUpEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String juminNo = request.getParameter("juminNo");
		String name = request.getParameter("name");
		String enterpriseName = request.getParameter("enterpriseName");
		String bank = request.getParameter("bank");
		String bankAccount = request.getParameter("bankAccount");
		String enterpriseNumber = request.getParameter("enterpriseNumber");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String enterpriseType = request.getParameter("enterpriseType");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String enterpriseLicense = request.getParameter("enterpriseLicensee");
		String admit = request.getParameter("admit"); // 동의했을경우 on
		String termsAdmit = "0";
		if(admit.equals("on")) {
			termsAdmit = "1"; // 비동의시 0, 동의시 1
		}
		
		System.out.println(termsAdmit);
		
		EnpVO requestEnp = new EnpVO();
		requestEnp.setPartnerId(id);
		requestEnp.setPartnerPwd(password);
		requestEnp.setJuminNo(juminNo);
		requestEnp.setPartnerName(name);
		requestEnp.setEnpName(enterpriseName);
		requestEnp.setBank(bank);
		requestEnp.setBankAccount(bankAccount);
		requestEnp.setEnpNo(enterpriseNumber);
		requestEnp.setEnpAddress(address + "$"+addressDetail);
		requestEnp.setEnpType(enterpriseType);
		requestEnp.setPartnerEmail(email);
		requestEnp.setEnpPhone(phone);
		requestEnp.setEnpLicense(enterpriseLicense);
		
		
		
		
		
		
		int result = new EnpService().insertPartnerEnp(requestEnp);
		
		String page="";
		if(result > 0) {
			
			System.out.println("업체 정보 입력에 성공했습니다.");
		} else {
			request.setAttribute("msg", "업체 정보 입력에 실패했습니다.");
			page="/semiproject/views/enterprise/common/errorPage.jsp";
			System.out.println("업체 정보 입력에 실패했습니다.");
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
