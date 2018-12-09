package com.oracledp.book.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

public class Admin  implements Serializable {
 private int id;
 @NotNull //name 不能为空
 @Size(min = 2,max = 20)//规定客服端name最少输入2 最对输入20
 private String name;
 @NotNull
 @Size(min = 2,max = 20)
 private String pwd;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
