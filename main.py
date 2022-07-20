import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
import pymysql
import decimal
import numpy
import array as arr

driver = webdriver.Chrome("./chromedriver.exe")
# 添加隐式等待30s，全局变量。显式等待复杂，一般不采用
driver.implicitly_wait(20)
# 加载页面
driver.get("https://www.mi.com/shop")
# #最大化窗口
# driver.maximize_window()
# #关闭广告窗口
# close_btn = driver.find_element(By.CSS_SELECTOR, ".close_icon")
# close_btn.click()
# 获取输入框id
key = driver.find_element(By.ID, "search")
# #这里可写入数组，依次搜索
# word = {"小说", "科幻", "计算机"}
# 输入想查询的关键词
key.send_keys("小米电脑")

# 获取搜索按钮
search = driver.find_element(By.CSS_SELECTOR, ".search-btn")
# 点击按钮
search.click()
# # 创建连接
conn = pymysql.connect(host='127.0.0.1', port=3306, user='root', passwd='root777888', db='lt', charset='utf8')
# # 创建游标
cursor = conn.cursor()
# effect_row = cursor.execute("select * from commodity")
effect_row = cursor.execute("select * from commodity_specs")
# 循环拿取想要的数据

for i in range(3):
    commoditylist = driver.find_elements(By.CSS_SELECTOR, ".goods-list .goods-item")
    for commodity in commoditylist:
        # 名字
        cname = commodity.find_element(By.CSS_SELECTOR, "h2").text
        print(commodity.find_element(By.CSS_SELECTOR, "h2").text)
        # 价格
        cprice = commodity.find_element(By.CSS_SELECTOR, "span").text
        print(commodity.find_element(By.CSS_SELECTOR, "span").text)
        # 商品图片链接
        cpicture = commodity.find_element(By.CSS_SELECTOR, "img").get_attribute("src")
        print(commodity.find_element(By.CSS_SELECTOR, ".figure-img img").get_attribute("src"))

        # 数据处理
        cprice1 = cprice.split("元")[0]
        decimal.getcontext().prec = 2
        cprice2 = decimal.Decimal(cprice1)
        cpicture = commodity.find_element(By.CSS_SELECTOR, "img").get_attribute("src")
        # 标记类别，此类别由数据库原本所存category_id决定
        j = 1549326247098703873
        j1 = str(j)

        # 商品不同规格图片链接
        categorylist = commodity.find_elements(By.CSS_SELECTOR, ".thumb-list li")
        print(categorylist)
        for cimg in categorylist:
            # ActionChains(driver).move_to_element(cimg).perform()
            commodity_picture = cimg.find_element(By.CSS_SELECTOR, "img").get_attribute("src")
            print(commodity_picture)

        # 点击进入商品参数页面，这里没用执行js新开窗口
        # 获取进入商品详情页面url
        detail_url = commodity.find_element(By.CSS_SELECTOR, "a").get_attribute("href")
        print(detail_url)
        # 获取当前商品窗口句柄即windows_handles[0]
        commodity_handle = driver.current_window_handle
        print(commodity_handle)
        # 点击商品也可进入商品详情页面,这里出现了窗口跳转，不行就采用js跳转url
        commodity.click()

        # 将当前窗口句柄切换到新的商品详情url窗口
        driver.switch_to.window(driver.window_handles[1])
        # 输出当前商品详情窗口句柄
        detail_handle = driver.current_window_handle
        print(detail_handle)
        # #进入参数界面，此处改为在购买界面寻找
        # specs_btn = driver.find_element(By.LINK_TEXT, "参数页")
        # specs_btn.click()
        # 获取即将跳转的商品购买界面url
        buy_url = driver.find_element(By.CSS_SELECTOR, ".con .right .btn").get_attribute("href")
        print(buy_url)

        if buy_url is not None:
            # 跳转到购买界面
            detailbtn = driver.find_element(By.LINK_TEXT, "立即购买")
            detailbtn.click()
            # 关闭当前商品详情窗口以免页面过多
            driver.close()
            # 将当前窗口句柄切换到新的购买窗口，请注意close了详情界面之后句柄数组中无他了
            driver.switch_to.window(driver.window_handles[1])
            # 输出当前购买窗口句柄
            buy_handle = driver.current_window_handle
            print(buy_handle)
            # 爬取数据
        information = driver.find_element(By.CSS_SELECTOR, ".product-con")
        # 不带参数名字
        commodity_name = information.find_element(By.CSS_SELECTOR, "h2").text
        print(commodity_name)
        # 产品简述
        commodity_detail = information.find_element(By.CSS_SELECTOR, "p").text
        print(commodity_detail)
        # !!注意下方的窗口权柄转换注释


        # # 数据导入到commodity当中
        # attribute_list = str(specs_picture)
        # effect_row = cursor.execute("insert into commodity(cname,cprice,cpicture,category_id,cdetail) values (%s,%s,%s,%s,%s)",
        #                             [commodity_name, cprice2, cpicture, j1, commodity_detail])
        # conn.commit()

        # #数据导入到commodity_specs
        # picture_list = driver.find_elements(By.CSS_SELECTOR, ".swiper-wrapper .swiper-slide")
        # for picture in picture_list:
        #     specs_picture = picture.find_element(By.CSS_SELECTOR, "img").get_attribute("src")
        #     print(specs_picture)
        #     effect_row = cursor.execute("insert into commodity_specs(cname,cpicture,cprice) values (%s,%s,%s)", [commodity_name, specs_picture, cprice2])
        #
        #     conn.commit()

        #取保存内存规格和颜色规格的主体
        specs_body = information.find_elements(By.CSS_SELECTOR, ".buy-option .buy-box-child")
        #通过判定存放规格的数组长度来判定需要获取的规格
        length_specs = len(specs_body)
        # 内存规格
        if length_specs == 2:
            version_specs = specs_body[0].find_elements(By.CSS_SELECTOR, "li")
            for version in version_specs:
                version.click() #此处需要模拟鼠标点击从而获取动态价格
                #获取版本名，如8GB+128GB
                version_name = version.get_attribute("title")
                print(version_name)
                #获取当前版本下的手机价格
                commodity_price = information.find_element(By.CSS_SELECTOR, ".price-info span").text
                print(commodity_price)
                effect_row = cursor.execute("insert into attriute_value(attribute_id, attribute_value)values(%s, %s)", ["2", commodity_price])
            #颜色规格
            color_specs = specs_body[1].find_elements(By.CSS_SELECTOR, "li")
            for color in color_specs:
                color_name = color.get_attribute("title")
                print(color_name)
            #关闭当前窗口购买页面以免页面过多
            driver.close()
            #切换回原始商品页面窗口循环继续
            driver.switch_to.window(driver.window_handles[0])
        if length_specs == 3:
            product_specs = specs_body[0].find_elements(By.CSS_SELECTOR, "li")
            ver_specs = specs_body[1].find_elements(By.CSS_SELECTOR, "li")
            for product in product_specs:
                product.click()
                product_name = product.get_attribute("title")
                print(product_name)
                for ver in ver_specs:
                    ver.click()
                    ver_name = ver.get_attribute("title")
                    print(ver_name)
                    com_price = information.find_element(By.CSS_SELECTOR, ".price-info span").text
                    print(com_price)
            cols = specs_body[2].find_elements(By.CSS_SELECTOR, "li")
            for col in cols:
                col_name = col.get_attribute("title")
                print(col_name)
        driver.close()
        driver.switch_to.window(driver.window_handles[0])
    next = driver.find_element(By.CSS_SELECTOR, ".iconfont")
    next.click()
# 关闭游标
cursor.close()
# 关闭连接
conn.close()

