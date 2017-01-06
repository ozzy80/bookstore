package com.beanbook.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.dao.BookDao;
import com.beanbook.dao.CartDao;
import com.beanbook.model.Book;
import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;

@Controller
@RequestMapping("/rest/cart")
public class CartController {
	
	@Autowired
	public BookDao bookDao;
	
	@Autowired
	public CartDao cartDao;
	
	@RequestMapping(method = RequestMethod.GET, value="/{cartId}")
	public @ResponseBody Cart read(@PathVariable(value="cartId") String cartId){
		return cartDao.read(cartId);
	}
	
	@RequestMapping(method = RequestMethod.PUT, value="/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void update(@PathVariable(value="cartId") String cartId, @RequestBody Cart cart){
		cartDao.update(cartId, cart);
	}
	
	@RequestMapping(method = RequestMethod.DELETE, value="/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void delete(@PathVariable(value="cartId") String cartId){
		cartDao.delete(cartId);
	}

/*	@RequestMapping(method = RequestMethod.PUT, value="/add/{isbn}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void update(@PathVariable(value="isbn") Long isbn, HttpServletRequest request){
		String sessionID = request.getSession(true).getId();
		Cart cart = cartDao.read(sessionID);
		
		if(cart == null){
			cart = cartDao.create(new Cart(sessionID));
		}
		
		Book book = bookDao.getBookByISBN(isbn);
		if(book == null){
			throw new IllegalArgumentException(new Exception());
		}
		cart.addCartItem(new CartItem(book));
		cartDao.update(sessionID, cart);

	}
	
	@RequestMapping(method = RequestMethod.PUT, value="/remove/{isbn}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void remove(@PathVariable(value="isbn") Long isbn, HttpServletRequest request){
		String sessionID = request.getSession(true).getId();
		Cart cart = cartDao.read(sessionID);
		
		if(cart == null){
			cart = cartDao.create(new Cart(sessionID));
		}
		
		Book book = bookDao.getBookByISBN(isbn);
		if(book == null){
			throw new IllegalArgumentException(new Exception());
		}
		cart.removeCartItem(new CartItem(book));
		cartDao.update(sessionID, cart);
	}*/
	
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value=HttpStatus.BAD_REQUEST, reason="Ilegal argument")
	public void handleClientError(Exception e){}

	@ExceptionHandler(Exception.class)
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR, reason="Internal Server error")
	public void handleServerError(Exception e){}	
}
