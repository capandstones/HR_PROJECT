package attention.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/workflow")
public class WorkFlowContoller {

	// service 주입

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
	public String write2(HttpServletRequest request) {

		return "workflow/write2";
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
