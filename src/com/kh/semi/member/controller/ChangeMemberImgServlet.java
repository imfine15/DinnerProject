package com.kh.semi.member.controller;

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
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.review.model.vo.ReviewAttachment;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/changeMemImg.ma")
public class ChangeMemberImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangeMemberImgServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");

			String savePath = root + "thumbnail_uploadFile/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			String saveFiles = new String();

			String originFiles = new String();

			Enumeration<String> file = multiRequest.getFileNames();

			while(file.hasMoreElements()) {
				String name  = file.nextElement();
				
				saveFiles = multiRequest.getFilesystemName(name);
				originFiles = multiRequest.getOriginalFileName(name);
			}
			
			ReviewAttachment ra = new ReviewAttachment();
			ra.setFileNo(savePath);
			ra.setOriginName(originFiles);
			ra.setChangeName(saveFiles);
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
