package com.kh.semi.question.model.vo;

import java.util.Date;

public class QuestionFileVO implements java.io.Serializable {
	
	private String fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String questionNo;
	
	public QuestionFileVO() {}

	public QuestionFileVO(String fileNo, String originName, String changeName, String filePath, Date uploadDate,
			String questionNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.questionNo = questionNo;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}

	@Override
	public String toString() {
		return "QuestionFileVO [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", questionNo=" + questionNo + "]";
	}
	
}
