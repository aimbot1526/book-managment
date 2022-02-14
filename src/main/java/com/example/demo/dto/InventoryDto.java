package com.example.demo.dto;

import lombok.Data;

@Data
public class InventoryDto {

    private Long bookCount;

    private Long storeId;

    private BookDto bookDto;
}
