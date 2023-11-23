package attention.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeeVO;
import attention.common.FileManager;
import attention.service.InterWorkflowService;

@Controller
@RequestMapping("/workflow")
public class WorkFlowContoller {

	

	@GetMapping("/selectWrite")
	public String selectWrite() {
		return "workflow/selectWrite";

	}

	@GetMapping("/document")
	public String document() {
		return "workflow/document";

	}
	
	@GetMapping("/cpDocument")
	public String cpDocument() {
		return "workflow/cpDocument";

	}

	// 글 작성하기 폼페이지 요청
	@PostMapping("/write")
	public String write(HttpServletRequest request) {

		
		return "workflow/write";
	}

}
