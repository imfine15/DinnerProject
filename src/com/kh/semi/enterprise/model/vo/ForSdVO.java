package com.kh.semi.enterprise.model.vo;

import java.sql.Date;

public class ForSdVO implements java.io.Serializable{
	//PRODUCT_NAME, PARTNER_PRICE, CONTRACT_START_DATE, CONTRACT_END_DATE 
	private String productName;
	private int partnerPrice;
	private Date startDate;
	private Date endDate;
	
	public ForSdVO() {
		// TODO Auto-generated constructor stub
	}

	public ForSdVO(String productName, int partnerPrice, Date startDate, Date endDate) {
		super();
		this.productName = productName;
		this.partnerPrice = partnerPrice;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPartnerPrice() {
		return partnerPrice;
	}

	public void setPartnerPrice(int partnerPrice) {
		this.partnerPrice = partnerPrice;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "ForSdVO [productName=" + productName + ", partnerPrice=" + partnerPrice + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}
	
}
