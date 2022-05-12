package three.aws.wo.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.admin.service.AMessageService;
import three.aws.wo.admin.service.AStoreService;
import three.aws.wo.admin.util.MessageSend;
import three.aws.wo.store.vo.FranchiseVO;
import three.aws.wo.store.vo.StoreFormVO;
import three.aws.wo.store.vo.StoreVO;

@Controller
public class AdminStoreController {
	@Resource
	private AStoreService aStoreService;
	@Autowired
	private AMessageService aMessageService;

	@RequestMapping("/store_mng.admin")
	public String storeList(StoreVO vo, Model model) {
		List<StoreVO> storeList = aStoreService.storeList();
		System.out.println("store_mng");
		model.addAttribute("storeList", storeList);
		return "/store/store_mng";
	}

	@RequestMapping("/regisStore.admin")
	public String insertStore(StoreVO vo) {
		aStoreService.insertStoreInfo(vo);
		String bankUrl = "https://walkingorder.s3.ap-northeast-2.amazonaws.com/bankcopy/";
		String bussUrl = "https://walkingorder.s3.ap-northeast-2.amazonaws.com/businessreg/";
		String si_code = vo.getSi_code();
		String sa_bank = vo.getSa_bankbook_image();
		String sa_buss = vo.getSa_business_registration_image();
		vo.setSa_bankbook_image(bankUrl + si_code + sa_bank);
		vo.setSa_business_registration_image(bussUrl + si_code + sa_buss);
		aStoreService.insertStoreAccount(vo);
		System.out.println("���� ��� �Ϸ� DBȮ��");
		return "redirect:/store_mng.admin";
	}

	@RequestMapping("/store_menu.admin")
	public String menuStoreList(StoreVO vo, Model model) {
		List<StoreVO> storeList = aStoreService.storeList();
		System.out.println("store_menu");
		model.addAttribute("storeList", storeList);
		return "/store/store_menu";
	}

	@RequestMapping("/join_inq.admin")
	public String tojoin_inq(FranchiseVO vo, Model model) {
		List<FranchiseVO> storeInquiryList = aStoreService.storeInquiryList();
		System.out.println("join_inq");
		model.addAttribute("storeInquiryList", storeInquiryList);
		return "/store/join_inq";
	}

	@RequestMapping("/storeInquiry.user")
	public String insertStoreInquiry(FranchiseVO vo) {
		aStoreService.insertStoreInquiry(vo);
		System.out.println("�������ǵ�� DBȮ��");
		return "redirect:/index.user";
	}

	// �������� 1�ܰ�
	@GetMapping("/storeInquiry.user")
	public String tostoreInquiryPage() {
		System.out.println("storeInquiry");
		return "/info/info_storeInquiry";
	}

	// �������ǿ��� form ���� �� üũ
	@ResponseBody
	@RequestMapping(value = "/storeInqAccept.admin", method = RequestMethod.POST)
	public int storeInqAccept(@RequestBody HashMap<String, String> param) {
		// �����Ϸ� ���� ����
		int f_seq = Integer.parseInt(param.get("f_seq"));
		// ����ó�� ��� form ����
		String f_tel = param.get("f_tel");
		// �̺κ��� ���ڰ� ���ϱ� �ϴ� ������
		MessageSend ms = new MessageSend();
//		String sms_title = "[��ŷ����] ���Ե�� �ȳ�";
//		String sms_text = "http://localhost:8080/join_inq.admin\n������ ���� 1~3�� ���� �����帳�ϴ�.";
//		int result = ms.sendLMS(f_tel,sms_title, sms_text);
		aStoreService.storeInqAccept(f_seq);
		return 1;
	}

	// �������� 2�ܰ�
	@GetMapping("/register.store")
	public String storeReg() {
		System.out.println("storeRegForm");
		return "/reg/storeRegForm";
	}

	// �������� 2�ܰ� �Ϸ���
	@GetMapping("/registed.store")
	public String storeRegComp() {
		System.out.println("storeRegComp");
		return "/reg/storeRegComp";
	}

	// register.store ��� ����
	@RequestMapping("/regisStoreForm.admin")
	public String regisStoreForm(StoreFormVO vo) {
		String bankUrl = "https://walkingorder.s3.ap-northeast-2.amazonaws.com/bankcopy/";
		String bussUrl = "https://walkingorder.s3.ap-northeast-2.amazonaws.com/businessreg/";
		String sf_code = vo.getSf_code();
		String sf_bank = vo.getSf_bankbook_image();
		String sf_buss = vo.getSf_business_registration_image();
		vo.setSf_bankbook_image(bankUrl + sf_code + sf_bank);
		vo.setSf_business_registration_image(bussUrl + sf_code + sf_buss);
		aStoreService.insertStoreForm(vo);
		System.out.println("���θ�� Ȯ��+ DBȮ��");
		return "redirect:/registed.store";
	}

