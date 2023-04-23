package com.billboard.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.billboard.demo.model.Billboard;

public interface BillboardDao extends JpaRepository<Billboard, Integer> {
	
}
