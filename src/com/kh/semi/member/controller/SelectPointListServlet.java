package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.vo.PointVO;

@WebServlet("/selecPointtList.py")
public class SelectPointListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPointListServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		String mNo = memberVO.getmNo();
		
		ArrayList<PointVO> pointVO = new MemberService().selectPointHisList(mNo);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
