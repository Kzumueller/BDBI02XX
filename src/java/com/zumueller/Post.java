/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller;

/**
 * Data model for posts
 * @author Kevin
 */
public class Post {
    //mapping db attribute names to constants
    public final static String TABLE_NAME = "forum";
    public final static String ID = "Id";
    public final static String RESPONSE_ID = "antwort_id";
    public final static String IS_RESPONSE = "antwort";
    public final static String NAME = "name";
    public final static String EMAIL = "email";
    public final static String TITLE = "titel";
    public final static String CONTENT = "inhalt";
    public final static String TIMESTAMP = "zeit";
    
    private int id = 0;
    private int responseId = 0;
    private boolean response = false;
    private String name = "";
    private String email = "";
    private String title = "";
    private String content = "";
    private String timestamp = "";

    public Post() {}
    
    public Post(int id, int responseId, boolean response, String name, String email, String title, String content, String timestamp) {
        this.id = id;
        this.responseId = responseId;
        this.response = response;
        this.name = name;
        this.email = email;
        this.title = title;
        this.content = content;
        this.timestamp = timestamp;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResponseId() {
        return responseId;
    }

    public void setResponseId(int responseId) {
        this.responseId = responseId;
    }

    public boolean isResponse() {
        return response;
    }

    public void setResponse(boolean response) {
        this.response = response;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
    
    
}
