package three.aws.wo.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.aws.wo.admin.vo.CouponVO;
import three.aws.wo.admin.vo.FAQVO;
import three.aws.wo.admin.vo.NoticeVO;
import three.aws.wo.admin.vo.QnAVO;
import three.aws.wo.store.vo.StoreVO;
@Repository
public class UserBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 
	

	
	public List<FAQVO> toptenList() {
		return sqlSession.selectList("UserBoardDAO.toptenList");
	}
	
	public List<FAQVO> faqList() {
		return sqlSession.selectList("UserBoardDAO.faqList");
	}
	
//	public List<FAQVO> cancelfaqList() {
//		return sqlSession.selectList("UserBoardDAO.cancelfaqList");
//	}
//	
//	public List<FAQVO> userfaqList() {
//		return sqlSession.selectList("UserBoardDAO.userfaqList");
//	}
//	
//	public List<FAQVO> pointfaqList() {
//		return sqlSession.selectList("UserBoardDAO.pointfaqList");
//	}
//	
//	public List<FAQVO> etcfaqList() {
//		return sqlSession.selectList("UserBoardDAO.etcfaqList");
//	}
	



	public List<NoticeVO> newsList() {
		return sqlSession.selectList("UserBoardDAO.newsList");
	}
	public NoticeVO eventCHK(int eventNum) {
		System.out.println(eventNum);
		return sqlSession.selectOne("UserBoardDAO.eventCHK");
	}
//	
//	public List<NoticeVO> noticeList(){
//		return sqlSession.selectList("UserBoardDAO.noticeList");
//	}
//	
//	public List<NoticeVO> eventList() {
//		return sqlSession.selectList("UserBoardDAO.eventList");
//	}
	

//user 1:1

	
	public List<QnAVO> myqnaList(String u_id) { 
		return sqlSession.selectList("UserBoardDAO.myqnaList", u_id); 
	}
	
	
	public void addqna(QnAVO vo) {
		sqlSession.insert("UserBoardDAO.addqna", vo);
	}
	
	



	
	public List<QnAVO> adminqnaList() { 
		return sqlSession.selectList("UserBoardDAO.adminqnaList"); 
	}
	
	
	public List<QnAVO> adminanswerList(int qa_seq) { 
		return sqlSession.selectList("UserBoardDAO.adminanswerList", qa_seq); 
	}
	
	
	
	public void addadminqna(QnAVO vo) {
		sqlSession.update("UserBoardDAO.addadminqna", vo);
	}
	
	public void addanswer(QnAVO vo) {
		sqlSession.update("UserBoardDAO.addanswer", vo);
	}
	
	public void updateVisits(HashMap<String, Integer> param) {
		sqlSession.update("UserBoardDAO.updateVisits",param);		
	}


}
