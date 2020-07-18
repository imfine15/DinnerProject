package com.kh.semi.notice.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.ClientNoticeService;
import com.kh.semi.notice.model.vo.NoticeVO;

/**
 * Servlet implementation class SelectOneClientNoticeServlet
 */
@WebServlet("/clientSelectOne.no")
public class SelectOneClientNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneClientNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int cnno = 0;
		
		if(num != "" && num != null) {
			cnno = Integer.parseInt(num);
		} 
		
		NoticeVO cNotice = new ClientNoticeService().selectOne(cnno);
		
		String page = "";
		if(cNotice != null) {
			page = "/views/admin/notice/clientDetailNotice.jsp";
			request.setAttribute("cNotice", cNotice);
		} else {
		
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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
