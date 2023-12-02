package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import attention.beans.DraftBean;

public interface WorkFlowMapper {

	@SelectKey(statement = "select HRPROJECT.draft_seq.nextval from dual", keyProperty = "draft_idx", before = true, resultType = int.class)

	@Insert("insert into HRPROJECT.draft_table(draft_idx, draft_subject, draft_text, "
			+ "draft_file, draft_writer_id, draft_hope_date, draft_date, draft_looker_id1, draft_looker_id2, draft_looker_id3,draft_info_idx ) "
			+ "values (#{draft_idx}, #{draft_subject}, #{draft_text}, #{draft_file, jdbcType=VARCHAR}, "
			+ "#{draft_writer_id}, #{draft_hope_date}, sysdate, #{draft_looker_id1}, #{draft_looker_id2}, #{draft_looker_id3}, #{draft_info_idx} )")
	void addContentInfo(DraftBean draftContentBean);

	// 카테고리 식별
	@Select("select draft_info_name " + "from HRPROJECT.draft_info_table " + "where draft_info_idx = #{draft_info_idx}")
	String getDraftInfoName(int draft_info_idx);

	// 글목록 보기
	   @Select("select a1.draft_idx, a1.draft_subject,a1.draft_text, a2.employee_name as draft_writer_name, "
	         + "       to_char(a1.draft_date, 'YYYY-MM-DD') as draft_date " + "from HRPROJECT.draft_table a1, HRPROJECT.employees a2 "
	         + "where a1.draft_writer_id = a2.employee_id " + " and a1.draft_info_idx = #{draft_info_idx} "
	         + "order by a1.draft_idx desc")
	   List<DraftBean> getContentList(int draft_info_idx);
	

}
