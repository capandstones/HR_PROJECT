package attention.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.CommuteBean;
import attention.mapper.CommuteMapper;

@Service
public class CommuteService {

   @Autowired
   private CommuteMapper commuteMapper;

   public CommuteBean getWeeklyWorkTime(String employee_id, String today) {
      return commuteMapper.getWeeklyWorkTime(employee_id, today);
   }

}