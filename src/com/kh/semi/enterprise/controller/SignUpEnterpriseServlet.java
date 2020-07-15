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
		String lowerLimit = request.getParameter("lowerLimit");
		String higherLimit = request.getParameter("higherLimit"); // lowerLimit과 합체
		String[] restDays = request.getParameterValues("restDay"); //뭘로 끊지 ?
		String homepage = request.getParameter("homepage"); //null인 경우 처리
		String introduce = request.getParameter("introduce");
		String parking = request.getParameter("parking");
		String admit = request.getParameter("admit"); // 동의했을경우 on
		String minTime = request.getParameter("minTime");
		String maxTime = request.getParameter("maxTime");
		String termsAdmit = "0";
		if(admit.equals("on")) {
			termsAdmit = "1"; // 비동의시 0, 동의시 1
		}
		String priceRange = lowerLimit + "원 ~ " + higherLimit + "원";
		System.out.println(priceRange);
		for(String s : restDays) {
			System.out.println(s);
		}
		
		String restDay = "";
		for(int i = 0 ; i < restDays.length; i++) {
			if(i != restDays.length-1) {
				restDay += restDays[i] + "요일, ";
			}else {
				restDay += restDays[i] + "요일";
			}
		}
		if(homepage == null || homepage == "") {
			homepage = "매장 홈페이지가 없습니다.";
		}
		
		System.out.println(restDay);
		System.out.println(parking);
		System.out.println(introduce);
		System.out.println(homepage);
		System.out.println("min : " + minTime + ", max : " + maxTime);
		System.out.println(enterpriseLicense);
		
		String enpHour = minTime + " ~ " + maxTime;
		
		EnpVO requestEnp = new EnpVO();
		requestEnp.setPartnerId(id);
		requestEnp.setPartnerPwd(password);
		requestEnp.setJuminNo(juminNo);
		requestEnp.setPartnerName(name);
		requestEnp.setEnpName(enterpriseName);
		requestEnp.setBank(bank);
		requestEnp.setBankAccount(bankAccount);
		requestEnp.setEnpRegisterNo(enterpriseNumber);
		requestEnp.setEnpAddress(address + "$" +addressDetail);
		requestEnp.setEnpType(enterpriseType);
		requestEnp.setPartnerEmail(email);
		requestEnp.setEnpPhone(phone);
		requestEnp.setEnpLicense(enterpriseLicense);
		requestEnp.setPriceRange(priceRange);
		requestEnp.setClosedDay(restDay);
		requestEnp.setParkingPossible(parking);
		requestEnp.setWebsite(homepage);
		requestEnp.setIntroduce(introduce);
		requestEnp.setEnpHour(enpHour);
		
		
		
		
		
		
		int result = new EnpService().insertPartnerEnp(requestEnp);
		
		String page="";
		if(result > 1) {
			page="views/main/main.jsp";
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
