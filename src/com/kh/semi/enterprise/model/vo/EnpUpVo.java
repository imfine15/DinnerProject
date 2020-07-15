package com.kh.semi.enterprise.model.vo;

public class EnpUpVo implements java.io.Serializable {
	private String enpNo;
	private String enpName;
	private String enpAddress;
	private String enpPhone;
	private String enpPartnerType;
	private String menuName;
	private int menuPrice;
	private String priceRange;
	private String enpHour;
	private String closedDay;
	private String website;
	private String hashTags;
	private String introduce;
	private String parkingPossible;
	private String enpType;
	private String enpStatus;
	
	public EnpUpVo() {}

	public EnpUpVo(String enpNo, String enpName, String enpAddress, String enpPhone, String enpPartnerType,
			String menuName, int menuPrice, String priceRange, String enpHour, String closedDay, String website,
			String hashTags, String introduce, String parkingPossible, String enpType, String enpStatus) {
		super();
		this.enpNo = enpNo;
		this.enpName = enpName;
		this.enpAddress = enpAddress;
		this.enpPhone = enpPhone;
		this.enpPartnerType = enpPartnerType;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.priceRange = priceRange;
		this.enpHour = enpHour;
		this.closedDay = closedDay;
		this.website = website;
		this.hashTags = hashTags;
		this.introduce = introduce;
		this.parkingPossible = parkingPossible;
		this.enpType = enpType;
		this.enpStatus = enpStatus;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public String getEnpName() {
		return enpName;
	}

	public void setEnpName(String enpName) {
		this.enpName = enpName;
	}

	public String getEnpAddress() {
		return enpAddress;
	}

	public void setEnpAddress(String enpAddress) {
		this.enpAddress = enpAddress;
	}

	public String getEnpPhone() {
		return enpPhone;
	}

	public void setEnpPhone(String enpPhone) {
		this.enpPhone = enpPhone;
	}

	public String getEnpPartnerType() {
		return enpPartnerType;
	}

	public void setEnpPartnerType(String enpPartnerType) {
		this.enpPartnerType = enpPartnerType;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}

	public String getEnpHour() {
		return enpHour;
	}

	public void setEnpHour(String enpHour) {
		this.enpHour = enpHour;
	}

	public String getClosedDay() {
		return closedDay;
	}

	public void setClosedDay(String closedDay) {
		this.closedDay = closedDay;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getParkingPossible() {
		return parkingPossible;
	}

	public void setParkingPossible(String parkingPossible) {
		this.parkingPossible = parkingPossible;
	}

	public String getEnpType() {
		return enpType;
	}

	public void setEnpType(String enpType) {
		this.enpType = enpType;
	}

	public String getEnpStatus() {
		return enpStatus;
	}

	public void setEnpStatus(String enpStatus) {
		this.enpStatus = enpStatus;
	}

	@Override
	public String toString() {
		return "EnpUpVo [enpNo=" + enpNo + ", enpName=" + enpName + ", enpAddress=" + enpAddress + ", enpPhone="
				+ enpPhone + ", enpPartnerType=" + enpPartnerType + ", menuName=" + menuName + ", menuPrice="
				+ menuPrice + ", priceRange=" + priceRange + ", enpHour=" + enpHour + ", closedDay=" + closedDay
				+ ", website=" + website + ", hashTags=" + hashTags + ", introduce=" + introduce + ", parkingPossible="
				+ parkingPossible + ", enpType=" + enpType + ", enpStatus=" + enpStatus + "]";
	}
	
	
	
}
