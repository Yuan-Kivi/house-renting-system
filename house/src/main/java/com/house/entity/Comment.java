package com.house.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    Integer cId;
    Integer userId;
    Integer beUserId;
    Integer houseId;
    String cType;
    String message;
    Date cDate;
    int status;

    public Comment(Integer userId, Integer beUserId ,Integer houseId, String cType, String message) {
        this.userId = userId;
        this.beUserId=beUserId;
        this.houseId = houseId;
        this.cType = cType;
        this.message = message;
    }
}
