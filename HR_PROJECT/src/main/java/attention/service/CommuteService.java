package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.CommuteBean;
import attention.mapper.CommuteMapper;

@Service
public class CommuteService {

   @Autowired
   private CommuteMapper commuteMapper;

   public List<CommuteBean> getCommuteTotal(String employee_id, String today) {
      return commuteMapper.getCommuteTotal(employee_id, today);
   }

}