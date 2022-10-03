package com.gd.LMS.statics.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface StaticsMapper {
    List<Map<String, String>> selectStaticData();
}
