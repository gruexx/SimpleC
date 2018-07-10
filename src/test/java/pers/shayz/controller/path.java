package pers.shayz.controller;

import org.junit.Test;

import java.util.Objects;

public class path {

    @Test
    public void test1(){
        System.out.println(path.class.getResource("/src/main/UserImage"));
        System.out.println(Thread.currentThread().getContextClassLoader().getResource(""));
    }
}
