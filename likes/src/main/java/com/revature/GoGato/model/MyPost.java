package com.revature.GoGato.model;

import lombok.Data;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity(name = "posts")

@Data
public class MyPost {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    private String contents;
    private int likes;
    private Timestamp post_time;
    private int userid;
    private int parentid;

    public MyPost(){}

    public int getId() {
        return id;
    }

}