	@GetMapping("/store_pending.admin")
	public String storePendingList(StoreFormVO vo, Model model) {
		System.out.println("store_pending");
		List<StoreFormVO> storePendingList = aStoreService.storePendingList();
		model.addAttribute("storePendingList", storePendingList);
		return "/store/store_pending";
	}

	// ���� ���� ��� ��� Ŭ������...
	@ResponseBody
	@RequestMapping(value = "/storependingAlert.admin", method = RequestMethod.POST)
	public int storependingAlert(@RequestBody HashMap<String, String> param) {
		String sf_status = param.get("status");
		String sf_code = param.get("sf_code");
		HashMap<String, String> change = new HashMap<String, String>();
		change.put("sf_status", sf_status);
		change.put("sf_code", sf_code);
		// ������ ��� ���� ������� (id,pw = ����ڹ�ȣ)
		if (sf_status.equals("����")) {
			aStoreService.updateStore(change);
		} else if (sf_status.equals("��������")) {
			String message = param.get("message");
			aStoreService.updateStore(change);
			String tel = param.get("tel");
			// �̺κ��� ���ڰ� ���ϱ� �ϴ� ������
			MessageSend ms = new MessageSend();
//				String sms_title = "[��ŷ����] �������� ��û";
//				String sms_text = "��û����:"+message+"\nhttp://localhost:8080/join_inq.admin";
//				int result = ms.sendLMS(tel,sms_title, sms_text);
			System.out.println(param);
		} else if (sf_status.equals("����")) {
			aStoreService.updateStore(change);
		} else if (sf_status.equals("�����Ϸ�")) {
			aStoreService.updateStore(change);
		}

		// �̺κ��� ���ڰ� ���ϱ� �ϴ� ������
		MessageSend ms = new MessageSend();
//			String sms_title = "[��ŷ����] ���Ե�� �ȳ�";
//			String sms_text = "http://localhost:8080/join_inq.admin\n������ ���� 1~3�� ���� �����帳�ϴ�.";
//			int result = ms.sendLMS(f_tel,sms_title, sms_text);
		return 1;
	}

	// ������� ��, ���� ����ڷ� ��ϵ� ������ �ִ��� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/checkStore.admin", method = RequestMethod.POST)
	public int checkStore(@RequestBody HashMap<String, String> param) {
		String sf_code = param.get("sf_code");
		String tel = param.get("tel");
		int result = aStoreService.checkStore(sf_code);
		// ��ġ�ϴ� �����ڵ尡 ���� ��쿡�� ���� ������ ����
		if (result == 0) {
			// store_form ���̺��� sf_code= #{sf_code}�� ������ info�� account�� ����.
			aStoreService.replicateStoreInfo(sf_code);
			aStoreService.replicateStoreAccount(sf_code);
			System.out.println(param);
			// �̺κ��� ���ڰ� ���ϱ� �ϴ� ������
			// ���� ���� �� ���ڷ� �α��� ���� �˸�
//			MessageSend ms = new MessageSend();
//			String sms_title = "[��ŷ����] ���� ��� �Ϸ�";
//			String sms_text = "http://localhost:8080/login.store\n���̵�: " + sf_code + "\n��й�ȣ: " + sf_code;
//			int esult = ms.sendLMS(tel, sms_title, sms_text);
		}
		return result;
	}

	@GetMapping("/store_mng_update.admin")
	public String tostore_mng_update(HttpServletRequest request, Model model) {
		String si_code = request.getParameter("si_code");
		System.out.println("store_mng");
		if (si_code == null) {
			return "/store/store_mng_update";
		} else {
			StoreVO vo = aStoreService.storeOne(si_code);
			System.out.println(vo);
			model.addAttribute("storeOne", vo);
			return "/store/store_mng_update";
		}
	}
	
/////////////------- DB���� ����� �۾���---------///////////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/deleteJoinInq.admin", method = RequestMethod.POST)
	public int deleteJoinInq(@RequestBody HashMap<String, String> param) {
		// �������� DB���� ����
		int f_seq = Integer.parseInt(param.get("f_seq"));
		aStoreService.deleteJoinInq(f_seq);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deletePending.admin", method = RequestMethod.POST)
	public int deletePending(@RequestBody HashMap<String, String> param) {
		// �������� DB���� ����
		int sf_seq = Integer.parseInt(param.get("sf_seq"));
		aStoreService.deletePending(sf_seq);
		return 1;
	}
}
