package com.gd.LMS.statics.controller;

import com.gd.LMS.statics.servcie.StaticsService;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaticsController {

    @Autowired
    private StaticsService staticsService;

    //학년별 차트
    @GetMapping("/member/studentYearChart")
    public String statistics1(Model model) {
    	model.addAttribute("data", new JSONArray(staticsService.getStaticData()));
        return "/statics/studentYearChart";
    }

    //지역별 차트
    @GetMapping("/member/regionChart")
    public String statistics2(Model model) {
    	model.addAttribute("data", new JSONArray(staticsService.getStaticData()));
        return "/statics/regionChart";
    }

    //부서별 차트
    @GetMapping("/member/departmentChart")
    public String statistics3(Model model) {
    	model.addAttribute("data", new JSONArray(staticsService.getStaticData()));
        return "/statics/departmentChart";
    }
}
