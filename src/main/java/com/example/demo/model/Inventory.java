package com.example.demo.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class Inventory extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Long bookCount;
    
    private Long storeId;

    @OneToOne(fetch = FetchType.LAZY)
    private Book book;
}
