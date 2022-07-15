package com.letao.mall.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class UploadPic {
    @Value("${picRoot}")
    private String picRoot;

    public String upPic(MultipartFile file) throws IOException {
        if (file.equals("")){
            return null;
        }
        //获取当前系统时间年月这里获取到月如果要精确到日修改("yyyy-MM-dd")
        String dateForm = new SimpleDateFormat("yyyy-MM").format(new Date());

        String casePath = picRoot+dateForm;
        //获取图片后缀
        String imgFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        //这里我们加入了验证图片类型 这需要自己手动写 声明点这只是非常简单的验证
        //删除不影响程序运行
        /***************************************************/
          /*  ImgRegulation regulation = new ImgRegulation();
            try{ boolean ifimg = regulation.VERIFY(imgFormat);
                if (false==ifimg){ return; }
            }catch (Exception e){ return; }*/
        /****************************************************/
        //判断文件是否存在
        /*************************************************/
        File f = new File(casePath);
        try {if (!f.exists()){f.mkdirs();}
        }catch (Exception e){  }
        /*************************************************/
        //给图片重新随机生成名字
        String name= UUID.randomUUID()+imgFormat;
        String urlImg =casePath+"\\"+name;
        //保存图片
        file.transferTo(new File(urlImg));
        //拼接要保存在数据中的图片地址
        //path.getUREIMG() 同样也是存放在实体类的字段 可以直接写 http://localhost:8080/
        //dateForm 这是动态的文件夹所以要和地址一起存入数据库中
        //auser 为@RequestMapping("/auser")
        //放入对应的字段中
        return urlImg;
    }

    public void load(String cpicture, HttpServletResponse response){
        try{
            FileInputStream fis=new FileInputStream(new File(cpicture));
            ServletOutputStream sops=response.getOutputStream();
            int len=0;
            byte[] b=new byte[1024];
            while((len=fis.read(b))!=-1){
                sops.write(b,0,len);
                sops.flush();
            }
            fis.close();
            sops.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
