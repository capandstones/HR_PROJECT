package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import attention.beans.DraftBean;

public interface WorkFlowMapper {
	
	@SelectKey(statement = "select HRPROJECT.draft_seq.nextval from dual", keyProperty = "draft_idx", before = true, resultType = int.class)

	@Insert("insert into HRPROJECT.draft_table(draft_idx, draft_subject, draft_text, "
			+ "draft_file, draft_writer_id, draft_hope_date, draft_date, draft_looker_id1, draft_looker_id2, draft_looker_id3 ) "
			+ "values (#{draft_idx}, #{draft_subject}, #{draft_text}, #{draft_file, jdbcType=VARCHAR}, "
			+ "#{draft_writer_id}, #{draft_hope_date}, sysdate, #{draft_looker_id1}, #{draft_looker_id2}, #{draft_looker_id3})")
	void addContentInfo(DraftBean draftContentBean);
	
	@Select("select a1.content_idx, a1.content_subject, a2.user_name as content_writer_name, "
			+ "       to_char(a1.content_date, 'YYYY-MM-DD') as content_date " + "from content_table a1, user_table a2 "
			+ "where a1.content_writer_idx = a2.user_idx " + "  and a1.content_board_idx = #{board_info_idx} "
			+ "order by a1.content_idx desc")
	List<DraftBean> getContentList();

}
