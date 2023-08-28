package com.house.dao;

import com.house.entity.House;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface HouseDao {
//    int add(@Param("userId")int userId,@Param("username")String username,
//             @Param("introduction")String introduction,@Param("loc")String loc,
//             @Param("area")double area,@Param("money")double money,
//             @Param("furniture")String furniture,@Param("address")String address);
    void add(@Param("house") House house);
    House[] getPage(@Param("houseType")String type);
    House[] getLike(@Param("userId")int userId);
    House queryById(@Param("houseId")int houseId);
    House[] search(@Param("address") String address,@Param("houseType") String houseType,
                   @Param("min") int min, @Param("max") int max,
                   @Param("min1") int min1, @Param("max1") int max1,
                   @Param("key") String key);
    House[] searchByArea(@Param("address") String address,@Param("houseType") String houseType,
                   @Param("min") int min, @Param("max") int max,
                   @Param("min1") int min1, @Param("max1") int max1,
                   @Param("key") String key);
    House[] searchByPrice(@Param("address") String address,@Param("houseType") String houseType,
                         @Param("min") int min, @Param("max") int max,
                         @Param("min1") int min1, @Param("max1") int max1,
                         @Param("key") String key);
    void see(@Param("houseId")int houseId);
    void delete(@Param("houseId")int houseId);
    House[] getUsersAll(@Param("userId") int userId);
    House[] getPassing();
    void Opr(@Param("houseId")int houseId,@Param("op") String op);
}
