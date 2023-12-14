package attention.config;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import attention.beans.UserBean;
import attention.interceptor.CheckLoginInterceptor;
import attention.interceptor.CheckWriterInterceptor;
import attention.mapper.AdminMapper;
import attention.mapper.CalendarMapper;
import attention.mapper.CommuteMapper;
import attention.mapper.EmployeesMapper;
import attention.mapper.NoticeMapper;
import attention.mapper.TeamCalendarMapper;
import attention.mapper.TransferMapper;
import attention.mapper.UserMapper;
import attention.mapper.VacationMapper;
import attention.mapper.WorkFlowMapper;
import attention.service.NoticeService;

@Configuration
@EnableWebMvc // controller
@ComponentScan("attention.service")
@ComponentScan("attention.dao")
@ComponentScan("attention.controller")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private NoticeService noticeService;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view로 보내질 최종 요청응답에 관한 환경설정
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일의 경로를 매핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
		
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);

		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, noticeService);
		
		InterceptorRegistration reg1 = registry.addInterceptor(checkLoginInterceptor);
		
		reg1.addPathPatterns("/main/*", "/calendar/*", "/commute/*", "/member/*", "/notice/*", "/user/logout",
				"/user/modify", "/vacation/*", "/workflow/*");
		reg1.excludePathPatterns("/user/login");
		
		InterceptorRegistration reg3 = registry.addInterceptor(checkWriterInterceptor);
		
		reg3.addPathPatterns("/board/modify", "/board/delete");
	
	}

	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	// 쿼리문과 접속 정보를 관리하는 객체
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<WorkFlowMapper> getWorkFlowMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<WorkFlowMapper> factoryBean = new MapperFactoryBean<WorkFlowMapper>(WorkFlowMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<VacationMapper> getVacationMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<VacationMapper> factoryBean = new MapperFactoryBean<VacationMapper>(VacationMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<EmployeesMapper> getEmployeesMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<EmployeesMapper> factoryBean = new MapperFactoryBean<EmployeesMapper>(EmployeesMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<NoticeMapper> getNoticeMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<NoticeMapper> factoryBean = new MapperFactoryBean<NoticeMapper>(NoticeMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<AdminMapper> getAdminMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<AdminMapper> factoryBean = new MapperFactoryBean<AdminMapper>(AdminMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<CalendarMapper> getCalendarMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<CalendarMapper> factoryBean = new MapperFactoryBean<CalendarMapper>(CalendarMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<TeamCalendarMapper> getTeamCalendarMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<TeamCalendarMapper> factoryBean = new MapperFactoryBean<TeamCalendarMapper>(TeamCalendarMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}


	@Bean
	public MapperFactoryBean<TransferMapper> getTransferMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<TransferMapper> factoryBean = new MapperFactoryBean<TransferMapper>(TransferMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<CommuteMapper> getCommuteMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<CommuteMapper> factoryBean = new MapperFactoryBean<CommuteMapper>(CommuteMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	// ======================================================================
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}

	// 소스와 메세지 별도관리하도록 등록
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean // multipart와 valid를 합꼐 읽 수 있도록 Bean 선언
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver(); // 객체 생성하여 반환
	}

}