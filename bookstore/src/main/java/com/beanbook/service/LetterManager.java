package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Letter;

public interface LetterManager {
	void addLetter(Letter letter);
	
	Letter getLetterByID(Integer ID);
	
	void deleteLetter(Integer id);
	
	List<Letter> getAllLetters();
	
	void updateLetter(Letter letter);
}
