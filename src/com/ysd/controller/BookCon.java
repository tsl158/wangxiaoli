package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Bookcate;
import com.ysd.entity.Books;
import com.ysd.entity.Fenye;
import com.ysd.service.BookServiceImp;

@Controller
public class BookCon {
	@Autowired
	private BookServiceImp bookServiceImp;
	
	@RequestMapping(value="/select" ,method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Books> selectBooks(Bookcate bookcate, Books books ) {
		books.setBookcate(bookcate);
		Fenye<Books> fenye = bookServiceImp.selectAll(books);
		return fenye;
		
	}
	@RequestMapping(value="/delete" ,method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteBooks(int bid ) {
		return bookServiceImp.deleteBooks(bid);
		
	}
	@RequestMapping(value="/update" ,method=RequestMethod.POST)
	@ResponseBody
	public Integer updateBooks(Bookcate bookcate, Books books ) {
		books.setBookcate(bookcate);
		return bookServiceImp.updateBooks(books);
		
	}
	@RequestMapping(value="/insert" ,method=RequestMethod.POST)
	@ResponseBody
	public Integer insertBooks(Bookcate bookcate, Books books ) {
		books.setBookcate(bookcate);
		return bookServiceImp.insertBooks(books);
		
	}
	@RequestMapping(value="/bc" ,method=RequestMethod.POST)
	@ResponseBody
	public List<Bookcate> select() {
		return bookServiceImp.selectBookcate();
		
	}
	

}
