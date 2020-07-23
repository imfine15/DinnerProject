package com.kh.semi.ad.model.vo;

public class AdVO implements java.io.Serializable {
	private String adNo; // 광고번호
	private String adName; // 이름
	private String adPhone; // 전화번호
	private String adEmail; // 이메일
	private String adEnpName; // 회사명
	private String adEnpAddress; // 회사주소
	private String adEnpType; // 업종
	private String adCode; // 광고코드
	private String searchPath; // 검색경로
	private String counselContent; // 상담내용
	private String adContent; // 광고내용
	private String adTitle; //광고명
	
	public AdVO() {}

	public AdVO(String adNo, String adName, String adPhone, String adEmail, String adEnpName, String adEnpAddress,
			String adEnpType, String adCode, String searchPath, String counselContent, String adContent,
			String adTitle) {
		super();
		this.adNo = adNo;
		this.adName = adName;
		this.adPhone = adPhone;
		this.adEmail = adEmail;
		this.adEnpName = adEnpName;
		this.adEnpAddress = adEnpAddress;
		this.adEnpType = adEnpType;
		this.adCode = adCode;
		this.searchPath = searchPath;
		this.counselContent = counselContent;
		this.adContent = adContent;
		this.adTitle = adTitle;
	}

	public String getAdNo() {
		return adNo;
	}

	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdPhone() {
		return adPhone;
	}

	public void setAdPhone(String adPhone) {
		this.adPhone = adPhone;
	}

	public String getAdEmail() {
		return adEmail;
	}

	public void setAdEmail(String adEmail) {
		this.adEmail = adEmail;
	}

	public String getAdEnpName() {
		return adEnpName;
	}

	public void setAdEnpName(String adEnpName) {
		this.adEnpName = adEnpName;
	}

	public String getAdEnpAddress() {
		return adEnpAddress;
	}

	public void setAdEnpAddress(String adEnpAddress) {
		this.adEnpAddress = adEnpAddress;
	}

	public String getAdEnpType() {
		return adEnpType;
	}

	public void setAdEnpType(String adEnpType) {
		this.adEnpType = adEnpType;
	}

	public String getAdCode() {
		return adCode;
	}

	public void setAdCode(String adCode) {
		this.adCode = adCode;
	}

	public String getSearchPath() {
		return searchPath;
	}

	public void setSearchPath(String searchPath) {
		this.searchPath = searchPath;
	}

	public String getCounselContent() {
		return counselContent;
	}

	public void setCounselContent(String counselContent) {
		this.counselContent = counselContent;
	}

	public String getAdContent() {
		return adContent;
	}

	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	@Override
	public String toString() {
		return "AdVO [adNo=" + adNo + ", adName=" + adName + ", adPhone=" + adPhone + ", adEmail=" + adEmail
				+ ", adEnpName=" + adEnpName + ", adEnpAddress=" + adEnpAddress + ", adEnpType=" + adEnpType
				+ ", adCode=" + adCode + ", searchPath=" + searchPath + ", counselContent=" + counselContent
				+ ", adContent=" + adContent + ", adTitle=" + adTitle + "]";
	}
	
	
	
	
	
}