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

import three.aws.wo.user.service.UserOrderService;
import three.aws.wo.user.vo.BasketVO;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserOrderController {
	@Autowired
	private UserOrderService userOrderService;
	
//	@GetMapping("/cart.user")
//	public String tocartPage() {
//		System.out.println("cart");
//		return "/order/order_cart";
//	}
	
	@RequestMapping("/cart.user")
	public String cartList(HttpSession session,	HttpServletRequest request, HttpServletResponse response, Model model) {
		//���ǿ� �ִ� ������ ������
		UserVO vo = (UserVO)session.getAttribute("userSession");
		// ���� ���̵� �޾ƿ�
		String u_id = vo.getU_id();
		// ���� ���̵�� ��ٱ��� ��ȸ ��.
		List<BasketVO> cartList = userOrderService.cartList(u_id);
		//��ٱ��� �����.
		model.addAttribute("cartList", cartList);
		return "/order/order_cart";
	}
	
	@RequestMapping(value="/orderc.user",method=RequestMethod.POST)
	public String orderComplete(){
		return "/order/order_complete";
	}
	
	@RequestMapping(value="/orderc.user",method=RequestMethod.GET)
	public String orderc(){
		return "/order/order_complete";
	}
}
