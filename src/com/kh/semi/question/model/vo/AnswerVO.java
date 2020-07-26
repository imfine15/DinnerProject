package com.kh.semi.question.model.vo;

import java.util.Date;

public class AnswerVO implements java.io.Serializable{
	
	private String answerNo;
	private String questionNo;
	private String answerTitle;
	private Date answerDate;
	private String answerContent;
	private String managerNo;
	
	public AnswerVO() {}

	public AnswerVO(String answerNo, String questionNo, String answerTitle, Date answerDate, String answerContent,
			String managerNo) {
		super();
		this.answerNo = answerNo;
		this.questionNo = questionNo;
		this.answerTitle = answerTitle;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.managerNo = managerNo;
	}

	public String getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(String answerNo) {
		this.answerNo = answerNo;
	}

	public String getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}

	public String getAnswerTitle() {
		return answerTitle;
	}

	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	@Override
	public String toString() {
		return "AnswerVO [answerNo=" + answerNo + ", questionNo=" + questionNo + ", answerTitle=" + answerTitle
				+ ", answerContent=" + answerContent + ", managerNo=" + managerNo + "]";
	}

}
