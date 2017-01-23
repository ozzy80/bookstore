package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Publisher;
import com.beanbook.service.PublisherManager;

@Controller
public class PublisherController {

	@Autowired
	private PublisherManager publisherManager;

	@RequestMapping(value = "/admin/publishers", method = RequestMethod.GET)
	public @ResponseBody List<Publisher> getAllPublishers() {
		List<Publisher> publisherList = publisherManager.getAllPublishers();
		return publisherList;
	}

	@RequestMapping(value = "/admin/publishers", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addPublisher(@RequestBody Publisher publisher) {
		publisherManager.savePublisher(publisher);
	}

	@RequestMapping(value = "/admin/publishers/{id}", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void updatePublisher(@RequestBody Publisher publisher) {
		publisherManager.savePublisher(publisher);
	}

	@RequestMapping(value = "/admin/publishers/{id}", method = RequestMethod.GET)
	public @ResponseBody Publisher getPublisher(@PathVariable("id") Integer id) {
		return publisherManager.getPublisherByID(id);
	}

	@RequestMapping(value = "/admin/publishers/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletePublisher(@PathVariable("id") Integer id) {
		publisherManager.deletePublisher(id);
	}

	@RequestMapping(value = "/publishers/{id}", method = RequestMethod.GET)
	public @ResponseBody Publisher getPublisherByID(@PathVariable("id") Integer id) {
		Publisher publisher = publisherManager.getPublisherByID(id);
		return publisher;
	}

}
