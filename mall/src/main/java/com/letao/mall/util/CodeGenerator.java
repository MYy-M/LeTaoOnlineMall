//package com.letao.mall.util;
//import com.baomidou.mybatisplus.annotation.DbType;
//import com.baomidou.mybatisplus.annotation.FieldFill;
//import com.baomidou.mybatisplus.annotation.IdType;
//import com.baomidou.mybatisplus.generator.AutoGenerator;
//import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
//import com.baomidou.mybatisplus.generator.config.GlobalConfig;
//import com.baomidou.mybatisplus.generator.config.PackageConfig;
//import com.baomidou.mybatisplus.generator.config.StrategyConfig;
//import com.baomidou.mybatisplus.generator.config.po.TableFill;
//import com.baomidou.mybatisplus.generator.config.rules.DateType;
//import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
//
//import java.util.ArrayList;
//// 代码自动生成器
//    public class CodeGenerator {
//    public static void main(String[] args) {
//        // 需要构建一个 代码自动生成器 对象
//        AutoGenerator mpg = new AutoGenerator();
//        // 配置策略
//        // 1、全局配置
//        GlobalConfig gc = new GlobalConfig();
//        String projectPath = System.getProperty("user.dir");
//        gc.setOutputDir(projectPath+"/src/main/java");
//        gc.setAuthor("骑手反叛联盟");
//        gc.setOpen(false);
//        gc.setFileOverride(false);// 是否覆盖
//        gc.setServiceName("%sService");// 去Service的I前缀
//        gc.setIdType(IdType.ID_WORKER);//ID_WORKER已被废弃
//        gc.setDateType(DateType.ONLY_DATE);
//        gc.setSwagger2(true);
//        mpg.setGlobalConfig(gc);
//
//        //2、设置数据源
//        DataSourceConfig dsc = new DataSourceConfig();
//        dsc.setUrl("jdbc:mysql://localhost:3306/it?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8");
//        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
//        dsc.setUsername("root");
//        dsc.setPassword("991221myy");
//        dsc.setDbType(DbType.MYSQL);
//        mpg.setDataSource(dsc);
//
//        //3、包的配置
//        PackageConfig pc = new PackageConfig();
//        pc.setModuleName("mall");
//        pc.setParent("com.letao");
//        pc.setEntity("dao.entity");
//        pc.setMapper("dao.mapper");
//        pc.setService("service");
//        pc.setController("controller");
//        mpg.setPackageInfo(pc);
//
//        //4、策略配置
//        StrategyConfig strategy = new StrategyConfig();
//        // 设置要映射的表名
//        strategy.setInclude("admin","cart","category","commodity","commodity_specs","attribute_key","attribute_value","comment","lt_order","orderitem","store","user");
//        strategy.setNaming(NamingStrategy.underline_to_camel);
//        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//        strategy.setEntityLombokModel(true);// 自动lombok；
//        strategy.setLogicDeleteFieldName("deleted");   // 自动填充配置
//        TableFill gmtCreate = new TableFill("gmt_create", FieldFill.INSERT);
//        TableFill gmtModified = new TableFill("gmt_modified", FieldFill.INSERT_UPDATE);
//        ArrayList<TableFill> tableFills = new ArrayList<>();
//        tableFills.add(gmtCreate);
//        tableFills.add(gmtModified);
//        strategy.setTableFillList(tableFills);
//        // 乐观锁
//        strategy.setVersionFieldName("version");
//        strategy.setRestControllerStyle(true);
//        strategy.setControllerMappingHyphenStyle(true);
//        mpg.setStrategy(strategy);
//        //执行
//        mpg.execute();
//
//    }
//}
