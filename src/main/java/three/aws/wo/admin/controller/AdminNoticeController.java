package three.aws.wo.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.admin.service.FaqService;
import three.aws.wo.admin.vo.FAQVO;
import three.aws.wo.admin.vo.NoticeVO;
import three.aws.wo.admin.vo.QnAVO;
import three.aws.wo.user.vo.UserVO;

@Controller
public class AdminNoticeController {
	@Resource
	private FaqService noticeService;
	
	@RequestMapping("/faq.user")
	public String noticeList(HttpSession session, NoticeVO vo, Model model) {

		String u_id = "";
		UserVO uv = (UserVO) session.getAttribute("userSession");
		if(uv == null) {
			u_id = "No_Data";
		}
		else if (uv != null) {
			u_id = uv.getU_id();
		}

		
//		���� ���� ���� ////////////////////////////////////////

		List<FAQVO> toptenList =noticeService.toptenList();
		List<FAQVO> orderfaqList =noticeService.orderfaqList();
		List<FAQVO> cancelfaqList =noticeService.cancelfaqList();
		List<FAQVO> userfaqList =noticeService.userfaqList();
		List<FAQVO> pointfaqList =noticeService.pointfaqList();
		List<FAQVO> etcfaqList =noticeService.etcfaqList();

//		��ŷ���� �ҽ� ////////////////////////////////////////

		List<NoticeVO> newsList =noticeService.newsList();
		List<NoticeVO> noticeList =noticeService.noticeList();
		List<NoticeVO> eventList =noticeService.eventList();
		
//		1:1 ���� ////////////////////////////////////////

		List<QnAVO> myqnaList =noticeService.myqnaList(u_id);
		
		
		//System.out.println(noticeList);
//		���� ���� ���� ////////////////////////////////////////

		model.addAttribute("toptenList" ,toptenList);
		model.addAttribute("orderfaqList" ,orderfaqList);
		model.addAttribute("cancelList" ,cancelfaqList);
		model.addAttribute("userfaqList" ,userfaqList);
		model.addAttribute("pointfaqList" ,pointfaqList);
		model.addAttribute("etcfaqList" ,etcfaqList);
		
//		��ŷ���� �ҽ� ////////////////////////////////////////

		model.addAttribute("newsList" ,newsList);
		model.addAttribute("noticeList" ,noticeList);
		model.addAttribute("eventList" ,eventList);
		
//		1:1 ���� ////////////////////////////////////////

		model.addAttribute("myqnaList" ,myqnaList);
		
		return "/customer/customer_faq";
	}
	
	@ResponseBody
	@RequestMapping("/updateVisits.user")
	public int updateVisits(@RequestBody HashMap<String, Integer> param) throws Exception {
		System.out.println(param);
		noticeService.updateVisits(param);
		return 0;
	}
	
	@RequestMapping("/addqna.user")
	public String addqna(QnAVO vo) throws Exception {
		noticeService.addqna(vo);
		return "redirect:/faq.user";
	}
	
}

//@GetMapping("/faq.user")
//public String tofaqPage() {
//	System.out.println("faq");
//	return "/customer/customer_faq";
//}