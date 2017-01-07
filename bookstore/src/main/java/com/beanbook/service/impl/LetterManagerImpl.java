package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.LetterDao;
import com.beanbook.model.Letter;
import com.beanbook.service.LetterManager;

@Service
public class LetterManagerImpl implements LetterManager {

	@Autowired
	private LetterDao letterDao;

	@Override
	public void saveLetter(Letter letter) {
		letterDao.saveLetter(letter);
	}

	@Override
	public void deleteLetter(Integer id) {
		letterDao.deleteLetter(letterDao.getLetterByID(id));
	}

	@Override
	public Letter getLetterByID(Integer id) {
		return letterDao.getLetterByID(id);
	}

	@Override
	public List<Letter> getAllLetters() {
		return letterDao.getAllLetters();
	}

}
