package attention.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeesBean;
import attention.beans.NoticeBoardInfoBean;
import attention.beans.NoticeContentBean;
import attention.beans.UserBean;
import attention.mapper.EmployeesMapper;
import attention.service.NoticeService;

@Controller
@RequestMapping("/main")
public class MainContoller {

   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;

   @Autowired
   EmployeesMapper employeesMapper;
   
   @Autowired
   NoticeService noticeService;

   @GetMapping("/main")
   public String main(String employee_id, Model model) {
      
      String empId = loginUserBean.getEmployee_id();
      String empLineName = loginUserBean.getLine_name();
      List<NoticeBoardInfoBean> noticeMenuList = noticeService.getNoticeSubMenuList();
      model.addAttribute("noticeMenuList", noticeMenuList);
      
      EmployeesBean employeeInfo = employeesMapper.getEmpInfoDetail(empId);
      model.addAttribute("employeeInfo", employeeInfo);
      
      List<NoticeContentBean> list1 = noticeService.getContentSubList(1);
      model.addAttribute("list1", list1);
      
      if(empLineName.equals("개발부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(2);
         
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("영업부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(3);
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("인사부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(4);
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("기획부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(5);
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("디자인부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(6);
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("테스트부")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(7);
         model.addAttribute("list2", list2);
      } else if(empLineName.equals("attention")){
         List<NoticeContentBean> list2 = noticeService.getContentSubList(1);
         model.addAttribute("list2", list2);
      } 
      
      return"main/main";
   }
   
}

