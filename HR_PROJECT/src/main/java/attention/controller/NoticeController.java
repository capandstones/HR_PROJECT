package attention.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.beans.NoticeBoardInfoBean;
import attention.beans.NoticeContentBean;
import attention.beans.UserBean;
import attention.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/noticeAll")
	public String main(Model model) {
		List<NoticeBoardInfoBean> noticeList = noticeService.getNoticeMenuList();
		model.addAttribute("noticeList", noticeList);
		
		List<NoticeContentBean> contentList = noticeService.getContentList();
		model.addAttribute("contentList", contentList);
		model.addAttribute("loginUserBean", loginUserBean);
	
		return "notice/noticeAll";
	}

	@GetMapping("/read")
	public String read(@RequestParam("board_info_idx") int board_info_idx, @RequestParam("content_idx") int content_idx, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		
		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);
		
		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);
		

		return "notice/read";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			@RequestParam("board_info_idx") int board_info_idx) {

		writeContentBean.setContent_board_idx(board_info_idx);

		return "notice/write";
	}

	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "notice/write";
		}

		noticeService.addContentInfo(writeContentBean);
		return "notice/write_success";
	}

	@GetMapping("/not_writer")
	public String not_writer() {
		return "notice/not_writer";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx,
			@ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
//		model.addAttribute("page", page);

		NoticeContentBean tempContentBean = noticeService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_id(tempContentBean.getContent_writer_id());
		modifyContentBean.setContent_board_idx(board_info_idx); // param값 그대로 저장
		modifyContentBean.setContent_idx(content_idx); // param값 그대로 저장

		return "notice/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, Model model) {

//		model.addAttribute("page", page);

		if (result.hasErrors()) {
			return "notice/modify";
		}

		noticeService.modifyContentInfo(modifyContentBean);

		return "notice/modify_success";

	}

	@GetMapping("/delete")
	public String delete(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, Model model) {

		noticeService.deleteContentInfo(content_idx);
		model.addAttribute("board_info_idx", board_info_idx);

		return "notice/delete";
	}
}
