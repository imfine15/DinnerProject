package com.kh.semi.notice.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.AdminNoticeAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeVO;
import com.kh.semi.notice.model.vo.EntNoticeVO;
import com.kh.semi.notice.model.vo.NoticeAttachment;

/**
 * Servlet implementation class SelectOneAdminNoticeServlet
 */
@WebServlet("/selectOneAdmin.no")
public class SelectOneAdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneAdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new NoticeService().selectOneAdmin(num);
		
		AdminNoticeVO aNotice = (AdminNoticeVO) hmap.get("aNotice");
		ArrayList<AdminNoticeAttachment> filelist = (ArrayList<AdminNoticeAttachment>) hmap.get("adminAttachment");
		
		String page = "";
		if(hmap != null) {
			page = "/views/admin/notice/mainDetailNotice.jsp";
			request.setAttribute("aNotice", aNotice);
			request.setAttribute("filelist", filelist);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세 보기 실패!");
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
