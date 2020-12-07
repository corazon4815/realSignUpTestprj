package org.example.service;

import org.example.dao.MainDao;
import org.example.model.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MainService {
    @Autowired
    MainDao mainDao;

    public void setMainDao(MainDao mainDao) {
        this.mainDao = mainDao;
    }

    public String memberName() {
        return mainDao.memberName();
    }

    public int LoginChk(Map<String, Object> map) {
        return mainDao.LoginChk(map);
    }

}
