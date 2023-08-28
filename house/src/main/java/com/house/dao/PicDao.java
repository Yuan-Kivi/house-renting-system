package com.house.dao;

import com.house.entity.Pic;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PicDao {
    void add(@Param("url")String url,@Param("houseId")int houseId);
    Pic[] queryByHouse(@Param("houseId")int houseId);
}
