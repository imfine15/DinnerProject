package com.kh.semi.enterprise.model.vo;

public class ForCrInfoVO implements java.io.Serializable{
	/*,MEMBER_NAME
	,MEMBER_EMAIL
	,MEMBER_PHONE
	,REQUEST_MEMO*/
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String requestMemo;
	
	public ForCrInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public ForCrInfoVO(String memberName, String memberEmail, String memberPhone, String requestMemo) {
		super();
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.requestMemo = requestMemo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getRequestMemo() {
		return requestMemo;
	}

	public void setRequestMemo(String requestMemo) {
		this.requestMemo = requestMemo;
	}

	@Override
	public String toString() {
		return "ForCrInfoVO [memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone
				+ ", requestMemo=" + requestMemo + "]";
	}
	

}
