package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import attention.beans.DraftBean;
import attention.beans.UserBean;

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
	@Select("select a1.draft_idx, a1.draft_subject,a1.draft_text,a1.looker1_opinion,a1.looker2_opinion,a1.looker3_opinion, a2.employee_name as draft_writer_name, "
			+ "       to_char(a1.draft_date, 'YYYY-MM-DD') as draft_date, "
			+ "       to_char(a1.draft_hope_date, 'YYYY-MM-DD') as draft_hope_date "
			+ " from HRPROJECT.draft_table a1, HRPROJECT.employees a2 " + "where a1.draft_writer_id = a2.employee_id "
			+ " and a1.draft_info_idx = #{draft_info_idx} "
			+ "and (draft_writer_id = #{employee_id} or draft_looker_id1=#{employee_id} or draft_looker_id2=#{employee_id} or draft_looker_id3=#{employee_id}) "
			+ " order by a1.draft_idx desc")
	List<DraftBean> getContentList(@Param("draft_info_idx") int draft_info_idx,
			@Param("employee_id") String employee_id);

	// read
	@Select("select a1.draft_idx, a1.draft_subject,a1.draft_text,a1.draft_file,a1.draft_writer_id, a1.looker1_opinion,a1.looker2_opinion,a1.looker3_opinion, "
			+ " a1.looker1_name, a1.looker2_name, a1.looker3_name, a1.looker1_comment, a1.looker2_comment, a1.looker3_comment, "
			+ " a1.draft_looker_id1, a1.draft_looker_id2, a1.draft_looker_id3, a2.employee_position, "
			+ " a2.employee_name as draft_writer_name, a2.department_name, "
			+ "       to_char(a1.draft_date, 'YYYY-MM-DD') as draft_date, "
			+ "       to_char(a1.draft_hope_date, 'YYYY-MM-DD') as draft_hope_date "
			+ " from HRPROJECT.draft_table a1, HRPROJECT.employees a2 " + "where a1.draft_writer_id = a2.employee_id "
			+ "      and draft_idx = #{draft_idx}")
	DraftBean getContentInfo(int draft_idx);
	
	
	@Update("UPDATE  HRPROJECT.draft_table "
			+ "SET "
			+ "    looker1_opinion = CASE WHEN #{employee_id} = draft_looker_id1 THEN #{opinion} ELSE looker1_opinion END, "
			+ "    looker1_name = CASE WHEN #{employee_id} = draft_looker_id1 THEN #{employee_name} ELSE looker1_name END, "
			+ "    looker1_comment = CASE WHEN #{employee_id} = draft_looker_id1 THEN #{comment} ELSE looker1_comment END, "
			+ "    looker2_opinion = CASE WHEN #{employee_id} = draft_looker_id2 THEN #{opinion} ELSE looker2_opinion END, "
			+ "    looker2_name = CASE WHEN #{employee_id} = draft_looker_id2 THEN #{employee_name} ELSE looker2_name END, "
			+ "    looker2_comment = CASE WHEN #{employee_id} = draft_looker_id2 THEN #{comment} ELSE looker2_comment END, "
			+ "    looker3_opinion = CASE WHEN #{employee_id} = draft_looker_id3 THEN #{opinion} ELSE looker3_opinion END, "
			+ "    looker3_name = CASE WHEN #{employee_id} = draft_looker_id3 THEN #{employee_name} ELSE looker3_name END, "
			+ "    looker3_comment = CASE WHEN #{employee_id} = draft_looker_id3 THEN #{comment} ELSE looker3_comment END "
			+ "WHERE "
			+ "    draft_idx = #{draft_idx}")
	void changeOpinion(@Param("draft_idx") int draft_idx,
					   @Param("employee_id") String employee_id,
					   @Param("opinion") int opinion,
					   @Param("employee_name") String employee_name,
					   @Param("comment") String comment);
	
	
	@Update("UPDATE HRPROJECT.draft_table "
			+ "SET draft_info_idx =  "
			+ "    CASE  "
			+ "        WHEN looker1_opinion = 1 AND looker2_opinion = 1 AND looker3_opinion = 1 THEN 1 "
			+ "        WHEN looker1_opinion = 2 OR looker2_opinion = 2 OR looker3_opinion = 2 THEN 2 "
			+ "        ELSE draft_info_idx  "
			+ "    END "
			+ "WHERE draft_idx = #{draft_idx}")
	void checkOpinion(@Param("draft_idx") int draft_idx);
	
	@Insert("insert into HRPROJECT.employees(employee_name,employee_id,department_name,employee_position,employee_email,"
			+ " employee_password,employee_phone,employee_last_name,employee_first_name,employee_start_date) "
			+ " values (#{employee_name},#{employee_id},#{department_name},#{employee_position},#{employee_email},#{employee_password}, "
			+ "#{employee_phone},#{employee_last_name},#{employee_first_name},sysdate)")
	void addEmployee(UserBean joinBean);
	
	@Select("select department_name,employee_position, employee_name, employee_id from HRPROJECT.employees  where line_name=#{department} "
			+ " order by department_name desc " )
	public List<UserBean> getAllList(String department);

	
}
