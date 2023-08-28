package com.house.dao;

import com.house.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ComDao {
    void add(@Param("Comment")Comment comment);
    Comment[] getById(@Param("beUserId")int beUserId);

    void delete(@Param("houseId")int houseId);

    Comment[] getAdmin();

    void miss(@Param("cId")int cId);

    Comment getByCId(@Param("cId")int cId);
}
