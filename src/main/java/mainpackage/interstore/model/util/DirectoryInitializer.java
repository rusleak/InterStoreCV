package mainpackage.interstore.model.util;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


import java.io.File;

@Component
public class DirectoryInitializer {

    @Value("${pictures.product}")
    private String productPicturesPath;

    @Value("${pictures.mainCategory}")
    private String mainCategoryPicturesPath;

    @Value("${pictures.colors}")
    private String colorsPicturesPath;

    @PostConstruct
    public void init() {
        createDirectoryIfNotExists(productPicturesPath);
        createDirectoryIfNotExists(mainCategoryPicturesPath);
        createDirectoryIfNotExists(colorsPicturesPath);
    }

    private void createDirectoryIfNotExists(String path) {
        File directory = new File(path);
        if (!directory.exists()) {
            boolean created = directory.mkdirs();
            if (created) {
                System.out.println("Создана папка: " + path);
            } else {
                System.out.println("Не удалось создать папку: " + path);
            }
        } else {
            System.out.println("Папка уже существует: " + path);
        }
    }
}
