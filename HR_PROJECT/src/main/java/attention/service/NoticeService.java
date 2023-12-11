package attention.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import attention.beans.NoticeBoardInfoBean;
import attention.beans.NoticeContentBean;
import attention.beans.PageBean;
import attention.beans.UserBean;
import attention.dao.NoticeDao;
import attention.mapper.NoticeMapper;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class NoticeService {
   
   @Value("${path.upload}")
   private String path_upload;

   @Value("${page.listcnt}")
   private int page_listcnt;

   @Value("${page.paginationcnt}")
   private int page_paginationcnt;

   @Autowired
   private NoticeDao noticeDao;
   
   @Autowired NoticeMapper noticeMapper;

   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;

   public List<NoticeBoardInfoBean> getNoticeMenuList( ) {
      return noticeDao.getNoticeMenuList();
   }
   
   public List<NoticeBoardInfoBean> getNoticeSubMenuList() {
      return noticeDao.getNoticeSubMenuList();
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

   public void addContentInfo(NoticeContentBean writeContentBean) {
      System.out.println(writeContentBean.getContent_subject());
      System.out.println(writeContentBean.getContent_text());
      System.out.println(writeContentBean.getUpload_file().getSize());

      MultipartFile upload_file = writeContentBean.getUpload_file();

      if (upload_file.getSize() > 0) {
         String file_name = saveUploadFile(upload_file);
         System.out.println(file_name);
         writeContentBean.setContent_file(file_name);
      }

      writeContentBean.setContent_writer_id(loginUserBean.getEmployee_id());

      noticeDao.addContentInfo(writeContentBean);
   }

   public String getBoardInfoName(int board_info_idx) {
      return noticeDao.getBoardInfoName(board_info_idx);
   }

   public List<NoticeContentBean> getContentAllList(int page) {
      int start = (page - 1) * page_listcnt;
      RowBounds rowBounds = new RowBounds(start, page_listcnt);
      return noticeDao.getContentAllList(rowBounds);
   }
   
   public List<NoticeContentBean> getContentSubList(int board_info_idx, int page) {
      int start = (page - 1) * page_listcnt;
      RowBounds rowBounds = new RowBounds(start, page_listcnt);
      return noticeDao.getContentSubList(board_info_idx, rowBounds);
   }
   
   public List<NoticeContentBean> getContentSubList(int board_info_idx) {
      RowBounds rowBounds = new RowBounds(0, 5);
      return noticeDao.getContentSubList(board_info_idx, rowBounds);
   }

   public NoticeContentBean getContentInfo(int content_idx) {
      return noticeDao.getContentInfo(content_idx);
   }

   public void modifyContentInfo(NoticeContentBean modifyContentBean) {

      MultipartFile upload_file = modifyContentBean.getUpload_file();

      if (upload_file.getSize() > 0) {
         String file_name = saveUploadFile(upload_file);
         modifyContentBean.setContent_file(file_name);
      }

      noticeDao.modifyContentInfo(modifyContentBean);

   }

   public void deleteContentInfo(int content_idx) {
      noticeDao.deleteContentInfo(content_idx);
   }

   public PageBean getContentCnt(int content_board_idx, int currentPage) {
      int content_cnt = noticeDao.getContentCnt(content_board_idx);
      
      PageBean pageBean=new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
      
      return pageBean;
   }
}