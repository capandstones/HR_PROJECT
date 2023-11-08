CREATE TABLE "employees" (
	"employee_id"	number		NOT NULL,
	"department_number"	number		NOT NULL,
	"employee_position"	varchar2(10)		NULL,
	"employee_name"	varchar2(20)		NULL,
	"employee_email"	varchar2(20)		NULL,
	"employee_password"	varchar2(20)		NULL,
	"employee_salary_pertime"	number		NULL,
	"employee_start_date"	date		NULL,
	"employee_RRN"	varchar2(100)		NULL,
	"employee_end_date"	date		NULL,
	"employee_phone"	varchar2(20)		NULL,
	"employee_address"	varchar2(100)		NULL,
	"employee_salary_account"	varchar2(20)		NULL,
	"employee_self_introduction"	nvarchar2(300)		NULL,
	"employee_status"	varchar2(20)		NULL,
	"employee_last_name"	varchar2(20)		NULL,
	"employee_first_name"	varchar2(20)		NULL,
	"employee_profile_color"	varchar2(20)		NULL
);

CREATE TABLE "department_mapping" (
	"department_head_id"	number		NOT NULL,
	"department_number"	number		NOT NULL
);

CREATE TABLE "department" (
	"department_number"	number		NOT NULL,
	"department_head_id"	number		NOT NULL
);

CREATE TABLE "vacation_Application" (
	"VA_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"type"	nvarchar2(15)		NOT NULL,
	"Calendar_number"	number		NOT NULL,
	"vacation_start_date"	date		NULL,
	"vacation_end_date"	date		NULL,
	"vacation_days"	number		NULL,
	"vacation_reason"	varchar2(100)		NULL,
	"filename"	varchar2(20)		NULL,
	"upload_filename"	varchar2(200)		NULL,
	"file_size"	number		NULL,
	"vacation_status"	number		NULL
);

CREATE TABLE "vacation" (
	"type"	nvarchar2(15)		NOT NULL,
	"vacation_name"	nvarchar2(10)		NULL,
	"given_days_check"	number		NULL,
	"given_days"	number		NULL,
	"Emoji"	varchar2(20)		NULL,
	"vac_info1"	varchar2(20)		NULL,
	"vac_info2"	varchar2(20)		NULL,
	"vac_info3"	varchar2(20)		NULL
);

CREATE TABLE "Calendar_table" (
	"Calendar_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"cal_start_date"	date		NULL,
	"cal_end_date"	date		NULL,
	"cal_title"	nvarchar2(30)		NULL,
	"cal_story"	nvarchar2(300)		NULL,
	"cal_color"	varchar2(20)		NULL,
	"cal_category"	varchar2(20)		NULL,
	"writer_dept_num"	number		NULL,
	"cal_commoner"	number		NULL
);

CREATE TABLE "attach_file_table" (
	"attach_file_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"attach_file_type"	varchar2(20)		NULL,
	"filename"	varchar2(100)		NULL,
	"upload_filename"	varchar2(200)		NULL
);

CREATE TABLE "salary_table" (
	"salary_month"	date		NOT NULL,
	"employee_id"	number		NOT NULL,
	"salary"	number		NULL,
	"extra_salary"	number		NULL
);

CREATE TABLE "commute_table" (
	"commute_time"	date		NOT NULL,
	"employee_id"	number		NOT NULL,
	"work_hour"	number		NULL,
	"leave_time"	date		NULL,
	"extra_work_time"	number		NULL
);

CREATE TABLE "draft_table" (
	"Document_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"draft_title"	varchar2(20)		NULL,
	"draft_content"	varchar2(100)		NULL,
	"hope_end_date"	date		NULL,
	"icon"	varchar2(20)		NULL,
	"write_date"	date		NULL,
	"filename"	varchar2(100)		NULL,
	"upload_filename"	varchar2(200)		NULL,
	"file_size"	number		NULL
);
drop table "history";
CREATE TABLE "history" (
	"Document_number"	number		NOT NULL,
	"employee_name"	nvarchar2(10)		NULL,
	"contents"	nvarchar2(100)		NULL,
	"sign_history_date"	date		NULL
);

CREATE TABLE "Messenger" (
	"messenger_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"messenger_group_number"	number		NULL,
	"original_messenger_number"	number		NULL,
	"title"	varchar2(20)		NULL,
	"contents"	varchar2(100)		NULL,
	"did_read"	number		NULL,
	"did_attach"	number		NULL,
	"write_date"	date		NULL,
	"messenger_number2"	number		NOT NULL,
	"employee_id2"	number		NOT NULL
);

CREATE TABLE "notice_table" (
	"notice_number"	number		NOT NULL,
	"admin_num"	number		NOT NULL,
	"notice_level"	number		NULL,
	"write_date"	date		NULL,
	"notice_title"	varchar2(100)		NULL,
	"notice_contents"	clob		NULL,
	"notice_view"	number		NULL,
	"comments_view"	number		NULL,
	"notice_status"	number		NULL,
	"attach_file_name"	varchar2(100)		NULL,
	"original_attach_file_name"	varchar2(100)		NULL,
	"attach_file_size"	number		NULL,
	"attach_file_number"	number		NULL
);
drop table "notice_comments_table";
CREATE TABLE "notice_comments_table" (
	"comments_number"	number		NOT NULL,
	"notice_number"	number		NOT NULL,
	"comments_contents"	nvarchar2(300)		NULL,
	"comments_date"	date		NULL
);

