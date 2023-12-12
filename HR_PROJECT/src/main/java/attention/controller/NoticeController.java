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
import attention.beans.PageBean;
import attention.beans.UserBean;
import attention.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

// 전체 --------------------------------------------------------------------------------------

	@GetMapping("/all/noticeAll")
	public String noticeAll(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			@RequestParam("board_info_idx") int board_info_idx) {
		List<NoticeBoardInfoBean> noticeList = noticeService.getNoticeMenuList();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("board_info_idx", board_info_idx);

		PageBean pageBean = noticeService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);

		List<NoticeContentBean> contentList = noticeService.getContentAllList(page);
		model.addAttribute("contentList", contentList);
		model.addAttribute("loginUserBean", loginUserBean);

		return "notice/all/noticeAll";
	}

	@GetMapping("/all/read")
	public String read(@RequestParam("board_info_idx") int board_info_idx, @RequestParam("content_idx") int content_idx,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);

		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

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
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page") int page,
			@ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		NoticeContentBean tempContentBean = noticeService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_id(tempContentBean.getContent_writer_id());
		modifyContentBean.setContent_board_idx(board_info_idx); // param값 그대로 저장
		modifyContentBean.setContent_idx(content_idx); // param값 그대로 저장

		return "notice/all/modify";
	}

	@PostMapping("/all/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, @RequestParam(value = "page") int page, Model model) {

		model.addAttribute("page", page);

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

// 부서별-----------------------------------------------------------------------------------------

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
	public String noticeSubDetail(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		String boardInfoName = noticeService.getBoardInfoName(board_info_idx);
		model.addAttribute("boardInfoName", boardInfoName);

		List<NoticeContentBean> contentList = noticeService.getContentSubList(board_info_idx, page);
		model.addAttribute("contentList", contentList);

		model.addAttribute("loginUserBean", loginUserBean);

		PageBean pageBean = noticeService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);

		return "notice/sub/noticeSubDetail";
	}

	@GetMapping("/sub/read")
	public String sub_read(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);

		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		return "notice/sub/read";
	}

	@GetMapping("/sub/write")
	public String sub_write(@ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			@RequestParam("board_info_idx") int board_info_idx) {

		writeContentBean.setContent_board_idx(board_info_idx);

		return "notice/sub/write";
	}

	@PostMapping("/sub/write_pro")
	public String sub_write_pro(@Valid @ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "notice/sub/write";
		}

		noticeService.addContentInfo(writeContentBean);

		return "notice/sub/write_success";
	}

	@GetMapping("/sub/not_writer")
	public String sub_not_writer() {
		return "notice/sub/not_writer";
	}

	@GetMapping("/sub/modify")
	public String sub_modify(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page") int page,
			@ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		NoticeContentBean tempContentBean = noticeService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_id(tempContentBean.getContent_writer_id());
		modifyContentBean.setContent_board_idx(board_info_idx); // param값 그대로 저장
		modifyContentBean.setContent_idx(content_idx); // param값 그대로 저장

		return "notice/sub/modify";
	}

	@PostMapping("/sub/modify_pro")
	public String sub_modify_pro(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, @RequestParam(value = "page") int page, Model model) {

		model.addAttribute("page", page);

		if (result.hasErrors()) {
			return "notice/sub/modify";
		}

		noticeService.modifyContentInfo(modifyContentBean);

		return "notice/sub/modify_success";

	}

	@GetMapping("/sub/delete")
	public String sub_delete(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, Model model) {

		noticeService.deleteContentInfo(content_idx);
		model.addAttribute("board_info_idx", board_info_idx);

		return "notice/sub/delete";
	}

	// 전체 READ
	// --------------------------------------------------------------------------------------

	@GetMapping("/all_read/noticeAll")
	public String noticeAll_emp(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			@RequestParam("board_info_idx") int board_info_idx) {
		List<NoticeBoardInfoBean> noticeList = noticeService.getNoticeMenuList();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("board_info_idx", board_info_idx);

		PageBean pageBean = noticeService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);

		List<NoticeContentBean> contentList = noticeService.getContentAllList(page);
		model.addAttribute("contentList", contentList);
		model.addAttribute("loginUserBean", loginUserBean);

		return "notice/all_read/noticeAll";
	}

	@GetMapping("/all_read/read")
	public String read_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		model.addAttribute("board_info_idx", board_info_idx);

		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);

		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		return "notice/all_read/read";
	}

	@GetMapping("/all_read/write")
	public String write_emp(@ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			@RequestParam("board_info_idx") int board_info_idx) {

		writeContentBean.setContent_board_idx(board_info_idx);

		return "notice/all_read/write";
	}

	@PostMapping("/all_read/write_pro")
	public String write_pro_emp(@Valid @ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "notice/all_read/write";
		}

		noticeService.addContentInfo(writeContentBean);

		return "notice/all_read/write_success";
	}

	@GetMapping("/all_read/not_writer")
	public String not_writer_emp() {
		return "notice/all_read/not_writer";
	}

	@GetMapping("/all_read/modify")
	public String modify_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page") int page,
			@ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		NoticeContentBean tempContentBean = noticeService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_id(tempContentBean.getContent_writer_id());
		modifyContentBean.setContent_board_idx(board_info_idx); // param값 그대로 저장
		modifyContentBean.setContent_idx(content_idx); // param값 그대로 저장

		return "notice/all_read/modify";
	}

	@PostMapping("/all_read/modify_pro")
	public String modify_pro_emp(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, @RequestParam(value = "page") int page, Model model) {

		model.addAttribute("page", page);

		if (result.hasErrors()) {
			return "notice/all_read/modify";
		}

		noticeService.modifyContentInfo(modifyContentBean);

		return "notice/all_read/modify_success";

	}

	@GetMapping("/all_read/delete")
	public String delete_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, Model model) {

		noticeService.deleteContentInfo(content_idx);
		model.addAttribute("board_info_idx", board_info_idx);

		return "notice/all_read/delete";
	}

	// 부서별 READ
	// -----------------------------------------------------------------------------------------

