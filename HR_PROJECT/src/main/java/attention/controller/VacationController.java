package attention.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import attention.beans.UserBean;
import attention.beans.VacationBean;
import attention.service.VacationService;

@Controller
@RequestMapping("/vacation")
@CrossOrigin(origins = "http://yourfrontenddomain.com")
public class VacationController {

   @Autowired
   private VacationService vacationService;

   @GetMapping("/main")
   public String main() {
      return "vacation/main";
   }

   @GetMapping("/request1")
   public String request1(HttpServletRequest request) {
      return "vacation/request1";
   }

   @GetMapping("/request2")
   public String request2() {
      return "vacation/request2";
   }

   @GetMapping("/request3")
   public String request3() {
      return "vacation/request3";
   }

   @GetMapping("/request4")
   public String request4() {
      return "vacation/request4";
   }

   @GetMapping("/request5")
   public String request5() {
      return "vacation/request5";
   }

   @GetMapping("/request6")
   public String request6() {
      return "vacation/request6";
   }

   @GetMapping("/request7")
   public String request7() {
      return "vacation/request7";
   }

   @GetMapping("/request8")
   public String request8() {
      return "vacation/request8";
   }

   @PostMapping("/submit_pro")
   public String submit_pro(@RequestParam("employee_id") String employee_id,
         @RequestParam("line_name") String line_name, @RequestParam("department_name") String department_name,
         @RequestParam("employee_position") String employee_position,
         @RequestParam("vacation_name") String vacation_name, @RequestParam("employee_name") String employee_name,
         @RequestParam("employee_id_approver") String employee_id_approver,
         @RequestParam("employee_id_referrer") String employee_id_referrer,
         @RequestParam("vacation_start_date") String vacation_start_date,
         @RequestParam("vacation_end_date") String vacation_end_date,
         @RequestParam("vacation_days") int vacation_days, @RequestParam("vacation_reason") String vacation_reason,
         @RequestParam("vacation_attachment") String vacation_attachment,
         @RequestParam("vacation_state") String vacation_state) {

      vacationService.saveVacation(employee_id, line_name, department_name, employee_position, vacation_name,
            employee_name, employee_id_approver, employee_id_referrer, vacation_start_date, vacation_end_date,
            vacation_days, vacation_reason, vacation_attachment, vacation_state);

      return "vacation/success";
   }

   @GetMapping("/getVacations")
   @ResponseBody
   public List<VacationBean> getVacations(@RequestParam("employee_id") String employee_id) {
      return vacationService.getUpcomingVacations(employee_id);
   }

   @GetMapping("/getVacationHistory")
   @ResponseBody
   public List<VacationBean> getVacationHistory(@RequestParam("employee_id") String employee_id) {
      return vacationService.getVacationHistory(employee_id);
   }

   @GetMapping("/getMemberVacations")
   @ResponseBody
   public List<VacationBean> getMemberVacations(@RequestParam("employee_id") String employee_id, @RequestParam("employee_name") String employee_name, @RequestParam("line_name") String line_name) {
      return vacationService.getMemberVacations(employee_id, employee_name, line_name);
   }

   @PostMapping("/cancelVacation")
   @ResponseBody
   public String cancelVacation(@RequestParam("va_idx") int va_idx) {
      vacationService.cancelVacation(va_idx);
      return "취소되었습니다";
   }

   @GetMapping("/getMemberVacationList")
   @ResponseBody
   public List<UserBean> getMemberVacationList(@RequestParam("line_name") String line_name) {
      return vacationService.getMemberVacationList(line_name);
   }

   @PostMapping("/rejectVacation")
   @ResponseBody
   public String rejectVacation(@RequestBody Map<String, String> params) {
      String va_idx = params.get("va_idx");
      vacationService.rejectVacation(va_idx, "반려");
      return "반려 처리되었습니다";
   }

   @PostMapping("/approveVacation")
   @ResponseBody
   public String approveVacation(@RequestBody Map<String, String> params) {
      String va_idx = params.get("va_idx");
      vacationService.approveVacation(va_idx, "승인");
      return "승인 처리되었습니다";
   }

}