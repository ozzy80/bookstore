package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Letter;

public interface LetterManager {
	void saveLetter(Letter letter);

	Letter getLetterByID(Integer ID);

	void deleteLetter(Integer id);

	List<Letter> getAllLetters();
}
