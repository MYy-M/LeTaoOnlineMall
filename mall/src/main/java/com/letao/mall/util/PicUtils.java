package com.letao.mall.util;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Encoder;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

@Service
public class PicUtils {
    public String encrypt(String imageUrl) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(imageUrl);
        byte[] b = new byte[1024];
        int len = -1;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        while ((len = fileInputStream.read(b)) != -1) {
            bos.write(b, 0, len);
        }
        byte[] fileByte = bos.toByteArray();
        //进行base64位加密
        BASE64Encoder encoder = new BASE64Encoder();
        String data = encoder.encode(fileByte);
        return data;
    }
}
