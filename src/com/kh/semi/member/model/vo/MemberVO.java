package com.kh.semi.member.model.vo;

public class MemberVO {
	private String mNo; // 회원번호
	private String mId; // 아이디
	private String mPwd; // 비밀번호
	private String mName; // 이름
	private String mEmail; // 이메일
	private String mPhone; // 전화번호
	private String mGender; // 성별
	private String mNickname; // 별명
	private String mGrade; // 회원등급
	private String status; // 탈퇴여부
	private int noshowCount; // 노쇼횟수
	private String filePath; // 첨부파일(프로필사진) 저장경로
	
	public MemberVO() {}

	public MemberVO(String mNo, String mId, String mPwd, String mName, String mEmail, String mPhone, String mGender,
			String mNickname, String mGrade, String status, int noshowCount, String filePath) {
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
		this.noshowCount = noshowCount;
		this.filePath = filePath;
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

	public int getNoshowCount() {
		return noshowCount;
	}

	public void setNoshowCount(int noshowCount) {
		this.noshowCount = noshowCount;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mPhone=" + mPhone + ", mGender=" + mGender + ", mNickname=" + mNickname + ", mGrade=" + mGrade
				+ ", status=" + status + ", noshowCount=" + noshowCount + ", filePath=" + filePath + "]";
	}

}