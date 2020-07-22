package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;

@WebServlet("/signUp.en")
public class SignUpEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUpEnterpriseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String juminNo = request.getParameter("juminNo");
		String name = request.getParameter("name");
		String enterpriseName = request.getParameter("enterpriseName");
		String bank = request.getParameter("bank");
		String accountHolder = request.getParameter("accountHolder");
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
		String[] restDays = request.getParameterValues("restDay");
		String homepage = request.getParameter("homepage"); //null인 경우 처리
		String introduce = request.getParameter("introduce");
		String parking = request.getParameter("parking");
		String minTime = request.getParameter("minTime");
		String maxTime = request.getParameter("maxTime");
		
		String priceRange = lowerLimit + "원 ~ " + higherLimit + "원";
		
		String restDay = "";
		if(restDays != null) {
			for(int i = 0 ; i < restDays.length; i++) {
				if(i != restDays.length-1) {
					restDay += restDays[i] + "요일, ";
				} else {
					restDay += restDays[i] + "요일";
				}
			}
		} else {
			restDay = "휴무일 없음";
		}
		
		if(homepage == null || homepage == "") {
			homepage = "매장 홈페이지가 없습니다.";
		}
		
		String enpHour = minTime + " ~ " + maxTime;
		
		EnpVO requestEnp = new EnpVO();
		requestEnp.setPartnerId(id);
		requestEnp.setPartnerPwd(password);
		requestEnp.setJuminNo(juminNo);
		requestEnp.setPartnerName(name);
		requestEnp.setEnpName(enterpriseName);
		requestEnp.setBank(bank);
		requestEnp.setAccountHolder(accountHolder);
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
		
		String page = "";
		if(result > 1) {
			page = "views/enterprise/signIn/signIn.jsp";
		} else {
			request.setAttribute("msg", "업체 정보 입력에 실패했습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
