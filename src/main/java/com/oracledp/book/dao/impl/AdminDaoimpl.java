package com.oracledp.book.dao.impl;

import com.oracledp.book.dao.AdminDao;
import com.oracledp.book.model.Admin;
import com.oracledp.book.model.Small;
import com.oracledp.book.util.DBUtil;
import com.oracledp.book.util.MD5Utils;


import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoimpl implements AdminDao {
    @Override
    public boolean adminNamePwd(Admin admin) {
        Connection conn = null;
        PreparedStatement stmt= null;
        ResultSet rs =null;


        try {
            conn = DBUtil.getConnection();
//            String sql = "select  * from t_admin where name=? and pwd=? ";
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1,admin.getName());
//            stmt.setString(2, MD5Utils.MD5Encode(admin.getPwd(),"utf-8"));
//            rs=stmt.executeQuery();

            String sql =  "select  pwd  from t_admin where name=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());
            rs=stmt.executeQuery();

            if (rs.next()) {
                //获得盐的密码 再进行队数据库的和用输入的密码进行验证
                String  dbPasswd = rs.getString(1);

                try {
                    //用户输入的密码在加上加盐，去数据库对比，成功就登陆 else 失败继续登陆
                    return MD5Utils.validPasswd(admin.getPwd(),dbPasswd);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {

            DBUtil.free(rs, stmt, conn);

        }

        return false;
    }
}
