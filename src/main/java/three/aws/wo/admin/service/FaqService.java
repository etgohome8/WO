package three.aws.wo.admin.service;

import java.util.List;

import three.aws.wo.admin.vo.FAQVO;
import three.aws.wo.admin.vo.NoticeVO;

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
}
