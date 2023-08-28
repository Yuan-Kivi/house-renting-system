package com.house.dao;

import com.house.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    User login(@Param("username")String username, @Param("password")String password);

    User queryById(@Param("userId")int userId);

    void register(@Param("username")String username,@Param("password")String password,
                  @Param("cell")String cell,@Param("email")String email,
                 @Param("avatar")String avatar,@Param("userType")int userType,
                 @Param("typeName")String typeName);

    void changePass(@Param("value")String value,@Param("userId")int userId);
    void changeCell(@Param("value")String value,@Param("userId")int userId);
    void changeEmail(@Param("value")String value,@Param("userId")int userId);

    void FOJ(@Param("userId")int userId,@Param("sta")String sta);

    User[] getAll();
}