CREATE TABLE "leave table" (
	"leave_history_number"	number		NOT NULL,
	"employee_id"	number		NOT NULL,
	"leave_genre"	nvarchar2(30)		NULL,
	"leave_start_date"	date		NULL,
	"leave_end_date"	date		NULL,
	"memo"	nvarchar2(300)		NULL
);

CREATE TABLE "messenger_attach_table" (
	"attach_file_number"	number		NOT NULL,
	"messenger_number"	number		NOT NULL,
	"messenger_group_number"	number		NULL,
	"original_attach_file_name"	varchar2(100)		NULL,
	"tomcat_file_name"	number		NULL
);

CREATE TABLE "news_table" (
	"news_number"	number		NOT NULL,
	"admin_num"	number		NOT NULL,
	"url1"	number		NULL,
	"url2"	number		NULL,
	"news_contents"	nvarchar2(300)		NULL,
	"news_Emoji"	number		NULL,
	"did_read"	number		NULL,
	"news_date"	date		NULL
);
drop table "sign";
CREATE TABLE "sign" (
	"sign_number"	number		NOT NULL,
	"Document_number"	number		NOT NULL,
	"sign_level"	number		NULL,
	"sign_status"	number		NULL,
	"sign_date"	date		NULL,
	"did_sign"	number		NULL
);

CREATE TABLE "personal_transfer_record" (
	"PTR_number"	number		NOT NULL,
	"admin_num"	number		NOT NULL,
	"memo"	nvarchar2(300)		NULL,
	"transfer_date"	date		NULL,
	"transfer_label"	nvarchar2(30)		NULL,
	"befor_position"	nvarchar2(30)		NULL,
	"befor_ddepartment_number"	number		NULL
);

drop table "vacation history";
CREATE TABLE "vacation history" (
	"vacation_history_number"	number		NULL,
	"admin_num"	number		NOT NULL,
	"relevant_year"	varchar2(20)		NULL,
	"dayoff"	number		NULL,
	"half_dayoff"	number		NULL,
	"condolence"	number		NULL,
	"sick"	number		NULL,
	"summer_vacation"	number		NULL,
	"marriage"	number		NULL,
	"emergency"	number		NULL,
	"ect"	number		NULL
);

CREATE TABLE "admin" (
	"admin_num"	number		NOT NULL,
	"admin_id"	varchar2(30)		NULL,
	"admin_password"	varchar2(30)		NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "PK_EMPLOYEES" PRIMARY KEY (
	"employee_id"

);



ALTER TABLE "department" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
	"department_number"
);

ALTER TABLE "vacation_Application" ADD CONSTRAINT "PK_VACATION_APPLICATION" PRIMARY KEY (
	"VA_number"

);

ALTER TABLE "vacation" ADD CONSTRAINT "PK_VACATION" PRIMARY KEY (
	"type"
);

ALTER TABLE "Calendar_table" ADD CONSTRAINT "PK_CALENDAR_TABLE" PRIMARY KEY (
	"Calendar_number"

);

ALTER TABLE "attach_file_table" ADD CONSTRAINT "PK_ATTACH_FILE_TABLE" PRIMARY KEY (
	"attach_file_number"

);

ALTER TABLE "salary_table" ADD CONSTRAINT "PK_SALARY_TABLE" PRIMARY KEY (
	"salary_month"
);

ALTER TABLE "commute_table" ADD CONSTRAINT "PK_COMMUTE_TABLE" PRIMARY KEY (
	"commute_time"
);

ALTER TABLE "draft_table" ADD CONSTRAINT "PK_DRAFT_TABLE" PRIMARY KEY (
	"Document_number"
);

ALTER TABLE "history" ADD CONSTRAINT "PK_HISTORY" PRIMARY KEY (
	"Document_number"
);

ALTER TABLE "Messenger" ADD CONSTRAINT "PK_MESSENGER" PRIMARY KEY (
	"messenger_number"
);

ALTER TABLE "notice_table" ADD CONSTRAINT "PK_NOTICE_TABLE" PRIMARY KEY (
	"notice_number"
);

ALTER TABLE "notice_comments_table" ADD CONSTRAINT "PK_NOTICE_COMMENTS_TABLE" PRIMARY KEY (
	"comments_number"
);

ALTER TABLE "leave table" ADD CONSTRAINT "PK_LEAVE TABLE" PRIMARY KEY (
	"leave_history_number"
);

ALTER TABLE "messenger_attach_table" ADD CONSTRAINT "PK_MESSENGER_ATTACH_TABLE" PRIMARY KEY (
	"attach_file_number"
);

