package three.aws.wo.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import three.aws.wo.user.service.UserService;
import three.aws.wo.user.vo.UserVO;

@Controller
public class UserRegController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/register.user")
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		System.out.println("회원가입 처리 완료 DB확인");
		return "/login/login_joined";
	}
	
	@RequestMapping("/idcheck.user")
	public void idCheck(UserVO vo) {
		userService.idCheck(vo);
		System.out.println("id중복확인");
	}
}
