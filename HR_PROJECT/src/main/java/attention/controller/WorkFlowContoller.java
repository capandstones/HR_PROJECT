package attention.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import attention.beans.DraftBean;
import attention.service.WorkFlowService;

@Controller
@RequestMapping("/workflow")
public class WorkFlowContoller {
	
	@Resource(name = "draftContentBean")
	private DraftBean draftContentBean;

	// service 주입
	@Autowired
	private WorkFlowService workFlowService;

	@GetMapping("/selectWrite")
	public String selectWrite() {
		return "workflow/selectWrite";

	}

	@GetMapping("/document")
	public String document(HttpServletRequest request) {

		return "workflow/document";

	}

	@GetMapping("/cpDocument")
	public String cpDocument() {
		return "workflow/cpDocument";

	}

	// 글 작성하기 폼페이지 요청
	@GetMapping("/write")
	public String write(HttpServletRequest request) {

		return "workflow/write";
	}

	// 글 작성하기 폼페이지 요청
	@GetMapping("/write2")
	public String write2() {

		return "workflow/write2";
	}
	
	@PostMapping("/write_pro")
	public String write_pro(@RequestParam("draft_subject") String draft_subject,
							@RequestParam("draft_text") String draft_text,
							@RequestParam("draft_hope_date") String draft_hope_date,
							@RequestParam("upload_file") MultipartFile upload_file) {
		
		
		draftContentBean.setDraft_subject(draft_subject);
		draftContentBean.setDraft_text(draft_text);
		draftContentBean.setDraft_hope_date(draft_hope_date);
		draftContentBean.setUpload_file(upload_file);
		System.out.println(draftContentBean.getDraft_subject());
		System.out.println(draftContentBean.getDraft_text());
		System.out.println(draftContentBean.getDraft_hope_date());
		System.out.println((String)draftContentBean.getDraft_file());
		
		workFlowService.addContentInfo(draftContentBean);
		
		return "workflow/write_success";
	}
	
	

	// 글 작성하기 폼페이지 요청
	@GetMapping("/write3")
	public String write3(HttpServletRequest request) {

		return "workflow/write3";
	}

	// 글 작성하기 폼페이지 요청
	@GetMapping("/write4")
	public String write4(HttpServletRequest request) {

		return "workflow/write4";
	}

}
