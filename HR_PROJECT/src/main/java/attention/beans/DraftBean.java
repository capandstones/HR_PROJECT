package attention.beans;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

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
	private String darft_looker_id1;
	private String darft_looker_id2;
	private String darft_looker_id3;
	
	
	

}
