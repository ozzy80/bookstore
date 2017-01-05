package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.Publisher;
import com.beanbook.service.PublisherManager;

@Controller
public class PublisherController {
	
	@Autowired
	private PublisherManager publisherManager;
	
	
	@RequestMapping(value = "/publishers")
	public String getAllPublishers(Model model)
	{
		List<Publisher> publisherList = publisherManager.getAllPublishers();
		model.addAttribute("publishers", publisherList);
		return "all_publishers";
	}
	
	
	@RequestMapping(value="/publishers/update/{publisherID}")
	public String updatePublisher(Model model,@PathVariable("publisherID") Integer publisherID)
	{
		Publisher publisher = publisherManager.getPublisherByID(publisherID);
		model.addAttribute("publisher", publisher);
		return "update_publisher";
	}
	
	
	@RequestMapping(value="/publishers/update/new")
	public String updatePublisher(@ModelAttribute("publisher") Publisher publisher)
	{
		publisherManager.updatePublisher(publisher);
		return "redirect:/publishers";
	}
	
	
	@RequestMapping(value="/publishers/add")
	public String addPublisher(Model model)
	{
		model.addAttribute("publisher", new Publisher());
		return "add_publisher";
	}
	
	
	@RequestMapping(value="/publishers/add/new",method = RequestMethod.POST)
	public String addPublisher(@ModelAttribute("publisher") Publisher publisher)
	{
		publisherManager.addPublisher(publisher);
		return "redirect:/publishers";
	}
	
	
	@RequestMapping(value="/publishers/del/{idPublishera}")
	public String deletePublisher(@PathVariable("idPublishera") Integer id_publishera)
	{
		publisherManager.deletePublisher(id_publishera);
		return "redirect:/publishers";
	}
	
	
	@RequestMapping(value = "/publishers/{idPublishera}")
	public String getPublisherByID(Model model, @PathVariable("idPublishera") Integer id_publishera)
	{
		Publisher publisher = publisherManager.getPublisherByID(id_publishera);
		model.addAttribute("publisher", publisher);
		return "index6";
	}
	
	
}
