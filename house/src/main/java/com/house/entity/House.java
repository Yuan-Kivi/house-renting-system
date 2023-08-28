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
public class House {
    Integer houseId;
    Integer userId;
    String username;
    String introduction;
    String loc;
    Double area;
    String furniture;
    String around;
    String pre;
    String houseType;
    String direction;
    String room;
    Double money;
    String address;
    Date pubDate;
    Integer views;
    String status;

    public House(Integer userId, String username, String introduction,String around,String pre,String houseType,String direction,String room,
                 String loc, Double area, String furniture, Double money,String address) {
        this.userId = userId;
        this.username = username;
        this.introduction = introduction;
        this.loc = loc;
        this.area = area;
        this.furniture = furniture;
        this.money = money;
        this.address = address;
        this.around=around;
        this.pre=pre;
        this.houseType=houseType;
        this.direction=direction;
        this.room=room;
    }

}
