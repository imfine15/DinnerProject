package com.kh.semi.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.swing.plaf.synth.SynthSpinnerUI;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

import static com.kh.semi.common.JDBCTemplate.*;

public class AdminDao {
	private Properties prop = new Properties();

	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}
		
		
		return listCount;
	}

	public ArrayList<EnpUpVo> selectEntList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EnpUpVo> list = null;
		EnpUpVo eu;
		String query = prop.getProperty("selectEntList");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			
			
			
			while(rset.next()) {
				
				
				eu = new EnpUpVo();
				eu.setEnpNo(rset.getString("ENP_NO"));
				eu.setEnpName(rset.getString("ENP_NAME"));
				eu.setEnpType(rset.getString("ENP_TYPE"));
				eu.setUploadDate(rset.getDate("UPLOAD_DATE"));
				eu.setUploadApproval(rset.getString("UPLOAD_APPROVAL"));
				
				
				
				list.add(eu);
				
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public EnpUpVo selectOneEnp(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		EnpUpVo eu = null;
		
		
		String query = prop.getProperty("selectOneEnp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				eu = new EnpUpVo();
				eu.setEnpNo(rset.getString("ENP_NO"));
				eu.setEnpName(rset.getString("ENP_NAME"));
				eu.setUploadDate(rset.getDate("UPLOAD_DATE"));
				eu.setEnpAddress(rset.getString("ENP_ADDRESS"));
				eu.setEnpPhone(rset.getString("ENP_PHONE"));
				eu.setMenuName(rset.getString("MENU_NAME"));
				eu.setMenuPrice(rset.getInt("MENU_PRICE"));
				eu.setPriceRange(rset.getString("PRICE_RANGE"));
				eu.setEnpHour(rset.getString("ENP_HOUR"));
				eu.setClosedDay(rset.getString("CLOSED_DAY"));
				eu.setWebsite(rset.getString("WEBSITE"));
				eu.setHashTags(rset.getString("HASH_TAGS"));
				eu.setIntroduce(rset.getString("INTRODUCE"));
				eu.setParkingPossible(rset.getString("PARKING_POSSIBLE"));
				eu.setEnpType(rset.getString("ENP_TYPE"));
				eu.setUploadApproval(rset.getString("UPLOAD_APPROVAL"));

				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return eu;
	}

	public EnpAttachment selectOneEnpFile(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		EnpAttachment ea = null;
		
		String query = prop.getProperty("selectOneEnpFile");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ea = new EnpAttachment();
				ea.setEnpNo(rset.getString("ENP_NO"));
				ea.setFileNo(rset.getString("FILE_NO"));
				ea.setOriginName(rset.getString("ORIGIN_NAME"));
				ea.setChangeName(rset.getString("CHANGE_NAME"));
				ea.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return ea;
	}

	public int updateEnterprise(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateEnterprise");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpUp.getEnpName());
			pstmt.setString(2, enpUp.getEnpPhone());
			pstmt.setString(3, enpUp.getEnpAddress());
			pstmt.setString(4, enpUp.getEnpHour());
			pstmt.setString(5, enpUp.getEnpType());
			pstmt.setString(6, enpUp.getHashTags());
			pstmt.setString(7, enpUp.getPriceRange());
			pstmt.setString(8, enpUp.getClosedDay());
			pstmt.setString(9, enpUp.getWebsite());
			pstmt.setString(10, enpUp.getIntroduce());
			pstmt.setString(11, enpUp.getParkingPossible());
			pstmt.setString(12, enpUp.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("resultup : " + result);
			System.out.println("enpName : " + enpUp.getEnpName());
			System.out.println("hashtags : " +enpUp.getHashTags());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String enpNo = "";
		
		String query = prop.getProperty("selectCurrval");

		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				int id= rset.getInt("currval");
				
				enpNo = "ENP" + id;
				
			}
			
			System.out.println("enpNo : " + enpNo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return enpNo;
	}

	public int updateAttachment(Connection con, EnpAttachment enpAttachment) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		System.out.println();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpAttachment.getOriginName());
			pstmt.setString(2, enpAttachment.getChangeName());
			pstmt.setString(3, enpAttachment.getFilePath());
			pstmt.setString(4, enpAttachment.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("resultat : " + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMenu(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMenu");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpUp.getMenuName());
			pstmt.setInt(2, enpUp.getMenuPrice());
			pstmt.setString(3, enpUp.getEnpNo());
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteEnterprise(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteEnterprise");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpUp.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int deleteAttachment(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpUp.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int deleteMenu(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMenu");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpUp.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
