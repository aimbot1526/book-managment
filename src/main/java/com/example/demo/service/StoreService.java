package com.example.demo.service;

import com.example.demo.dto.InventoryDto;
import com.example.demo.dto.StoreDto;
import com.example.demo.model.Book;
import com.example.demo.model.Inventory;
import com.example.demo.model.UserStore;
import com.example.demo.payload.request.BookRequest;
import com.example.demo.payload.request.InventoryRequest;
import com.example.demo.repository.BookRepository;
import com.example.demo.repository.InventoryRepository;
import com.example.demo.repository.UserStoreRepository;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class StoreService {

    private final UserStoreRepository userStoreRepository;

    private final InventoryRepository inventoryRepository;

    private final BookRepository bookRepository;

    private final ModelMapper mapper;

    public List<StoreDto> getAllStoresByUserId(Long userId) {

        List<UserStore> stores = userStoreRepository.findByUserId(userId);

        return mapList(stores, StoreDto.class);
    }

    public List<InventoryDto> getBooksByStore(Long storeId) {

        List<Inventory> inventory = inventoryRepository.findByStoreId(storeId);

        return mapList(inventory, InventoryDto.class);
    }

    public InventoryDto updateInventory(Long bookId, Long storeId,InventoryRequest request) {

        Inventory inventory = inventoryRepository.findByBookIdAndStoreId(bookId, storeId)
                .orElseThrow(() -> new RuntimeException("Book not found with id :" + bookId));

        inventory.setBookCount(request.getBookCount());

        Inventory updatedInventory = inventoryRepository.save(inventory);

        return mapper.map(updatedInventory, InventoryDto.class);
    }

    public String addBook(BookRequest request) {

        Optional<Book> checkExisting = bookRepository.findByName(request.getName());

        if (checkExisting.isEmpty()) {

            Book book = new Book();

            book.setName(request.getName());
            book.setNoOfPages(request.getNoOfPages());

            bookRepository.save(book);

            return "Book added Successfully";
        }

        return "Book Already exists";
    }

    public String deleteByBookId(Long bookId) {

        Book book = bookRepository.findById(bookId)
                .orElseThrow(() -> new RuntimeException("No book found with id: " + bookId));

        bookRepository.deleteById(book.getId());

        return "Book deleted Successfully";

    }

    <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        return source
                .stream()
                .map(element -> mapper.map(element, targetClass))
                .collect(Collectors.toList());
    }

}
