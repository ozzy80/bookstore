package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.LetterDao;
import com.beanbook.model.Letter;

@Repository
@Transactional
public class LetterDaoImpl implements LetterDao{

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public void addLetter(Letter letter)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(letter);
		session.flush();
	}
	
	@Override 
	public Letter getLetterByID(Integer ID)
	{
		Session session = sessionFactory.getCurrentSession();
		Letter letter = (Letter) session.get(Letter.class, ID);
		session.flush();
		return letter;
	}
	
	
	@Override 
	public void deleteLetter(Letter letter)
	{
		Session session = sessionFactory.getCurrentSession();
		session.delete(letter);
		session.flush();
	}
	
	@Override
	public void updateLetter(Letter letter)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(letter);
		session.flush();
		
	}
	
	@Override 
	public List<Letter> getAllLetters()
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Letter");
		List<Letter> letterList = query.list();
		session.flush();
		return letterList;
		
	}
}
