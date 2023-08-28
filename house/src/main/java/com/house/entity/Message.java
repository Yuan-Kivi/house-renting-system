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
public class Message {
    Integer mId;
    Integer userId;
    Integer houseId;
    String intro;
    String mess;
    Date mDate;
    Integer status;

    public Message(Integer userId, Integer houseId, String intro, String mess) {
        this.userId = userId;
        this.houseId = houseId;
        this.intro = intro;
        this.mess = mess;
    }
}
