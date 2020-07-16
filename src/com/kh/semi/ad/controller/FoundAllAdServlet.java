package com.kh.semi.ad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.ad.model.service.AdService;
import com.kh.semi.ad.model.vo.AdVO;

@WebServlet("/foundAllAd.ad")
public class FoundAllAdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoundAllAdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdVO adList = new AdService().foundAllAd();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(adList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
