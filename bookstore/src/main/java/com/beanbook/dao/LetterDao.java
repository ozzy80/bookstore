package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Letter;

public interface LetterDao {

	void saveLetter(Letter letter);

	Letter getLetterByID(Integer ID);

	void deleteLetter(Letter letter);

	List<Letter> getAllLetters();
}
