package attention.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import attention.beans.DraftBean;
import attention.beans.UserBean;
import attention.dao.UserDao;
import attention.dao.WorkFlowDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class WorkFlowService {

	@Value("${path.upload}")
	private String path_upload;

	@Autowired
	private WorkFlowDao workFlowDao;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Resource(name = "draftContentBean")
	private DraftBean draftContentBean;

	@Autowired
	private UserDao userDao;

	public List<UserBean> getLookerList(UserBean loginUserBean) {

		return userDao.getLookerList(loginUserBean);
	}

	private String saveUploadFile(MultipartFile upload_file) {
		String file_name = System.currentTimeMillis() + "_"
				+ FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "."
				+ FilenameUtils.getExtension(upload_file.getOriginalFilename());

		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public void addContentInfo(DraftBean draftContentBean) {
		System.out.println(draftContentBean.getDraft_subject());
		System.out.println(draftContentBean.getDraft_text());
		System.out.println(draftContentBean.getUpload_file().getSize());

		MultipartFile upload_file = draftContentBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);
			draftContentBean.setDraft_file(file_name);
		}

		draftContentBean.setDraft_writer_id(loginUserBean.getEmployee_id());

		workFlowDao.addContentInfo(draftContentBean);
	}

	public String getDraftInfoName(int draft_info_idx) {

		return workFlowDao.getDraftInfoName(draft_info_idx);
	}

	public List<DraftBean> getContentList(int draft_info_idx, String employee_id) {

		return workFlowDao.getContentList(draft_info_idx, employee_id);
	}

	public DraftBean getContentInfo(int draft_idx) {
		return workFlowDao.getContentInfo(draft_idx);
	}

	public void changeOpinion(int draft_idx, String employee_id, int opinion,String employee_name,String comment) {

		employee_id = loginUserBean.getEmployee_id();
		employee_name = loginUserBean.getEmployee_name();

		workFlowDao.changeOpinion(draft_idx, employee_id, opinion,employee_name,comment);
	}

	public void checkOpinion(int draft_idx) {
		workFlowDao.checkOpinion(draft_idx);
	}

	public void addEmployee(UserBean joinBean) {
		workFlowDao.addEmployee(joinBean);
	}

	public List<UserBean> getAllList(String department) {

		return workFlowDao.getAllList(department);
	}

}
