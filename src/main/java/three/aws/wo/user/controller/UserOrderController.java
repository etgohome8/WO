package three.aws.wo.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.store.vo.StoreVO;
import three.aws.wo.user.service.UserOrderService;
import three.aws.wo.user.vo.BasketVO;
import three.aws.wo.user.vo.OrdersVO;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserOrderController {
	@Autowired
	private UserOrderService userOrderService;

	// ��ٱ��Ϸ� �̵� �޼���
	@RequestMapping("/cart.user")
	public String cartList(HttpSession session, Model model) {
		// ���ǿ� �ִ� ������ ������
		UserVO vo = (UserVO) session.getAttribute("userSession");
		if (vo == null) { // �̰Ŵ� ���߿� interceptor���� ó���� ��
			return "/login/login_login";
		}
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		// ���� ���̵�� ��ٱ��� ��ȸ ��.
		List<BasketVO> cartList = userOrderService.cartList(u_id);
		// ������ٱ��Ͽ� �ִ� ���� �ҷ���
		StoreVO cartStore = userOrderService.cartStore(u_id);

		// ��ٱ��� �����.
		model.addAttribute("cartStore", cartStore);
		model.addAttribute("cartList", cartList);
		// ������ٱ��Ͽ� �ִ� ���� �ҷ���
		// ��ٱ��� �����.
		session.setAttribute("cartStoreSession", cartStore);
		session.setAttribute("cartListSession", cartList);
		return "/order/order_cart";
	}

	// ��ٱ��Ͽ� �ִ� row �����޼���
	@ResponseBody
	@RequestMapping("/removeCart.user")
	public int removeCart(@RequestBody HashMap<String, String> param, HttpSession session) throws Exception {
		int b_seq = Integer.parseInt(param.get("b_seq"));
		int result = userOrderService.removeCartCheck(b_seq);
		System.out.println(result);
		if (result == 1) {
			userOrderService.removeCart(b_seq);
			System.out.println("��ٱ��� �ϳ� ����");
			UserVO vo = (UserVO) session.getAttribute("userSession");
			String userID = vo.getU_id();
			List<BasketVO> cartList = userOrderService.cartList(userID);
			// ������ٱ��Ͽ� �ִ� ���� �ҷ���
			StoreVO cartStore = userOrderService.cartStore(userID);
			// ��ٱ��� �����.
			session.setAttribute("cartStoreSession", cartStore);
			session.setAttribute("cartListSession", cartList);
		} else {
			System.out.println("��� �̷� ���ɼ��� ����");
		}
		return result;
	}

	// ��ٱ��Ͽ� �ִ� row update�޼���
	@ResponseBody
	@RequestMapping("/updateCart.user")
	public int updateCart(@RequestBody HashMap<String, Integer> param, HttpSession session) throws Exception {
		System.out.println(param);
		userOrderService.updateCart(param);
		UserVO vo = (UserVO) session.getAttribute("userSession");
		String userID = vo.getU_id();
		List<BasketVO> cartList = userOrderService.cartList(userID);
		// ������ٱ��Ͽ� �ִ� ���� �ҷ���
		StoreVO cartStore = userOrderService.cartStore(userID);
		// ��ٱ��� �����.
		session.setAttribute("cartStoreSession", cartStore);
		session.setAttribute("cartListSession", cartList);
		return 1;
	}

	@RequestMapping("/myOrder.user")
	public String tomyOrderPage(HttpSession session, Model model) {
		// ���ǿ� �ִ� ������ ������
		UserVO vo = (UserVO) session.getAttribute("userSession");
		if (vo == null) { // �̰Ŵ� ���߿� interceptor���� ó���� ��
			return "/login/login_login";
		}
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		// ���� ���̵�� ��ٱ��� ��ȸ ��.
		List<BasketVO> cartList = userOrderService.cartList(u_id);
		// ������ٱ��Ͽ� �ִ� ���� �ҷ���
		StoreVO cartStore = userOrderService.cartStore(u_id);

		// ��ٱ��� �����.
		model.addAttribute("cartStore", cartStore);
		model.addAttribute("cartList", cartList);
		System.out.println("myOrder");
		return "/order/order_myOrder";
	}

	// ������ seq �ҷ���
	@ResponseBody
	@RequestMapping(value = "/insertOrder.user", method = RequestMethod.POST)
	public String insertOrder(@RequestBody HashMap<String, String> param) {
		System.out.println("hi");
		// ���� �ֹ��������� 1�� ����
		int dailySeq = userOrderService.dailySeq() + 1;
		String orderBack = Integer.toString(dailySeq);
		// orderBack�� 4�ڸ� ���� ��ȯ
		if (orderBack.length() == 1) {
			orderBack = "000" + orderBack;
		} else if (orderBack.length() == 2) {
			orderBack = "00" + orderBack;
		} else if (orderBack.length() == 3) {
			orderBack = "0" + orderBack;
		}
		System.out.println(param);
		HashMap<String, Object> insertInfo = new HashMap<String, Object>();
		int o_point = Integer.parseInt(param.get("o_point"));
		insertInfo.put("u_id", param.get("u_id"));
		insertInfo.put("si_code", param.get("si_code"));
		insertInfo.put("o_request", param.get("o_request"));
		insertInfo.put("o_code", param.get("o_code") + orderBack);
		insertInfo.put("o_total_price", Integer.parseInt(param.get("o_total_price")));
		insertInfo.put("o_list", param.get("o_list"));
		insertInfo.put("o_list_detail", param.get("o_list_detail"));
		insertInfo.put("o_daily_seq", dailySeq);
		insertInfo.put("o_point", o_point);
		insertInfo.put("o_payment_list", param.get("o_payment_list"));
		if (o_point == 0) {
			insertInfo.put("o_point_status", false);
		} else {
			insertInfo.put("o_point_status", true);
		}

		userOrderService.insertOrder(insertInfo);
		System.out.println(insertInfo);

		// �ֹ���ȣ ���ڸ�
		return orderBack;
	}

	// ���� ����
	@ResponseBody
	@RequestMapping("/successOrder.user")
	public int successOrder(@RequestBody HashMap<String, String> param, HttpSession session) throws Exception {
		System.out.println(param);
		String o_code = param.get("o_code");
		String u_id = param.get("u_id");
		int o_point = Integer.parseInt(param.get("o_point"));
		// ���� �����ϸ� o_pay_status true�� �ٲ�
		userOrderService.successOrder(o_code);
		String allBseq = param.get("b_seqs");
		String b_seqs[] = allBseq.split(",,,");
		//��ٱ��� ���� ���� �� o_code ����
		userOrderService.replicateCart(u_id);
		for(String b : b_seqs) {
			if(!b.equals("")) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				int b_seq = Integer.parseInt(b);
				map.put("b_seq", b_seq);
				map.put("o_code", o_code);
				userOrderService.updateBasketOrder(map);
			}
		}

		// ���� �����ϸ� ����Ʈ ����
		HashMap<String, Object> insertPoint = new HashMap<String, Object>();
		// �ý��ۿ� ������ ������ true���� Ȯ��
		String point_use = userOrderService.isPointUse();
		int point_percentage = 0;
		if (point_use.equals("true")) {
			// �ý��ۿ� ������ point_percentage �ҷ���
			point_percentage = Integer.parseInt(userOrderService.getPointPercentage());
		}
		String si_code = param.get("si_code");
		// ����Ʈ ����� ��� ����
		if (o_point != 0) {
			insertPoint.put("si_code", si_code);
			insertPoint.replace("pt_amount", -(o_point));
			userOrderService.orderPointUse(insertPoint);
			userOrderService.orderPointUpdate(insertPoint);
		}
		int point = Integer.parseInt(param.get("o_total_price")) * point_percentage / 100;
		System.out.println(point);
		insertPoint.put("u_id", u_id);
		insertPoint.put("pt_amount", point);
		userOrderService.orderPointUpdate(insertPoint);
		userOrderService.orderPointAdd(insertPoint);
		// ����Ʈ ����� ��� ����
		if (o_point != 0) {
			insertPoint.put("si_code", si_code);
			insertPoint.replace("pt_amount", -(o_point));
			userOrderService.orderPointUse(insertPoint);
			userOrderService.orderPointUpdate(insertPoint);
		}
		
		// ���� �����ϸ� ��ٱ��� ���� ���
		userOrderService.resetCart(u_id);

		List<BasketVO> cartList = userOrderService.cartList(u_id);
		// ������ٱ��Ͽ� �ִ� ���� �ҷ���
		StoreVO cartStore = userOrderService.cartStore(u_id);
		// ��ٱ��� �����.
		session.setAttribute("cartStoreSession", cartStore);
		session.setAttribute("cartListSession", cartList);
		return 1;
	}

	// �����Ϸ� ������
	@RequestMapping(value = "/orderc.user", method = RequestMethod.GET)
	public String orderComplete(HttpSession session, HttpServletRequest request, Model model) {
		// �ֹ���ȣ �ҷ���
		UserVO vo = (UserVO) session.getAttribute("userSession");
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		String o_code = request.getParameter("o");
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("u_id",u_id);
		map.put("o_code", o_code);
		OrdersVO Ovo = userOrderService.orderComplete(map);
		if(Ovo == null) {
			return "/mypage/mypage_main";
		}
		model.addAttribute("completeOrder", Ovo);
		return "/order/order_complete";
	}

	@RequestMapping(value = "/paytest.user", method = RequestMethod.GET)
	public String payTest(HttpServletRequest request, Model model) {
		// �ֹ���ȣ �ҷ���
		return "/paytest";
	}

	@RequestMapping("/myOrderList.user")
	public String tomyOrderListPage(HttpSession session, Model model) {
		// ���ǿ� �ִ� ������ ������
		UserVO vo = (UserVO) session.getAttribute("userSession");
		if (vo == null) { // �̰Ŵ� ���߿� interceptor���� ó���� ��
			return "/login/login_login";
		}
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		List<OrdersVO> myOrderList = userOrderService.myOrderList(u_id);
		model.addAttribute("myOrderList", myOrderList);
		List<BasketVO> orderDetails = userOrderService.myorderDetail(u_id);
		model.addAttribute("orderDetails", orderDetails);
		
		Date now = new Date();
		model.addAttribute("nowDate",now);
		System.out.println("myOrderList");
		return "/mypage/mypage_myOrderList";

	}

	@RequestMapping("/currentOrder.user")
	public String tocurrentOrderPage(HttpSession session, Model model) {
		System.out.println("currentOrder");
		// ���ǿ� �ִ� ������ ������
		UserVO vo = (UserVO) session.getAttribute("userSession");
		if (vo == null) { // �̰Ŵ� ���߿� interceptor���� ó���� ��
			return "/login/login_login";
		}
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		List<OrdersVO> myCurrentList = userOrderService.myCurrentList(u_id);
		model.addAttribute("myCurrentList", myCurrentList);
		List<BasketVO> orderDetails = userOrderService.myorderDetail(u_id);
		model.addAttribute("orderDetails", orderDetails);
		
		return "/mypage/mypage_currentOrder";
	}
	
