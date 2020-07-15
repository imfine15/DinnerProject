package com.kh.semi.member.model.vo;

public class MemberVO {
	private String mNo;
	private String mId;
	private String mPwd;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String mGender;
	private String mNickname;
	private String mGrade;
	private String status;
	
	public MemberVO() {}

	public MemberVO(String mNo, String mId, String mPwd, String mName, String mEmail, String mPhone, String mGender,
			String mNickname, String mGrade, String status) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mGender = mGender;
		this.mNickname = mNickname;
		this.mGrade = mGrade;
		this.status = status;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mPhone=" + mPhone + ", mGender=" + mGender + ", mNickname=" + mNickname + ", mGrade=" + mGrade
				+ ", status=" + status + "]";
	}
	

}
