package com.billboard.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.billboard.demo.dao.BillboardDao;
import com.billboard.demo.model.Billboard;
import com.billboard.demo.service.BillboardService;
@Service
public class BillboardServiceImpl implements BillboardService {

	@Autowired
	private BillboardDao BDao;
	
	@Override
	public List<Billboard> findAll() {
		List<Billboard> board = BDao.findAll(); 
		return board;
	}

	@Override
	public Billboard find(Integer Id) {
		Optional<Billboard> board = BDao.findById(Id);
		return board.get();
	}

	@Override
	public Billboard create(Billboard billboard) {
		return BDao.save(billboard);
	}

	@Override
	public void delete(Integer Id) {
		BDao.deleteById(Id);
	}

}
