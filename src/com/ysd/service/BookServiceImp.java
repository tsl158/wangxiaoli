package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.BookDao;
import com.ysd.entity.Bookcate;
import com.ysd.entity.Books;
import com.ysd.entity.Fenye;
@Service
public class BookServiceImp  implements BookService{
		@Autowired
		private BookDao bookDao;
		
		
	@Override
	public Fenye<Books> selectAll(Books books) {
		books.setPage((books.getPage()-1)*books.getRows());
		books.setRows(books.getRows());
		Fenye fenye =new Fenye();
		List<Books> rows = bookDao.selectAll(books);
		int total = bookDao.selectAllCount(books);
		fenye.setRows(rows);
		fenye.setTotal(total);
		return fenye;
	}

	@Override
	public int deleteBooks(int bid) {
		return bookDao.deleteBooks(bid);
	}

	@Override
	public int updateBooks(Books books) {
		return bookDao.updateBooks(books);
	}

	@Override
	public int insertBooks(Books books) {
		return bookDao.insertBooks(books);
	}

	@Override
	public List<Bookcate> selectBookcate() {
		return bookDao.selectBookcate();
	}

}
