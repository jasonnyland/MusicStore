package com.hcl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.hcl.model.Product;

public interface ProductRepository extends CrudRepository<Product, Long> {
	
	@Query("SELECT p FROM Product p WHERE CONCAT(p.prodName, p.prodDesc, p.prodCat) LIKE %?1%")
	public List<Product> search(String keyword);
}
