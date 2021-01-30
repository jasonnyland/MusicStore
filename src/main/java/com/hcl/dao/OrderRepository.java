package com.hcl.dao;

import org.springframework.data.repository.CrudRepository;

import com.hcl.model.Order;

public interface OrderRepository extends CrudRepository<Order, Long>{}
