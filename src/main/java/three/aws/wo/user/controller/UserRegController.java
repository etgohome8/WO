package three.aws.wo.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.user.service.UserService;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserRegController {
	@Autowired
	private UserService userService;
	
	@Inject
	public  UserRegController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/register.user")
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		System.out.println("ȸ������ �Ϸ� DBȮ��");
		return "/login/login_joined";
	}
	
	//���̵� �ߺ� üũ
	   @ResponseBody
	   @RequestMapping("/idcheck.user")
	   public Map<String, Object> idCheck(@RequestParam(value="id") String id)throws Exception {
		   System.out.println(id);
		   int count = 0;
	        Map<String, Object> map = new HashMap<String, Object>();
	 
	        count = userService.idCheck(id);
	        System.out.println("count:"+count);
	        map.put("cnt", count);
	        System.out.println(map.toString().replace("=", ":"));
	        return map;
	   }
	
	@ResponseBody
	@RequestMapping("/emailcheck.user")
	public int emailCheck(String email) {
		System.out.println("email�ߺ�Ȯ��");
		return userService.emailCheck(email);
	}
	
	@ResponseBody
	@RequestMapping("/telcheck.user")
	public int telCheck(String tel) {
		System.out.println("tel�ߺ�Ȯ��");
		return userService.telCheck(tel);
	}
}
