package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import attention.beans.NoticeBoardInfoBean;
import attention.beans.NoticeContentBean;

public interface NoticeMapper {
   
   @Select("select board_info_idx, board_info_name "
         + "from HRPROJECT.notice_board_info "
         + "order by board_info_idx")
   List<NoticeBoardInfoBean> getNoticeMenuList(); 
   
   @Select("select board_info_idx, board_info_name "
         + "from HRPROJECT.notice_board_info "
         + "where board_info_idx not in 1 "
         + "order by board_info_idx")
   List<NoticeBoardInfoBean> getNoticeSubMenuList(); 
   
   @SelectKey(statement = "select content_seq.nextval from dual", keyProperty = "content_idx", before = true, resultType = int.class)

   @Insert("insert into HRPROJECT.notice_content(content_idx, content_subject, content_text, "
         + "content_file, content_writer_id, content_board_idx, content_date) "
         + "values (#{content_idx}, #{content_subject}, #{content_text}, #{content_file, jdbcType=VARCHAR}, "
         + "#{content_writer_id}, #{content_board_idx}, sysdate)")
   void addContentInfo(NoticeContentBean writeContentBean);

   // 카테고리 식별
   @Select("select board_info_name " + "from HRPROJECT.notice_board_Info " + "where board_info_idx=#{board_info_idx}")
   String getBoardInfoName(int board_info_idx);

   // 카테고리 식별
   @Select("select content_board_idx, a1.content_idx, a1.content_subject, a2.employee_name as content_writer_name, "
         + "to_char(a1.content_date, 'YYYY-MM-DD') as content_date " + "from HRPROJECT.notice_content a1, HRPROJECT.employees a2 "
         + "where a1.content_writer_id = a2.employee_id " + "and a1.content_board_idx = #{board_info_idx} "
         + "order by a1.content_idx desc")
   List<NoticeContentBean> getContentSubList(int board_info_idx, RowBounds rowBounds);
   
   @Select("select a1.content_idx, a1.content_subject, a2.employee_name as content_writer_name, "
            + "to_char(a1.content_date, 'YYYY-MM-DD') as content_date " + "from HRPROJECT.notice_content a1, HRPROJECT.employees a2 "
            + "where a1.content_writer_id = a2.employee_id " + "and a1.content_board_idx = 1 "
            + "order by a1.content_idx desc")
   List<NoticeContentBean> getContentAllList(RowBounds rowBounds);
   
   // 상세페이지
   @Select("select a2.employee_name as content_writer_name, "
         + "to_char(a1.content_date, 'YYYY-MM-DD') as content_date, "
         + "a1.content_subject, a1.content_text, a1.content_file, a1.content_writer_id "
         + "from HRPROJECT.notice_content a1, HRPROJECT.employees a2 " + "where a1.content_writer_id = a2.employee_id "
         + "and content_idx = #{content_idx}")
   NoticeContentBean getContentInfo(int content_idx);

   @Update("update HRPROJECT.notice_content " + "set content_subject = #{content_subject}, content_text = #{content_text}, "
         + "content_file = #{content_file, jdbcType=VARCHAR} " + "where content_idx = #{content_idx}")
   void modifyContentInfo(NoticeContentBean modifyContentBean);

   @Delete("delete from HRPROJECT.notice_content where content_idx = #{content_idx}")
   void deleteContentInfo(int content_idx);

   @Select("select count(*) from HRPROJECT.notice_content where content_board_idx = #{content_board_idx}")
   int getContentCnt(int content_board_idx);
}
