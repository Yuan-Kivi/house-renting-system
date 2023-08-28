package com.house.dao;

import com.house.entity.Message;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MesDao {
    void add(@Param("message")Message m);

    Message[] getById(@Param("userId")int userId);

    void read(@Param("mId")int mId);
}
