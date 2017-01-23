package com.beanbook.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	private Path bookPath;

	public void uploadPicture(MultipartFile bookImage, String imageName, String imagePath) {
		bookPath = Paths.get(imagePath + "\\" + imageName);

		if (!new File(imagePath).exists()) {
			new File(imagePath).mkdir();
		}

		if (bookImage != null && !bookImage.isEmpty()) {
			try {
				bookImage.transferTo(new File(bookPath.toString()));
			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException("Book image saving failed", e);
			}
		}
	}

	public void deletePicture(String imageName, String imagePath) {
		bookPath = Paths.get(imagePath + "\\" + imageName);

		if (Files.exists(bookPath)) {
			try {
				Files.delete(bookPath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
