package thanhphuc.asmjava5.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import thanhphuc.asmjava5.interceptor.SecurityInterceptor;





@Configuration
public class InterConfig implements WebMvcConfigurer{
	
	@Autowired
	SecurityInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
			.addPathPatterns("/homeadmin/**"
//							,"/user/***"
//							,"/product/***"
//							,"/category/***"
//							,"/brand/***"
//							,"/order/***"
							,"/admin/**"
							)
			.excludePathPatterns("/formlogin", "/home");
	}
}