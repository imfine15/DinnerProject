package com.kh.semi.notice.contoller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.EntNoticeVO;
import com.kh.semi.notice.model.vo.NoticeAttachment;
import com.kh.semi.question.model.service.QuestionService;
import com.kh.semi.question.model.vo.QuestionFileVO;
import com.kh.semi.question.model.vo.QuestionVO;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertEnterNoticeServlet
 */
@WebServlet("/insertEnter.no")
public class InsertEnterNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEnterNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
						
			 String savePath = root + "thumbnail_uploadFile/";
			 
			 MultipartRequest multiRequest = 
					 new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			 
			 ArrayList<String> saveFiles = new ArrayList<>();
			
			 ArrayList<String> originFiles = new ArrayList<>();
			 
			 Enumeration<String> files = multiRequest.getFileNames();
			 			 
			 while(files.hasMoreElements()) {
				 String name = files.nextElement();
				 				 
				 saveFiles.add(multiRequest.getFilesystemName(name));
				 originFiles.add(multiRequest.getOriginalFileName(name));
			 }

			 String title = multiRequest.getParameter("eTitle");
			 String content = multiRequest.getParameter("eContent");
			 
			 
		//	 int writer = ((Member)(request.getSession().getAttribute("loginUser"))).getUno();
	
			 EntNoticeVO eNotice = new EntNoticeVO();
			// eNotice.setManagerNo(managerNo);
			// eNotice.setNoticeNo(noticeNo);
			 eNotice.setNoticeTitle(title);
			 eNotice.setNoticeContent(content);
			 //seNotice.setNoticeTypeCode(noticeTypeCode);

			 ArrayList<NoticeAttachment> fileList = new ArrayList<>();
			 for(int i = originFiles.size() - 1; i >= 0; i--) {
				 NoticeAttachment nFile = new NoticeAttachment();
				 
				 nFile.setFilePath(savePath);
				 nFile.setOriginName(originFiles.get(i));
				 nFile.setChangeName(saveFiles.get(i));
				 
				 fileList.add(nFile);
			 }
			 			 
			 int result = new NoticeService().insertEntNotice(eNotice, fileList);		 
			 System.out.println(fileList);
			 String page = "";
			 
			 if(result > 0) {
				 response.sendRedirect("/semiproject/selectElist.no");
				 
				 //넘기는값들 넘기기  셋어트리뷰트로 
			 } else {
				 
				 for(int i = 0; i < saveFiles.size(); i++) {
					 File faildFile = new File(savePath + saveFiles.get(i));
					 
					 faildFile.delete();
				 }
				 
				 request.setAttribute("msg", "공지사항 등록에 실패하셨습니다.");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			 }
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
