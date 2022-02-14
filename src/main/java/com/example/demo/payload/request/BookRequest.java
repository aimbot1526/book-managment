package com.example.demo.payload.request;

import lombok.Data;

@Data
public class BookRequest {

    private String name;

    private Long noOfPages;
}
