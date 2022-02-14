package com.example.demo.repository;

import com.example.demo.model.UserStore;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@EnableJpaRepositories
public interface UserStoreRepository extends JpaRepository<UserStore, Long>{

    List<UserStore> findByUserId(Long userId);

}