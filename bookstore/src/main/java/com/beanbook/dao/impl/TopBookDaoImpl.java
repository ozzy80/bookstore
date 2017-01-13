package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.TopBookDao;
import com.beanbook.model.TopBook;

@Repository
@Transactional
public class TopBookDaoImpl implements TopBookDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public TopBook getTopBookById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		TopBook topBook = (TopBook) session.get(TopBook.class, id);
		session.flush();

		return topBook;
	}

	@Override
	public List<TopBook> getAllActiveTopBooks() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select b.book "
				+ "from TopBook b where b.endDate is null order by b.startDate desc");
		query.setMaxResults(10);
		List<TopBook> topBookList = query.list();
		session.flush();

		return topBookList;
	}

	@Override
	public void saveTopBook(TopBook topBook) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(topBook);
		session.flush();
	}

	@Override
	public void deleteTopBook(TopBook topBook) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(topBook);
		session.flush();
	}

}
