package com.kh.semi.question.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.question.model.service.QuestionService;
import com.kh.semi.question.model.vo.QuestionFileVO;
import com.kh.semi.question.model.vo.QuestionVO;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/insert.qu")
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    

//	HttpSession session = request.getSession();	
//	Member loginUser = (Member)session.getAttribute("loginUser");
//	int uno = loginUser.getUno();
//	
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
						
			//파일 저장 경로 설정
			 String savePath = root + "thumbnail_uploadFile/";
			 
			 //FileRenamePolicy 상속 후 오버라이딩
			 MultipartRequest multiRequest = 
					 new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			 
			 //다중 파일을 묶어서 업로드처리 하기 위해 컬렉션 이용
			 //저장한 파일의 이름을 저장할 arrayList 생성
			 ArrayList<String> saveFiles = new ArrayList<>();
			 //원본 파일 이름을 저장할 arrayList 생성
			 ArrayList<String> originFiles = new ArrayList<>();
			 
			 //파일이 전송된 폼의 name을 반환한다.
			 multiRequest.getFileNames();
			 Enumeration<String> files = multiRequest.getFileNames();
			 			 
			 //각 파일의 정보를 구해온 후 DB에 저장할 목적의 데이터를 꺼내온다. 
			 while(files.hasMoreElements()) {
				 String name = files.nextElement();
				 				 
				 saveFiles.add(multiRequest.getFilesystemName(name));
				 originFiles.add(multiRequest.getOriginalFileName(name));
			 }

			 //multipartRequest객체에서 파일 외의 값들도 꺼낼 수 있다.
			 String qCategory = multiRequest.getParameter("qCategory");
			 String qTitle = multiRequest.getParameter("qTitle");
			 String qContent = multiRequest.getParameter("qContent");
			 String mAdmit = multiRequest.getParameter("mailAgree");
			 String pAdmit = multiRequest.getParameter("pAdmit");
			 String eMail = multiRequest.getParameter("eMail");
			 String phone = multiRequest.getParameter("phone");
			 String mNo = multiRequest.getParameter("memberNo");
			 String mName = multiRequest.getParameter("memberName");
			 String mId = multiRequest.getParameter("memberId");
			 
		//	 int writer = ((Member)(request.getSession().getAttribute("loginUser"))).getUno();
	
			 QuestionVO question = new QuestionVO();
			 question.setQuestionTitle(qTitle);
			 question.setQuestionContent(qContent);
			 question.setQuestionType(qCategory);
			 question.setPhoneAdmit(pAdmit);
			 question.setQuestionPhone(phone);
			 question.setEmailAdmit(mAdmit);
			 question.setQuestionEmail(eMail);
			 question.setMemberNo(mNo);
			 question.setMemberName(mName);
			 question.setMemberId(mId);
			 
			 ArrayList<QuestionFileVO> fileList = new ArrayList<>();
			 
			 for(int i = originFiles.size() - 1; i >= 0; i--) {
				 QuestionFileVO qFile = new QuestionFileVO();
				 
				 qFile.setFilePath(savePath);
				 qFile.setOriginName(originFiles.get(i));
				 qFile.setChangeName(saveFiles.get(i));
				 
				 fileList.add(qFile);
			 }
			 			 
			 int result = new QuestionService().insertQuestion(question, fileList);		 
			 
			 String page = "";
			 
			 if(result > 0) {
				 page = "views/qna/question_comp.jsp";
				 //넘기는값들 넘기기  셋어트리뷰트로 
			 } else {
				 
				 for(int i = 0; i < saveFiles.size(); i++) {
					 File faildFile = new File(savePath + saveFiles.get(i));
					 
					 faildFile.delete();
				 }
				 
				 request.setAttribute("msg", "문의글 등록에 실패하셨습니다.");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				 
			 }
			 response.sendRedirect(page);
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
