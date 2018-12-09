package com.oracledp.book.biz.impl;

import com.oracledp.book.biz.Adminbiz;
import com.oracledp.book.dao.AdminDao;
import com.oracledp.book.dao.impl.AdminDaoimpl;
import com.oracledp.book.model.Admin;

public class Adminbizimpl implements Adminbiz {
    @Override
    public boolean adminbizPadandName(Admin admin) {
   AdminDao adminDao = new AdminDaoimpl();


        return adminDao.adminNamePwd(admin);
    }
}
