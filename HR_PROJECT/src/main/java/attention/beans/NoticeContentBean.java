package attention.beans;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeContentBean {
	
	private int content_idx;
	
	@NotBlank
	private String content_subject;
	@NotBlank
	private String content_text;
	
	private String content_writer_name;
	private String content_file;
	private String content_writer_id;
	private int content_board_idx;
	private String content_date;
	
	private MultipartFile upload_file;
}
