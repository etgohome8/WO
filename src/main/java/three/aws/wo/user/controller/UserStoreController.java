package three.aws.wo.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.aws.wo.store.vo.StoreVO;
import three.aws.wo.user.service.UStoreService;

@Controller
public class UserStoreController {
   @Resource
   private UStoreService uStoreService;
   private String SearchWord; //�˻��� ���� �� ����
   private List<StoreVO> storeListByPage; //����¡ó�������� list����
   
   //store �˻����
   @RequestMapping("/storeList.user")
   public String storeList(StoreVO vo, Model model) { 
      storeListByPage =uStoreService.storeListByPage(SearchWord);
      System.out.println("user���� storelist ������!");
      System.out.println(SearchWord);
      model.addAttribute("userPageChange" ,storeListByPage);
      return "/order/order_storeList";
   }
   
   //header���� �˻��� �޾ƿ���
   @ResponseBody
   @RequestMapping(value="/searchStore.user", method = RequestMethod.POST)
   public String searchStore(@RequestBody HashMap<String, String> param ) {
      SearchWord = param.get("Sname");
      //System.out.println(SearchWord);
      return "redirect:storeList.user";
   }
   
   //�˻���� - ����¡ ó��
   @ResponseBody
   @RequestMapping(value = "/pagingProcess.user", method = RequestMethod.POST)
   public List<StoreVO> UserPageChange(int pageNum, Model model) {
      int startPageNum=1;
      if(pageNum==0) {
         startPageNum=1;
      }
      
      startPageNum = (pageNum*10) - 9;
      int numberInOnePage =10;
      int endPageNum = startPageNum +numberInOnePage-1;
      System.out.println("PageNum:" + pageNum + ", startPageNum: " + startPageNum );
      
      HashMap<String, Integer> map = new HashMap<String,Integer>();
      map.put("startPageNum", startPageNum);
      map.put("endPageNum", endPageNum);
      
      //List<StoreVO> userPageChange =uStoreService.UserPageChange(map);
      //model.addAttribute("userPageChange" ,userPageChange);
      return storeListByPage;
   }
   
   
   
}