//		@GetMapping("/sub_read/noticeSub")
//		public String noticeSub_emp(Model model) {
//
//			List<NoticeBoardInfoBean> noticeMenuList = noticeService.getNoticeSubMenuList();
//			model.addAttribute("noticeMenuList", noticeMenuList);
//
//			ArrayList<List<NoticeContentBean>> list = new ArrayList<List<NoticeContentBean>>();
//			for (int i = 2; i <= 7; i++) {
//				List<NoticeContentBean> list1 = noticeService.getContentSubList(i);
//				list.add(list1);
//			}
//			model.addAttribute("list", list);
//
//			return "notice/sub_read/noticeSub";
//		}

	@GetMapping("/sub_read/noticeSubDetail")
	public String noticeSubDetail_emp(@RequestParam(value = "board_info_idx", required = false) Integer board_info_idx,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		// '글쓰기' 버튼 표시 여부 결정
		boolean canCRUD = loginUserBean.getEmployee_position().equals("부장")
				|| loginUserBean.getEmployee_position().equals("차장");
		model.addAttribute("canCRUD", canCRUD);

      // board_info_idx가 제공되지 않았을 경우, 사용자의 직위에 따라 값을 설정
      if (board_info_idx == null) {
         if (loginUserBean.getLine_name().equals("개발부")) {
            board_info_idx = 2;
         } else if (loginUserBean.getLine_name().equals("영업부")) {
            board_info_idx = 3;
         } else if (loginUserBean.getLine_name().equals("인사부")) {
            board_info_idx = 4;
         } else if (loginUserBean.getLine_name().equals("기획부")) {
            board_info_idx = 5;
         } else if (loginUserBean.getLine_name().equals("디자인부")) {
            board_info_idx = 6;
         } else if (loginUserBean.getLine_name().equals("테스트부")) {
            board_info_idx = 7;
         } else if (loginUserBean.getLine_name().equals("attention")) {
            board_info_idx = 1;
         }
      }
      model.addAttribute("board_info_idx", board_info_idx);

		String boardInfoName = noticeService.getBoardInfoName(board_info_idx);
		model.addAttribute("boardInfoName", boardInfoName);

		List<NoticeContentBean> contentList = noticeService.getContentSubList(board_info_idx, page);
		model.addAttribute("contentList", contentList);

		model.addAttribute("loginUserBean", loginUserBean);

		PageBean pageBean = noticeService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);

		return "notice/sub_read/noticeSubDetail";
	}

	@GetMapping("/sub_read/read")
	public String sub_read_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		boolean canCRUD = loginUserBean.getEmployee_position().equals("부장")
				|| loginUserBean.getEmployee_position().equals("차장");
		model.addAttribute("canCRUD", canCRUD);

		model.addAttribute("board_info_idx", board_info_idx);

		NoticeContentBean readContentBean = noticeService.getContentInfo(content_idx);

		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		return "notice/sub_read/read";
	}

	@GetMapping("/sub_read/write")
	public String sub_write_emp(@ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			@RequestParam("board_info_idx") int board_info_idx) {

		writeContentBean.setContent_board_idx(board_info_idx);

		return "notice/sub_read/write";
	}

	@PostMapping("/sub_read/write_pro")
	public String sub_write_pro_emp(@Valid @ModelAttribute("writeContentBean") NoticeContentBean writeContentBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "notice/sub_read/write";
		}

		noticeService.addContentInfo(writeContentBean);

		return "notice/sub_read/write_success";
	}

	@GetMapping("/sub_read/not_writer")
	public String sub_not_writer_emp() {
		return "notice/sub_read/not_writer";
	}

	@GetMapping("/sub_read/modify")
	public String sub_modify_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, @RequestParam(value = "page") int page,
			@ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean, Model model) {

		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);

		NoticeContentBean tempContentBean = noticeService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_id(tempContentBean.getContent_writer_id());
		modifyContentBean.setContent_board_idx(board_info_idx); // param값 그대로 저장
		modifyContentBean.setContent_idx(content_idx); // param값 그대로 저장

		return "notice/sub_read/modify";
	}

	@PostMapping("/sub_read/modify_pro")
	public String sub_modify_pro_emp(@Valid @ModelAttribute("modifyContentBean") NoticeContentBean modifyContentBean,
			BindingResult result, @RequestParam(value = "page") int page, Model model) {

		model.addAttribute("page", page);

		if (result.hasErrors()) {
			return "notice/sub_read/modify";
		}

		noticeService.modifyContentInfo(modifyContentBean);

		return "notice/sub_read/modify_success";

	}

	@GetMapping("/sub_read/delete")
	public String sub_delete_emp(@RequestParam("board_info_idx") int board_info_idx,
			@RequestParam("content_idx") int content_idx, Model model) {

		noticeService.deleteContentInfo(content_idx);
		model.addAttribute("board_info_idx", board_info_idx);

		return "notice/sub_read/delete";
	}
}
