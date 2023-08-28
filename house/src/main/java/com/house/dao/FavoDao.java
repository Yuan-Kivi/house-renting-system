package com.house.dao;

import com.house.entity.Favorite;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoDao {
    Favorite query(@Param("userId")int userId, @Param("houseId")int houseId);
    void add(@Param("userId")int userId, @Param("houseId")int houseId);
    void del(@Param("userId")int userId, @Param("houseId")int houseId);
}
