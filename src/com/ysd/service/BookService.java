package com.ysd.service;

import java.util.List;

import com.ysd.entity.Bookcate;
import com.ysd.entity.Books;
import com.ysd.entity.Fenye;

public interface BookService {
	List<Bookcate> selectBookcate();
			
	Fenye<Books> selectAll(Books books);

	int deleteBooks(int bid);

	int updateBooks(Books books);

	int insertBooks(Books books);
}
