package com.beanbook.dao.hibernate;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.beanbook.dao.BookDao;
import com.beanbook.model.Book;
import com.beanbook.model.Publisher;

public class BookDaoHibernate implements BookDao{

	private List<Book> books;
	
	@Override
	public List<Book> getAllBooks() {
		Publisher p = new Publisher();
		p.setId(1);
		p.setName("Laguna");
		p.setCity("Beograd");
		p.setAdress("Resavska 33");
		p.setState("Srbija");
		Book b1 = new Book();
		b1.setIsbn(9788652124169l);
		b1.setTitle("Šangajska princeza");
		b1.setBooksInStock(15);
		b1.setFormat("13x20 cm");
		b1.setNumberOfPages(407);
		b1.setPublicationYear(new Date(2016, 10, 22));
		b1.setPrice(899.00);
		b1.setPublisher(p);

		Book b2 = new Book();
		b2.setIsbn(9788652123896l);
		b2.setTitle("Putovanje u Mali Dribling");
		b2.setBooksInStock(1);
		b2.setFormat("13x20 cm");
		b2.setNumberOfPages(448);
		b2.setPublicationYear(new Date(2016, 9, 10));
		b2.setPrice(719.28);
		b2.setPublisher(p);		
		
		books = new ArrayList<>();
		books.add(b1);
		books.add(b2);
		
		return books;
	}

	
}
