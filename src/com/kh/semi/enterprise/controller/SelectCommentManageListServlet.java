package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.ForCmVO;



/**
 * Servlet implementation class SelectCommentManageListServlet
 */
@WebServlet("/selectCML.en")
public class SelectCommentManageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectCommentManageListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String enp = request.getParameter("enpId");
		System.out.println("enpId : " + enp);
		
		ArrayList<ForCmVO> list = new EnpService().selectCmList(enp);
		
		for(ForCmVO c : list) {
			System.out.println(c.getAverageRating());
			System.out.println(c.getChangeName());
			System.out.println(c.getEnpName());
			System.out.println(c.getEnpNo());
			System.out.println(c.getFileNo());
			System.out.println(c.getFilePath());
			System.out.println(c.getMemberName());
			System.out.println(c.getMemberNickname());
			System.out.println(c.getMemberNo());
			System.out.println(c.getOriginName());
			System.out.println(c.getReplyContent());
			System.out.println(c.getReviewContent());
			System.out.println(c.getReviewNo());
			System.out.println(c.getReviewType());
			System.out.println(c.getReviewDate());
			System.out.println(c.getReviewNo());
			System.out.println(c.getVisitDate());
		}
		
		String page = "";
		if(list != null) {
			page = "views/enterprise/commentManage/commentManage.jsp";
			request.setAttribute("cmList", list);
			/*request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("modalList", modalList);
			request.setAttribute("cancelCount", cancelCount);
			request.setAttribute("visitCount", visitCount);*/
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);

		/*HashMap<String, Object> hmap = new BoardService().selectThumbnailMap(num);

		System.out.println("hmap : " + hmap);

		Board board = (Board) hmap.get("board");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("attachment");*/

		/*String page = "";
		if (hmap != null) {
			page = "views/thumbnail/thumbnailDetail.jsp";
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세보기 실패");
		}*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
