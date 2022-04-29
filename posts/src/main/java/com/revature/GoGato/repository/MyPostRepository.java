package com.revature.GoGato.repository;

import com.revature.GoGato.model.MyPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MyPostRepository extends JpaRepository<MyPost, Integer> { }