ALTER TABLE "news_table" ADD CONSTRAINT "PK_NEWS_TABLE" PRIMARY KEY (
	"news_number"
);

ALTER TABLE "sign" ADD CONSTRAINT "PK_SIGN" PRIMARY KEY (
	"sign_number"
);

ALTER TABLE "personal_transfer_record" ADD CONSTRAINT "PK_PERSONAL_TRANSFER_RECORD" PRIMARY KEY (
	"PTR_number"
);

ALTER TABLE "vacation history" ADD CONSTRAINT "PK_VACATION HISTORY" PRIMARY KEY (
		"vacation_history_number"
);

ALTER TABLE "admin" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"admin_num"
);

ALTER TABLE "employees" ADD CONSTRAINT "FK_department_TO_employees_1" FOREIGN KEY (
	"department_number"
)
REFERENCES "department" (
	"department_number"
);

ALTER TABLE "department_mapping" ADD CONSTRAINT "FK_employees_TO_department_mapping_1" FOREIGN KEY (
	"department_head_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "department_mapping" ADD CONSTRAINT "FK_department_TO_department_mapping_1" FOREIGN KEY (
	"department_number"
)
REFERENCES "department" (
	"department_number"
);

ALTER TABLE "department" ADD CONSTRAINT "FK_employees_TO_department_1" FOREIGN KEY (
	"department_head_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "vacation_Application" ADD CONSTRAINT "FK_employees_TO_vacation_Application_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "vacation_Application" ADD CONSTRAINT "FK_vacation_TO_vacation_Application_1" FOREIGN KEY (
	"type"
)
REFERENCES "vacation" (
	"type"
);

ALTER TABLE "vacation_Application" ADD CONSTRAINT "FK_Calendar_table_TO_vacation_Application_1" FOREIGN KEY (
	"Calendar_number"
)
REFERENCES "Calendar_table" (
	"Calendar_number"
);

ALTER TABLE "Calendar_table" ADD CONSTRAINT "FK_employees_TO_Calendar_table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "attach_file_table" ADD CONSTRAINT "FK_employees_TO_attach_file_table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "salary_table" ADD CONSTRAINT "FK_employees_TO_salary_table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "commute_table" ADD CONSTRAINT "FK_employees_TO_commute_table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "draft_table" ADD CONSTRAINT "FK_employees_TO_draft_table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "history" ADD CONSTRAINT "FK_draft_table_TO_history_1" FOREIGN KEY (
	"Document_number"
)
REFERENCES "draft_table" (
	"Document_number"
);

ALTER TABLE "history" ADD CONSTRAINT "FK_draft_table_TO_history_2" FOREIGN KEY (
	"Document_number"
)
REFERENCES "draft_table" (
	"Document_number"
);

ALTER TABLE "Messenger" ADD CONSTRAINT "FK_employees_TO_Messenger_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "notice_table" ADD CONSTRAINT "FK_admin_TO_notice_table_1" FOREIGN KEY (
	"admin_num"
)
REFERENCES "admin" (
	"admin_num"
);

ALTER TABLE "notice_comments_table" ADD CONSTRAINT "FK_notice_table_TO_notice_comments_table_1" FOREIGN KEY (
	"notice_number"
)
REFERENCES "notice_table" (
	"notice_number"
);

ALTER TABLE "notice_comments_table" ADD CONSTRAINT "FK_notice_table_TO_notice_comments_table_2" FOREIGN KEY (
	"notice_number"
)
REFERENCES "notice_table" (
	"notice_number"
);

ALTER TABLE "leave table" ADD CONSTRAINT "FK_employees_TO_leave table_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "messenger_attach_table" ADD CONSTRAINT "FK_Messenger_TO_messenger_attach_table_1" FOREIGN KEY (
	"messenger_number"
)
REFERENCES "Messenger" (
	"messenger_number"
);

ALTER TABLE "news_table" ADD CONSTRAINT "FK_admin_TO_news_table_1" FOREIGN KEY (
	"admin_num"
)
REFERENCES "admin" (
	"admin_num"
);

ALTER TABLE "sign" ADD CONSTRAINT "FK_employees_TO_sign_1" FOREIGN KEY (
	"employee_id"
)
REFERENCES "employees" (
	"employee_id"
);

ALTER TABLE "sign" ADD CONSTRAINT "FK_draft_table_TO_sign_1" FOREIGN KEY (
	"Document_number"
)
REFERENCES "draft_table" (
	"Document_number"
);

ALTER TABLE "sign" ADD CONSTRAINT "FK_draft_table_TO_sign_2" FOREIGN KEY (
	"Document_number"
)
REFERENCES "draft_table" (
	"Document_number"
);

ALTER TABLE "personal_transfer_record" ADD CONSTRAINT "FK_admin_TO_personal_transfer_record_1" FOREIGN KEY (
	"admin_num"
)
REFERENCES "admin" (
	"admin_num"
);

ALTER TABLE "vacation history" ADD CONSTRAINT "FK_admin_TO_vacation history_1" FOREIGN KEY (
	"admin_num"
)
REFERENCES "admin" (
	"admin_num"
);

