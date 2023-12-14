package attention.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.TeamCalendarBean;
import attention.beans.UserBean;
import attention.mapper.TeamCalendarMapper;
import attention.service.TeamCalendarService;

@RestController
public class RestTeamCalendarController {
   
   @Autowired
   private TeamCalendarService teamCalendarService;
   @Autowired
   private TeamCalendarMapper teamCalendarMapper;
   
   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;
   
   @PostMapping("/team/events")
    public List<TeamCalendarBean> getCalendarEvents(String line_name) { 
      
      line_name = loginUserBean.getLine_name();
      System.out.println(line_name);
      
       return teamCalendarService.getCalendarEvents(line_name); 
   }
   
   @GetMapping("teamdeleteEvent/{eventIdx}")
   public void teamdeleteEvent(@PathVariable int eventIdx) {
      
      teamCalendarMapper.teamDelete(eventIdx);
   }
   
}