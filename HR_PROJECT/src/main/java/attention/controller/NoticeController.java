package attention.controller;

import java.util.ArrayList;
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

// ��ü �������� --------------------------------------------------------------------------------------
	@GetMapping("/all/noticeAll")
	public String noticeAll(Model model) {
		List<NoticeBoardInfoBean> noticeList = noticeService.getNoticeMenuList();
		model.addAttribute("noticeList", noticeList);

		List<NoticeContentBean> contentList = noticeService.getContentAllList();
		model.addAttribute("contentList", contentList);
		model.addAttribute("loginUserBean", loginUserBean);

		return "notice/all/noticeAll";
	}

	@GetMapping("/all/read")
	public String read(@RequestParam("board_info_idx") int board_info_idx, @RequestParam("content_idx") int content_idx,
			Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);

		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);

		return "notice/all/read";
	}

	@GetMapping("/all/write")
	public String write(@ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			@RequestParam("board_info_idx") int board_info_idx) {

		writeContentBean.setContent_board_idx(board_info_idx);

		return "notice/all/write";
	}

	@PostMapping("/all/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "notice/all/write";
		}

		noticeService.addContentInfo(writeContentBean);

		return "notice/all/write_success";
	}

	@GetMapping("/all/not_writer")
	public String not_writer() {
		return "notice/all/not_writer";
	}

	@GetMapping("/all/modify")
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
		modifyContentBean.setContent_board_idx(board_info_idx); // param�� �״�� ����
		modifyContentBean.setContent_idx(content_idx); // param�� �״�� ����

		return "notice/all/modify";
	}

	@PostMapping("/all/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, Model model) {

//		model.addAttribute("page", page);

		if (result.hasErrors()) {
			return "notice/all/modify";
		}

		noticeService.modifyContentInfo(modifyContentBean);

		return "notice/all/modify_success";

	}

	@GetMapping("/all/delete")
	public String delete(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, Model model) {

		noticeService.deleteContentInfo(content_idx);
		model.addAttribute("board_info_idx", board_info_idx);

		return "notice/all/delete";
	}

	
// �μ��� �������� -------------------------------------------------------------------------------------
	
	@GetMapping("/sub/noticeSub")
	public String noticeSub(Model model) {

		List<NoticeBoardInfoBean> noticeMenuList = noticeService.getNoticeSubMenuList();
		model.addAttribute("noticeMenuList", noticeMenuList);

		ArrayList<List<NoticeContentBean>> list = new ArrayList<List<NoticeContentBean>>();
		for (int i = 2; i <= 7; i++) {
			List<NoticeContentBean> list1 = noticeService.getContentSubList(i);
			list.add(list1);
		}
		model.addAttribute("list", list);

		return "notice/sub/noticeSub";
	}

	@GetMapping("/sub/noticeSubDetail")
	public String noticeSubDetail(@RequestParam("board_info_idx") int board_info_idx, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		String boardInfoName = noticeService.getBoardInfoName(board_info_idx);
		model.addAttribute("boardInfoName", boardInfoName);

		List<NoticeContentBean> contentList = noticeService.getContentSubList(board_info_idx);
		model.addAttribute("contentList", contentList);

		model.addAttribute("loginUserBean", loginUserBean);

//		PageBean pageBean = noticeService.getContentCnt(board_info_idx, page);
//		model.addAttribute("pageBean", pageBean);
//		model.addAttribute("page", page);

		return "notice/sub/noticeSubDetail";
	}

}
