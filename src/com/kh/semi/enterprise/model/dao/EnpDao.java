package com.kh.semi.enterprise.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.enterprise.model.vo.ForCmVO;
import com.kh.semi.enterprise.model.vo.ForCrInfoVO;
import com.kh.semi.enterprise.model.vo.ForEntCrVO;
import com.kh.semi.enterprise.model.vo.ForPhVO;
import com.kh.semi.enterprise.model.vo.ForSdVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;
import com.sun.org.apache.xerces.internal.impl.dtd.models.CMAny;

public class EnpDao {
Properties prop = new Properties();
   
   public EnpDao() {
      String fileName = EnpDao.class.getResource("/sql/enp/enp-query.properties").getPath();
      try {
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   //제휴업체 회원가입 일반enterprise에 정보 기입
   public int insertPartnerEnp1(Connection con, EnpVO requestEnp) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = prop.getProperty("insertPartnerEnp1");
      
      try {
         pstmt = con.prepareStatement(query);
         
         pstmt.setString(1, requestEnp.getEnpName());
         pstmt.setString(2, requestEnp.getEnpPhone());
         pstmt.setString(3, requestEnp.getEnpAddress());
         pstmt.setString(4, requestEnp.getEnpHour());
         pstmt.setString(5, requestEnp.getEnpType());
         pstmt.setString(6, requestEnp.getHashTags());
         pstmt.setString(7, requestEnp.getPriceRange());
         pstmt.setString(8, requestEnp.getClosedDay());
         pstmt.setString(9, requestEnp.getWebsite());
         pstmt.setString(10, requestEnp.getIntroduce());
         pstmt.setString(11, requestEnp.getParkingPossible());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   //제휴업체 회원가입 partnerEnp에 값넣기
   public int insertPartnerEnp2(Connection con, EnpVO requestEnp) {
	   PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("insertPartnerEnp2");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setString(1, requestEnp.getEnpRegisterNo());
	         pstmt.setString(2, requestEnp.getPartnerId());
	         pstmt.setString(3, requestEnp.getPartnerPwd());
	         pstmt.setString(4, requestEnp.getPartnerEmail());
	         pstmt.setString(5, requestEnp.getPartnerName());
	         pstmt.setString(6, requestEnp.getAccountHolder());
	         pstmt.setString(7, requestEnp.getBank());
	         pstmt.setString(8, requestEnp.getBankAccount());
	         pstmt.setInt(9, requestEnp.getDepositLowerLimit());
	         pstmt.setInt(10, requestEnp.getDepositHigherLimit());
	         pstmt.setString(11, requestEnp.getJuminNo());
	         pstmt.setString(12, requestEnp.getEnpLicense());
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
   }
   
   
	//가게정보업로드
	public int insertEnterprise(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEnterprise");
		
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
			
			result = pstmt.executeUpdate();
			
			
			
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
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return enpNo;
	}
	
	public int insertAttachment(Connection con, EnpAttachment enpAttachment) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enpAttachment.getOriginName());
			pstmt.setString(2, enpAttachment.getChangeName());
			pstmt.setString(3, enpAttachment.getFilePath());
			pstmt.setString(4, enpAttachment.getEnpNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	public int insertMenu(Connection con, EnpUpVo enpUp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMenu");
		
		
		
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
	
	public EnpVO loginCheck(Connection con, EnpVO requestEnp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		EnpVO loginEnp = null;
		
		String query = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestEnp.getPartnerId());
			pstmt.setString(2, requestEnp.getPartnerPwd());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginEnp = new EnpVO();
				loginEnp.setEnpNo(rset.getString("ENP_NO"));
				loginEnp.setEnpRegisterNo(rset.getString("ENP_REGISTER_NO"));
				loginEnp.setPartnerCode(rset.getString("PARTNER_CODE"));
				loginEnp.setPenaltyCount(rset.getInt("PENALTY_COUNT"));
				loginEnp.setPartnerId(rset.getString("PARTNER_ID"));
				loginEnp.setPartnerPwd(rset.getString("PARTNER_PWD"));
				loginEnp.setPartnerEmail(rset.getString("PARTNER_EMAIL"));
				loginEnp.setPartnerName(rset.getString("PARTNER_NAME"));
				loginEnp.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				loginEnp.setBank(rset.getString("BANK"));
				loginEnp.setBankAccount(rset.getString("BANK_ACCOUNT"));
				loginEnp.setDepositLowerLimit(rset.getInt("DEPOSIT_LOWER_LIMIT"));
				loginEnp.setDepositHigherLimit(rset.getInt("DEPOSIT_HIGHER_LIMIT"));
				loginEnp.setSignupApproval(rset.getString("SIGNUP_APPROVAL"));
				loginEnp.setJuminNo(rset.getString("JUMIN_NO"));
				loginEnp.setEnpLicense(rset.getString("ENP_LICENCE"));
				loginEnp.setEnpName(rset.getString("ENP_NAME"));
				loginEnp.setEnpPhone(rset.getString("ENP_PHONE"));
				loginEnp.setEnpAddress(rset.getString("ENP_ADDRESS"));
				loginEnp.setEnpHour(rset.getString("ENP_HOUR"));
				loginEnp.setEnpType(rset.getString("ENP_TYPE"));
				loginEnp.setEnpStatus(rset.getString("ENP_STATUS"));
				loginEnp.setEnpPartnerType(rset.getString("ENP_PARTNER_TYPE"));
				loginEnp.setHashTags(rset.getString("HASH_TAGS"));
				loginEnp.setPriceRange(rset.getString("PRICE_RANGE"));
				loginEnp.setClosedDay(rset.getString("CLOSED_DAY"));
				loginEnp.setWebsite(rset.getString("WEBSITE"));
				loginEnp.setIntroduce(rset.getString("INTRODUCE"));
				loginEnp.setParkingPossible(rset.getString("PARKING_POSSIBLE"));
				loginEnp.setUploadApproval(rset.getString("UPLOAD_APPROVAL"));
				loginEnp.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				/*ENP_NO ENP_REGISTER_NO PARTNER_CODE PENALTY_COUNT PARTNER_ID PARTNER_PWD PARTNER_EMAIL PARTNER_NAME ACCOUNT_HOLDER BANK
				BANK_ACCOUNT DEPOSIT_LOWER_LIMIT DEPOSIT_HIGHER_LIMIT SIGNUP_APPROVAL JUMIN_NO ENP_LICENCE ENP_NAME ENP_PHONE ENP_ADDRESS ENP_HOUR
				ENP_TYPE ENP_STATUS ENP_PARTNER_TYPE HASH_TAGS PRICE_RANGE CLOSED_DAY
				WEBSITE INTRODUCE PARKING_POSSIBLE UPLOAD_APPROVAL*/
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginEnp;
	}
	
	public ArrayList<ReservationVO> selectCRList(Connection con, PageInfo pi, String enp) {
		ArrayList<ReservationVO> requestReserve = null;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ReservationVO r = null;
		
		
		String query = prop.getProperty("selectList");
		System.out.println("query : " + query);
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setString(1, enp);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			requestReserve = new ArrayList<>();
			int count = 0;
			while(rset.next()) {
				/*SimpleDateFormat df = new SimpleDateFormat("RRRR/MM/DD");
				String dfdf = df.format(rset.getTimestamp("RESERVATION_DATE"));
				Date dfdf2 = df.parse(dfdf);
				Timestamp ts = new Timestamp(dfdf2.getTime());
				System.out.println(ts);*/
				
				r = new ReservationVO();
				r.setcNo(rset.getString("CALC_NO"));
				r.seteNo(rset.getString("ENP_NO"));
				r.setmNo(rset.getString("MEMBER_NO"));
				r.setpAmount(rset.getInt("POINT_AMMOUNT"));
				r.setPeople(rset.getInt("PEOPLE"));
				r.setrDate(rset.getTimestamp("RESERVATION_DATE"));
				r.setrDate2(rset.getDate("RESERVATION_DATE"));
				r.setrDate3(rset.getString("TO_CHAR(RESERVATION_DATE,'HH24:MI')"));
				r.setrNo(rset.getString("RESERVATION_NO"));
				r.setRqMemo(rset.getString("REQUEST_MEMO"));
				
				requestReserve.add(r);
				count ++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		System.out.println("reqeustReserve : " + requestReserve);
		return requestReserve;
	}
	
	public int getListCount(Connection con, String enp) {
		PreparedStatement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		try {
			stmt = con.prepareStatement(query);
			stmt.setString(1, enp);
			
			rset = stmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}
	
	public ArrayList<ForEntCrVO> selectCRModalList(Connection con, String memId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForEntCrVO> modalList = null;
		ForEntCrVO f = null;
		
		String query = prop.getProperty("selectCRModalList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			modalList = new ArrayList<ForEntCrVO>();
			while(rset.next()) {
				f = new ForEntCrVO();
				f.setRownum(rset.getInt("ROWNUM"));
				f.setNickName(rset.getString("MEMBER_NICKNAME"));
				f.setReservationDate(rset.getDate("RESERVATION_DATE"));
				
				modalList.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return modalList;
	}
	
	public String selectCRMemId(Connection con, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memId = "";
		String query = prop.getProperty("selectCRMemId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				memId = rset.getString("MEMBER_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			
		}
		
		
		return memId;
	}
	
	public int selectCRCount(Connection con, String countId, String enp, String mNo) {
		PreparedStatement pstmt = null;
		ArrayList<Integer> list = null;
		ResultSet rset = null;
		int count = 0;
		String query = prop.getProperty("selectCRCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			pstmt.setString(2, countId);
			pstmt.setString(3, mNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				count = rset.getInt("COUNT(*)");
				
				list.add(count);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list.get(0);
	}
	
	public EnpVO selectEnp(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectEnp");
		EnpVO selectedEnp = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			selectedEnp = new EnpVO();
			
			if(rset.next()) {
				selectedEnp.setEnpNo(rset.getString("ENP_NO"));
				selectedEnp.setEnpName(rset.getString("ENP_NAME"));
				selectedEnp.setEnpPhone(rset.getString("ENP_PHONE"));
				selectedEnp.setEnpAddress(rset.getString("ENP_ADDRESS"));
				selectedEnp.setEnpHour(rset.getString("ENP_HOUR"));
				selectedEnp.setEnpType(rset.getString("ENP_TYPE"));
				selectedEnp.setEnpStatus(rset.getString("ENP_STATUS"));
				selectedEnp.setEnpPartnerType(rset.getString("ENP_PARTNER_TYPE"));
				selectedEnp.setHashTags(rset.getString("HASH_TAGS"));
				selectedEnp.setPriceRange(rset.getString("PRICE_RANGE"));
				selectedEnp.setClosedDay(rset.getString("CLOSED_DAY"));
				selectedEnp.setWebsite(rset.getString("WEBSITE"));
				selectedEnp.setIntroduce(rset.getString("INTRODUCE"));
				selectedEnp.setParkingPossible(rset.getString("PARKING_POSSIBLE"));
				selectedEnp.setUploadApproval(rset.getString("UPLOAD_APPROVAL"));
				selectedEnp.setLikeCount(rset.getInt("LIKE_COUNT"));
				selectedEnp.setChangeName(rset.getString("CHANGE_NAME"));
				selectedEnp.setFilePath(rset.getString("FILE_PATH"));
				selectedEnp.setMenuName(rset.getString("MENU_NAME"));
				selectedEnp.setMenuPrice(rset.getInt("MENU_PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return selectedEnp;
	}

	public ArrayList<ForCmVO> selectCmMemberVal(Connection con, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<ForCmVO> list = null;
		ForCmVO vo = null;
		
		String query = prop.getProperty("selectCmMemberVal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<ForCmVO>();
			
			while(rset.next()) {
				/*ENP_NO
			     , REVIEW_NO
			     , R.REVIEW_CONTENT
			     , R.REVIEW_TYPE
			     , R.VISIT_DATE
			     , R.REVIEW_DATE
			     , R.AVERAGE_RATING
			     , RR.REPLY_CONTENT
			     , MEMBER_NO
			     , M.MEMBER_NAME
			     , E.ENP_NAME 
			     , M.MEMBER_NICKNAME
			     , MF.FILE_NO     
			     , MF.ORIGIN_NAME
			     , MF.CHANGE_NAME
			     , MF.FILE_PATH */
					
					vo = new ForCmVO();
					vo.setEnpNo(rset.getString("ENP_NO"));
					vo.setReviewNo(rset.getString("REVIEW_NO"));
					vo.setReviewContent(rset.getString("REVIEW_CONTENT"));
					vo.setReviewType(rset.getString("REVIEW_TYPE"));
					vo.setVisitDate(rset.getDate("VISIT_DATE"));
					vo.setReviewDate(rset.getDate("REVIEW_DATE"));
					vo.setAverageRating(rset.getDouble("AVERAGE_RATING"));
					vo.setReplyContent(rset.getString("REPLY_CONTENT"));
					vo.setMemberNo(rset.getString("MEMBER_NO"));
					vo.setMemberName(rset.getString("MEMBER_NAME"));
					vo.setEnpName(rset.getString("ENP_NAME"));
					vo.setMemberNickname(rset.getString("MEMBER_NICKNAME"));
					vo.setFileNo(rset.getString("FILE_NO"));
					vo.setOriginName(rset.getString("ORIGIN_NAME"));
					vo.setChangeName(rset.getString("CHANGE_NAME"));
										
					list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int insertComment(Connection con, String reviewNum,String comment, String enpNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, reviewNum);
			pstmt.setString(2, comment);
			pstmt.setString(3, enpNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public String getEnpFile(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpFile");
		String filePath = "";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				filePath = rset.getString("FILE_PATH");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return filePath;
	}

	public ArrayList<ForCmVO> selectCmFilePath(Connection con, ArrayList<ForCmVO> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCmFile");
		ArrayList<ForCmVO> cmList = null;

		try {
			pstmt = con.prepareStatement(query);
			
			cmList = new ArrayList<>();
			
			for(int i = 0; i < list.size(); i++) {
				String enpNo = list.get(i).getEnpNo();
				
				pstmt.setString(1, enpNo);
				
				rset = pstmt.executeQuery();
				int j = 1;
				while(rset.next()) {
					if(j % 2 == 1) {
						list.get(i).setFilePath1(rset.getString("FILE_PATH"));
						list.get(i).setRfChangeName1(rset.getString("CHANGE_NAME"));
						
					}else {
						list.get(i).setFilePath2(rset.getString("FILE_PATH"));
						list.get(i).setRfChangeName2(rset.getString("CHANGE_NAME"));
					}
					j++;
				}
				
				cmList.add(list.get(i));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cmList;
	}

	public int updateReplyStatus(Connection con, String reviewNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReplyStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reviewNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public String checkId(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String checkMember = "";
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkMember = rset.getString("PARTNER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return checkMember;
	}

	public ArrayList<ReservationVO> selectRDList(Connection con, PageInfo pi, String enp, String requestDay) {
		ArrayList<ReservationVO> requestReserve = null;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ReservationVO r = null;
		
		
		String query = prop.getProperty("selectRDList");
		System.out.println("query : " + query);
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setString(1, enp);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, requestDay);
			
			System.out.println("enpNo : "+enp);
			System.out.println("startRow : "+startRow);
			System.out.println("endRow : " + endRow);
			System.out.println("requestDay in Dao : " + requestDay);
			
			rset = pstmt.executeQuery();
			
			requestReserve = new ArrayList<>();
			int count = 0;
			while(rset.next()) {
				/*SimpleDateFormat df = new SimpleDateFormat("RRRR/MM/DD");
				String dfdf = df.format(rset.getTimestamp("RESERVATION_DATE"));
				Date dfdf2 = df.parse(dfdf);
				Timestamp ts = new Timestamp(dfdf2.getTime());
				System.out.println(ts);*/
				
				r = new ReservationVO();
				r.setcNo(rset.getString("CALC_NO"));
				r.seteNo(rset.getString("ENP_NO"));
				r.setmNo(rset.getString("MEMBER_NO"));
				r.setpAmount(rset.getInt("POINT_AMMOUNT"));
				r.setPeople(rset.getInt("PEOPLE"));
				r.setrDate(rset.getTimestamp("RESERVATION_DATE"));
				r.setrDate2(rset.getDate("RESERVATION_DATE"));
				r.setrDate3(rset.getString("TO_CHAR(RESERVATION_DATE,'HH24:MI')"));
				r.setrNo(rset.getString("RESERVATION_NO"));
				r.setRqMemo(rset.getString("REQUEST_MEMO"));
				
				requestReserve.add(r);
				count ++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return requestReserve;
	}
	
	public ArrayList<ForEntCrVO> selectRDModalList(Connection con, String memId, String requestDay) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForEntCrVO> modalList = null;
		ForEntCrVO f = null;
		
		String query = prop.getProperty("selectRDModalList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memId);
			pstmt.setString(2, requestDay);
			rset = pstmt.executeQuery();
			
			modalList = new ArrayList<ForEntCrVO>();
			while(rset.next()) {
				f = new ForEntCrVO();
				f.setRownum(rset.getInt("ROWNUM"));
				f.setNickName(rset.getString("MEMBER_NICKNAME"));
				f.setReservationDate(rset.getDate("RESERVATION_DATE"));
				f.setPhone(rset.getString("MEMBER_PHONE"));
				
				modalList.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return modalList;

	}

	public int uploadEnp(Connection con, EnpUpVo enp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("uploadEnp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp.getEnpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int getSDListCount(Connection con, String enp) {
		PreparedStatement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("sdListCount");
		try {
			stmt = con.prepareStatement(query);
			stmt.setString(1, enp);
			rset = stmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<ForSdVO> selectSDList(Connection con, PageInfo pi, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForSdVO> requestReserve = null;
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		
		String query = prop.getProperty("selectSDList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			requestReserve = new ArrayList<>();
			
			while(rset.next()) {
				ForSdVO s = new ForSdVO();
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setPartnerPrice(rset.getInt("PARTNER_PRICE"));
				s.setStartDate(rset.getDate("CONTRACT_START_DATE"));
				s.setEndDate(rset.getDate("CONTRACT_END_DATE"));
				
				requestReserve.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return requestReserve;
	}

	public int updateCrList(Connection con, String rno) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("updateCrList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteCrList(Connection con, String rno) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("deleteCrList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rno);
			System.out.println("rno in enpdao : " + rno);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ForCrInfoVO> selectCrInfoModalList(Connection con, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForCrInfoVO> modalList = null;
		ForCrInfoVO f = null;
		String query = prop.getProperty("selectCrInfoModalList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			rset = pstmt.executeQuery();
			
			modalList = new ArrayList<ForCrInfoVO>();
			while(rset.next()) {
				f = new ForCrInfoVO();
				f.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				f.setMemberName(rset.getString("MEMBER_NAME"));
				f.setMemberPhone(rset.getString("MEMBER_PHONE"));
				f.setRequestMemo(rset.getString("REQUEST_MEMO"));
				
				modalList.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return modalList;
	}

	public int getRDListCount(Connection con, String enp, String requestDay) {
		PreparedStatement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		
		
		
		
		String query = prop.getProperty("rdListCount");
		try {
			stmt = con.prepareStatement(query);
			stmt.setString(1, enp);
			stmt.setString(2, requestDay);
			rset = stmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<ForPhVO> selectPHList(Connection con, PageInfo pi, String enp) {
		ArrayList<ForPhVO> resList = null;
		PreparedStatement pstmt=  null;
		ResultSet rset = null;
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		String query = prop.getProperty("selectPHList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			pstmt.setString(2, enp);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			resList = new ArrayList<ForPhVO>();
			
			while(rset.next()) {
				ForPhVO p = new ForPhVO();
				
				p.setReservationNo(rset.getString("RESERVATION_NO"));
				
				
				resList.add(p);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return resList;
	}

	public int getPHListCount(Connection con, String enp) {
		PreparedStatement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("rdListCount");
		try {
			stmt = con.prepareStatement(query);
			stmt.setString(1, enp);
			rset = stmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<ForPhVO> selectSum(Connection con, ArrayList<ForPhVO> resList, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForPhVO> list = null;
		
		String query = prop.getProperty("selectPhSum");
		
		
		list = new ArrayList<ForPhVO>();
		for(ForPhVO p : resList) {
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, p.getReservationNo());
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p.setSum(rset.getInt("SUM(*)"));
					
					list.add(p);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}

		}
				
		return list;
	}

	public ArrayList<ForPhVO> getCalcList(Connection con, String enp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ForPhVO> calcList = null;
		
		String query = prop.getProperty("getCalcList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enp);
			
			rset = pstmt.executeQuery();
			
			calcList = new ArrayList<ForPhVO>();
			
			while(rset.next()) {
				ForPhVO p = new ForPhVO();
				
				p.setCalcNo(rset.getString("CALC_NO"));
				
				calcList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return calcList;
	}
}