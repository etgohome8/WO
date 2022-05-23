package three.aws.wo.admin.service;

import java.util.HashMap;
import java.util.List;

import three.aws.wo.admin.vo.CouponVO;
import three.aws.wo.admin.vo.FAQVO;
import three.aws.wo.admin.vo.NoticeVO;
import three.aws.wo.admin.vo.QnAVO;
import three.aws.wo.store.vo.StoreVO;

public interface FaqService {
	
//	���� ���� ���� ////////////////////////////////////////

	List<FAQVO> toptenList();
	List<FAQVO> orderfaqList();
	List<FAQVO> cancelfaqList();
	List<FAQVO> userfaqList();
	List<FAQVO> pointfaqList();
	List<FAQVO> etcfaqList();

//	��ŷ���� �ҽ� ////////////////////////////////////////
	
	List<NoticeVO> newsList();
	List<NoticeVO> noticeList();
	List<NoticeVO> eventList();
	
//	1:1 ���� ////////////////////////////////////////
	
	List<QnAVO> myqnaList(String u_id);
	void addqna(QnAVO vo) throws Exception;
	
	void updateVisits(HashMap<String, Integer> param);
}
