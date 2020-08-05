package sepp.TiendaWeb.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/*Clase que permite la recuperacion de archivos---*/
@Configuration
@AutoConfigureAfter(DispatcherServletAutoConfiguration.class)
public class CustomWebMvcAutoConfig implements WebMvcConfigurer{
	
	
	@Value("${upload.path}")
	public String uploadDir;
	
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");

        return resolver;
    }
    
	
    
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    String myExternalFilePath = "file:"+uploadDir+"/";
	    registry.addResourceHandler("/pic/**").addResourceLocations(myExternalFilePath);
		
		registry.addResourceHandler("/pdfs/**")
        .addResourceLocations("/WEB-INF/pdfs/");

		registry.addResourceHandler("/css/**")
        .addResourceLocations("/WEB-INF/css/");

		registry.addResourceHandler("/js/**")
        .addResourceLocations("/WEB-INF/js/");
}
}
