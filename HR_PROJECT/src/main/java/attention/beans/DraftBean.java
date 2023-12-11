package attention.beans;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class DraftBean {
	
   
	private MultipartFile upload_file;
	
	private int draft_idx;
	
	@NotBlank
	private String draft_subject;
	@NotBlank
	private String draft_text;
	private String draft_file;
	private String draft_writer_id;
	private String draft_date;
	private String draft_hope_date;
	private String draft_looker_id1;
	private String draft_looker_id2;
	private String draft_looker_id3;
	private int draft_info_idx;
	private String draft_writer_name;
	private int looker1_opinion;
	private int looker2_opinion;
	private int looker3_opinion;
	private String looker1_name;
	private String looker2_name;
	private String looker3_name;
	private String looker1_comment;
	private String looker2_comment;
	private String looker3_comment;
	private String department_name;
	private String employee_position;

}
