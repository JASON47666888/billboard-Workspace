package com.billboard.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.billboard.demo.model.Billboard;

@Service
public interface BillboardService {
	
	public List<Billboard> findAll();
	
	public Billboard find(Integer Id);
	
	public Billboard create (Billboard billboard);
	
	public void delete(Integer Id);
	
	
}