//	@RequestMapping("/myorderDetail.user")
//	public String myorderDetail(HttpSession session, Model model,HttpServletRequest request) {
//		String o_code = request.getParameter("order");
//		///myorder.user?order=${myCurrentList.o_code}
//		System.out.println("myorderDetail");
//		// ���ǿ� �ִ� ������ ������
//		UserVO vo = (UserVO) session.getAttribute("userSession");
//		if (vo == null) { // �̰Ŵ� ���߿� interceptor���� ó���� ��
//			return "/login/login_login";
//		}
//		// ���� ���̵� �޾ƿ�
//		String u_id = vo.getU_id();
//		HashMap<String,String> map = new HashMap<String,String>();
//		map.put("u_id",u_id);
//		map.put("o_code", o_code);
//		List<BasketVO> myorderDetail = userOrderService.myorderDetail(map);
//		model.addAttribute("myorderDetail", myorderDetail);
//		return "/mypage/mypage_currentOrder";
//	}
	
	//������ ��ٱ��Ͽ� �ִ��� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/siBasket.user", method = RequestMethod.POST)
	public int siBasket(@RequestBody HashMap<String, String> param) {
		int result = 0;
		String u_id = param.get("u_id");
		String si_code = param.get("si_code");
		String siBasket = userOrderService.siBasket(u_id);
		if(siBasket==null) {
			result = 1;
		}else if(siBasket.equals(si_code)) {
			result = 1;
		}
		return result;
	}
}
