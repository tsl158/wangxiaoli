package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Bookcate;
import com.ysd.entity.Books;

public interface BookDao {
	
	List<Bookcate> selectBookcate();

	List<Books> selectAll(Books books);

	int selectAllCount(Books books);

	int deleteBooks(int bid);

	int updateBooks(Books books);

	int insertBooks(Books books);
}
