package com.kh.semi.member.model.vo;

public class MemberVO {
	private int memberNo;
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String gender;
	private String nickName;
	private String grade;
	private String termsAdmit;
	
	public MemberVO() {}

	public MemberVO(int memberNo, String id, String password, String name, String email, String phone, String gender,
			String nickName, String grade, String termsAdmit) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.nickName = nickName;
		this.grade = grade;
		this.termsAdmit = termsAdmit;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTermsAdmit() {
		return termsAdmit;
	}

	public void setTermsAdmit(String termsAdmit) {
		this.termsAdmit = termsAdmit;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", nickName=" + nickName + ", grade="
				+ grade + ", termsAdmit=" + termsAdmit + "]";
	}

}
