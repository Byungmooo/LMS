package com.gd.LMS.statics.servcie;

import com.gd.LMS.statics.mapper.StaticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StaticsService {

    @Autowired
    private StaticsMapper staticsMapper;
    public List<Map<String, String>> getStaticData() { 
    	return staticsMapper.selectStaticData(); 
    	
    }
}
