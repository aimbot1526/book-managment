package com.example.demo.model;


import java.time.Instant;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@MappedSuperclass
@Data
public abstract class BaseModel {

    @JsonIgnore
    private Instant createdDate;
    @JsonIgnore
    private Instant updatedDate;

    @PrePersist
    protected void onCreate() {
        createdDate = Instant.now();
        updatedDate = Instant.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedDate = Instant.now();
    }


}
