package three.aws.wo.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.store.vo.StoreVO;
import three.aws.wo.user.service.UserOrderService;
import three.aws.wo.user.vo.BasketVO;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserOrderController {
	@Autowired
	private UserOrderService userOrderService;

	// ��ٱ��Ϸ� �̵� �޼���
	@RequestMapping("/cart.user")
	public String cartList(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
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
		return "/order/order_cart";
	}

	// ��ٱ��Ͽ� �ִ� row �����޼���
	@ResponseBody
	@RequestMapping("/removeCart.user")
	public int removeCart(@RequestBody HashMap<String, String> param) throws Exception {
		int b_seq = Integer.parseInt(param.get("b_seq"));
		int result = userOrderService.removeCartCheck(b_seq);
		System.out.println(result);
		if (result == 1) {
			// userOrderService.removeCart(b_seq);
			System.out.println("��ٱ��� �ϳ� ����");
		} else {
			System.out.println("��� �̷� ���ɼ��� ����");
		}
		return result;
	}
	
	// ��ٱ��Ͽ� �ִ� row update�޼���
		@ResponseBody
		@RequestMapping("/updateCart.user")
		public int updateCart(@RequestBody HashMap<String, Integer> param) throws Exception {
			System.out.println(param);
			userOrderService.updateCart(param);
			return 1;
		}

	@RequestMapping("/myOrder.user")
	public String tomyOrderPage() {
		System.out.println("myOrder");
		return "/order/order_myOrder";
	}

	@RequestMapping(value = "/orderc.user", method = RequestMethod.POST)
	public String orderComplete() {
		return "/order/order_complete";
	}

	@RequestMapping(value = "/orderc.user", method = RequestMethod.GET)
	public String orderc() {
		return "/order/order_complete";
	}
}
