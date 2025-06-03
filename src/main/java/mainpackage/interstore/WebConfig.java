package mainpackage.interstore;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${pictures.product}")
    private String productImagePath;

    @Value("${pictures.colors}")
    private String colorImagePath;

    @Value("${pictures.mainCategory}")
    private String mainCategoryImagePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/product_images/**")
                .addResourceLocations("file:" + productImagePath + "/");

        registry.addResourceHandler("/color_images/**")
                .addResourceLocations("file:" + colorImagePath + "/");

        registry.addResourceHandler("/main_category_images/**")
                .addResourceLocations("file:" + mainCategoryImagePath + "/");
    }
}