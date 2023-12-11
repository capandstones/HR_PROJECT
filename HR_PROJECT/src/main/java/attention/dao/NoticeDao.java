package attention.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.NoticeBoardInfoBean;
import attention.beans.NoticeContentBean;
import attention.mapper.NoticeMapper;

@Repository
public class NoticeDao {

   @Autowired
   private NoticeMapper noticeMapper;

   
   public List<NoticeBoardInfoBean> getNoticeMenuList() {
      return noticeMapper.getNoticeMenuList();
   }
   
   public List<NoticeBoardInfoBean> getNoticeSubMenuList() {
      return noticeMapper.getNoticeSubMenuList();
   }
   
   public void addContentInfo(NoticeContentBean writeContentBean) {
      noticeMapper.addContentInfo(writeContentBean);
   }

   public String getBoardInfoName(int board_info_idx) {
      return noticeMapper.getBoardInfoName(board_info_idx);
   }

   public List<NoticeContentBean> getContentAllList(RowBounds rowBounds) {
      return noticeMapper.getContentAllList(rowBounds);
   }
   
   public List<NoticeContentBean> getContentSubList(int board_info_idx, RowBounds rowBounds) {
      return noticeMapper.getContentSubList(board_info_idx, rowBounds);
   }

   public NoticeContentBean getContentInfo(int content_idx) {
      return noticeMapper.getContentInfo(content_idx);
   }

   public void modifyContentInfo(NoticeContentBean modifyContentBean) {
      noticeMapper.modifyContentInfo(modifyContentBean);
   }

   public void deleteContentInfo(int content_idx) {
      noticeMapper.deleteContentInfo(content_idx);
   }

   public int getContentCnt(int content_board_idx) {
      return noticeMapper.getContentCnt(content_board_idx);
   }
}