package com.kh.semi.question.model.vo;

import java.util.Date;

public class QuestionVO implements java.io.Serializable{
	
	private String questionNo;
	private String managerNo;
	private String memberNo;
	private String memberName;
	private String questionType;
	private String questionTitle;
	private String questionContent;
	private String questionEmail;
	private String emailAdmit;
	private String questionPhone;
	private String phoneAdmit;
	private Date questionDate;
	private String historyNo;
	private String questionDisposalStatus;
	private Date disposalDate; 
	private String memberId;
	
	public QuestionVO() {}

	public QuestionVO(String questionNo, String managerNo, String memberNo, String memberName, String questionType,
			String questionTitle, String questionContent, String questionEmail, String emailAdmit, String questionPhone,
			String phoneAdmit, Date questionDate, String historyNo, String questionDisposalStatus, Date disposalDate,
			String memberId) {
		super();
		this.questionNo = questionNo;
		this.managerNo = managerNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.questionType = questionType;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionEmail = questionEmail;
		this.emailAdmit = emailAdmit;
		this.questionPhone = questionPhone;
		this.phoneAdmit = phoneAdmit;
		this.questionDate = questionDate;
		this.historyNo = historyNo;
		this.questionDisposalStatus = questionDisposalStatus;
		this.disposalDate = disposalDate;
		this.memberId = memberId;
	}

	public String getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionEmail() {
		return questionEmail;
	}

	public void setQuestionEmail(String questionEmail) {
		this.questionEmail = questionEmail;
	}

	public String getEmailAdmit() {
		return emailAdmit;
	}

	public void setEmailAdmit(String emailAdmit) {
		this.emailAdmit = emailAdmit;
	}

	public String getQuestionPhone() {
		return questionPhone;
	}

	public void setQuestionPhone(String questionPhone) {
		this.questionPhone = questionPhone;
	}

	public String getPhoneAdmit() {
		return phoneAdmit;
	}

	public void setPhoneAdmit(String phoneAdmit) {
		this.phoneAdmit = phoneAdmit;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(String historyNo) {
		this.historyNo = historyNo;
	}

	public String getQuestionDisposalStatus() {
		return questionDisposalStatus;
	}

	public void setQuestionDisposalStatus(String questionDisposalStatus) {
		this.questionDisposalStatus = questionDisposalStatus;
	}

	public Date getDisposalDate() {
		return disposalDate;
	}

	public void setDisposalDate(Date disposalDate) {
		this.disposalDate = disposalDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "QuestionVO [questionNo=" + questionNo + ", managerNo=" + managerNo + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", questionType=" + questionType + ", questionTitle=" + questionTitle
				+ ", questionContent=" + questionContent + ", questionEmail=" + questionEmail + ", emailAdmit="
				+ emailAdmit + ", questionPhone=" + questionPhone + ", phoneAdmit=" + phoneAdmit + ", questionDate="
				+ questionDate + ", historyNo=" + historyNo + ", questionDisposalStatus=" + questionDisposalStatus
				+ ", disposalDate=" + disposalDate + ", memberId=" + memberId + "]";
	}
	
}
