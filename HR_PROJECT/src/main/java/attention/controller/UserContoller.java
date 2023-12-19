package attention.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.beans.UserBean;
import attention.service.UserService;
import attention.vaildator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserContoller {

   @Autowired
   private UserService userService;

   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;

   @GetMapping("/login")
   public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
         @RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {

      model.addAttribute("fail", fail);// 처음은 무조건 fail=false 이후 실패시 fail=true

      return "user/login";
   }

   @GetMapping("/login_pro")
   public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
         BindingResult result, Model model) {

      if (result.hasErrors()) {
         return "user/login";
      }

      userService.getLoginUserInfo(tempLoginUserBean);

      

      if (loginUserBean.isUserLogin() == true) {

         if (loginUserBean.getEmployee_position().equals("대기중")) {

            return "user/login_waiting";
         }

         if (loginUserBean.getEmployee_position().equals("관리자")) {

            return "admin/main";
         }
         
         return "user/login_success";

      } else {

         return "user/login_fail";
      }
   }

   @GetMapping("/modify")
   public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {

      userService.getModifyUserInfo(modifyUserBean);

      return "user/modify";
   }

   @PostMapping("/modify_pro")
   public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {

      if (result.hasErrors()) {
         return "user/modify";
      }

      userService.modifyUserInfo(modifyUserBean);

      return "user/modify_success";
   }

   @GetMapping("/logout")
   public String logout() {

      loginUserBean.setUserLogin(false);

      return "user/logout";
   }

   @GetMapping("/not_login")
   public String not_login() {

      loginUserBean.setUserLogin(false);

      return "user/not_login";
   }

   @InitBinder
   public void initBinder(WebDataBinder binder) {
      UserValidator validator1 = new UserValidator();
      binder.addValidators(validator1);
   }

}