package com.revature.GoGato.service;

import com.revature.GoGato.model.MyPost;
import com.revature.GoGato.repository.MyPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Service
public class MyPostService {

    @Autowired
    MyPostRepository myPostRepository;

    public List<MyPost> getAllPosts(){
        return myPostRepository.findAll();
    }

    public MyPost findPostById(Integer id){

        return myPostRepository.findById(id).orElse(new MyPost());
    }

    //post

    public void updatePost(MyPost mypost){ myPostRepository.save(mypost); }

    public void deletePost(MyPost mypost){ myPostRepository.deleteById(mypost.getId()); }
}
