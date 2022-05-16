package three.aws.wo.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.store.vo.StoreVO;
import three.aws.wo.user.service.UserLoginService;
import three.aws.wo.user.service.UserOrderService;
import three.aws.wo.user.vo.BasketVO;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private UserOrderService userOrderService;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value="/login.user",method=RequestMethod.GET)
	public String u_loginPage(HttpSession session) {
		if(session.getAttribute("userSession")==null) {
			return "/login/login_login";
		}else {
			return "/index/index";
		}
	}
	
	//�켱 ��ġ�ϴ��� Ȯ�� �� �α��� ����
	@ResponseBody
	@RequestMapping(value = "/loginCheck.user", method = RequestMethod.POST)
	public int userLoginCheck(@RequestBody HashMap<String, String> param,HttpSession session, 
			HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		
		UserVO encryption = userLoginService.encryption(param.get("u_id"));
		boolean pwdMatch = pwdEncoder.matches(param.get("u_password"), encryption.getU_password());
		
		int result = 0;
		if(encryption != null && pwdMatch == true) {
			result = 1;
		}
		//�켱 ���̵� �����ȣ�� ��ġ�ϴ��� Ȯ��
		String userID = param.get("u_id");
		//���̵������ϱ� üũ�ߴ��� ������
		String rememberId = param.get("rememberId"); 
		System.out.println(rememberId);//true false
		System.out.println("���� : "+ session);
		if(result==1) {//��ġ�ϴ� ��� vo�� ������.
			UserVO vo = userLoginService.loggedin(userID,rememberId,session,response);
			//System.out.println(vo);//������� vo ���� ���°�
			Cookie cookie = new Cookie("rememberId",userID);
			if(rememberId.equals("true")) {
				cookie.setMaxAge(24*60*60*7);
				response.addCookie(cookie);
				System.out.println("rememberId true => "+cookie);
			}else {
				cookie.setMaxAge(0); //��Ű ���� �� �߰�(�ٷ� �Ҹ�)
				response.addCookie(cookie);
			}
			// ���� ���̵� �޾ƿ�
			// ���� ���̵�� ��ٱ��� ��ȸ ��.
			List<BasketVO> cartList = userOrderService.cartList(userID);
			// ������ٱ��Ͽ� �ִ� ���� �ҷ���
			StoreVO cartStore = userOrderService.cartStore(userID);
			// ��ٱ��� �����.
			session.setAttribute("cartStoreSession", cartStore);
			session.setAttribute("cartListSession", cartList);
			//session�� vo ����
			session.setAttribute("userSession", vo);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/kakaoLogin.user", method = RequestMethod.POST)
	public int kakaoLogin(@RequestBody HashMap<String, Object> param) throws Exception {
		String id = Long.toString((long) param.get("id"));
		System.out.println(param);
		System.out.println("kakao"+id);
		int result = userLoginService.kakaoLogin(id);
		
		
		return result;
	}
	
@RequestMapping("/logout.user")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.user";
	}
}
