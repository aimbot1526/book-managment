package com.example.demo.controller;

import com.example.demo.dto.InventoryDto;
import com.example.demo.dto.StoreDto;
import com.example.demo.payload.request.BookRequest;
import com.example.demo.payload.request.InventoryRequest;
import org.springframework.web.bind.annotation.*;

import com.example.demo.service.StoreService;

import lombok.AllArgsConstructor;

import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
@AllArgsConstructor
public class HomeController {

    private final StoreService storeService;

    @GetMapping("/users/{userId}/stores")
    public List<StoreDto> getAllStoresByUserId(@PathVariable Long userId) {

        return storeService.getAllStoresByUserId(userId);

    }

    @GetMapping("/stores/{storeId}/inventory")
    public List<InventoryDto> getBooksByStore(@PathVariable Long storeId) {

        return storeService.getBooksByStore(storeId);
    }

    @PostMapping("/inventory/{bookId}/{storeId}")
    public InventoryDto updateInventory(
            @PathVariable Long bookId, @PathVariable Long storeId,
            @RequestBody InventoryRequest request
    ) {

        return storeService.updateInventory(bookId, storeId,request);
    }

    @PostMapping("/book/add-book")
    public String addBook(@RequestBody BookRequest request) {

        return storeService.addBook(request);
    }

    @DeleteMapping("/book/{bookId}")
    public String deleteByBookId(@PathVariable Long bookId) {

        return storeService.deleteByBookId(bookId);
    }

}
