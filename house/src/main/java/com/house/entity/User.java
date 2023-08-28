package com.house.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User {
    Integer userId;
    String username;
    String password;
    String avatar;
    Integer userType;
    String typeName;
    String cell;
    String email;
    String status;
}
