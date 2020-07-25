package com.kh.semi.ad.model.vo;

import java.util.Date;

public class PartnerVO implements java.io.Serializable{
	
	private String partnerQuestionNo;
	private String managerNo;
	private String partQName;
	private String partQPhone;
	private String partQEmail;
	private String partQTitle;
	private String partQAddress;
	private String partQEnpType;
	private String partQType;
	private String partQContent;
	private Date partQDate;
	
	public PartnerVO() {}
	
	public PartnerVO(String partnerQuestionNo, String managerNo, String partQName, String partQPhone, String partQEmail,
			String partQTitle, String partQAddress, String partQEnpType, String partQType, String partQContent,
			Date partQDate) {
		super();
		this.partnerQuestionNo = partnerQuestionNo;
		this.managerNo = managerNo;
		this.partQName = partQName;
		this.partQPhone = partQPhone;
		this.partQEmail = partQEmail;
		this.partQTitle = partQTitle;
		this.partQAddress = partQAddress;
		this.partQEnpType = partQEnpType;
		this.partQType = partQType;
		this.partQContent = partQContent;
		this.partQDate = partQDate;
	}
	public String getPartnerQuestionNo() {
		return partnerQuestionNo;
	}
	public void setPartnerQuestionNo(String partnerQuestionNo) {
		this.partnerQuestionNo = partnerQuestionNo;
	}
	public String getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}
	public String getPartQName() {
		return partQName;
	}
	public void setPartQName(String partQName) {
		this.partQName = partQName;
	}
	public String getPartQPhone() {
		return partQPhone;
	}
	public void setPartQPhone(String partQPhone) {
		this.partQPhone = partQPhone;
	}
	public String getPartQEmail() {
		return partQEmail;
	}
	public void setPartQEmail(String partQEmail) {
		this.partQEmail = partQEmail;
	}
	public String getPartQTitle() {
		return partQTitle;
	}
	public void setPartQTitle(String partQTitle) {
		this.partQTitle = partQTitle;
	}
	public String getPartQAddress() {
		return partQAddress;
	}
	public void setPartQAddress(String partQAddress) {
		this.partQAddress = partQAddress;
	}
	public String getPartQEnpType() {
		return partQEnpType;
	}
	public void setPartQEnpType(String partQEnpType) {
		this.partQEnpType = partQEnpType;
	}
	public String getPartQType() {
		return partQType;
	}
	public void setPartQType(String partQType) {
		this.partQType = partQType;
	}
	public String getPartQContent() {
		return partQContent;
	}
	public void setPartQContent(String partQContent) {
		this.partQContent = partQContent;
	}
	public Date getPartQDate() {
		return partQDate;
	}
	public void setPartQDate(Date partQDate) {
		this.partQDate = partQDate;
	}
	@Override
	public String toString() {
		return "PartnerVO [partnerQuestionNo=" + partnerQuestionNo + ", managerNo=" + managerNo + ", partQName="
				+ partQName + ", partQPhone=" + partQPhone + ", partQEmail=" + partQEmail + ", partQTitle=" + partQTitle
				+ ", partQAddress=" + partQAddress + ", partQEnpType=" + partQEnpType + ", partQType=" + partQType
				+ ", partQContent=" + partQContent + ", partQDate=" + partQDate + "]";
	}
	
	
}
