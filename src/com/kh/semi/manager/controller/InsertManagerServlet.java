package com.kh.semi.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.manager.model.service.ManagerService;
import com.kh.semi.manager.model.vo.ManagerVo;

/**
 * Servlet implementation class InsertManagerServlet
 */
@WebServlet("/insertManager.ma")
public class InsertManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String managerName = request.getParameter("managerName");
		String managerPhone = request.getParameter("managerPhone");
		String managerEmail = request.getParameter("managerEmail");
		String managerId = request.getParameter("managerId");
		String managerPwd = request.getParameter("managerPwd");
		String jobCode = request.getParameter("jobCode");
		String deptCode = request.getParameter("deptCode");
		
		ManagerVo manager = new ManagerVo();
		manager.setManagerName(managerName);
		manager.setManagerPhone(managerPhone);
		manager.setManagerEmail(managerEmail);
		manager.setManagerId(managerId);
		manager.setManagerPwd(managerPwd);
		manager.setJobCode(jobCode);
		manager.setDeptCode(deptCode);
		
		System.out.println("name : " + managerName);
		System.out.println("ph : " + managerPhone);
		System.out.println("email : " + managerEmail);
		System.out.println("id : " + managerId);
		System.out.println("jo : " +jobCode);
		System.out.println("dc : " + deptCode);
		
		int result = new ManagerService().insertManager(manager);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect("/semiproject/selectList.ma");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "직원 등록에 실패했습니다.");
			request.getRequestDispatcher(page).forward(request, response);
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
