SET NAMES UTF8;

DROP DATABASE IF EXISTS cake;

CREATE DATABASE cake CHARSET=UTF8;

USE cake;

/*蛋糕种类*/
CREATE TABLE cake_laptop_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
  
	fname VARCHAR(32)
);

/*商品--蛋糕*/
CREATE TABLE cake_laptop(
	 lid INT PRIMARY KEY AUTO_INCREMENT,
	 family_id INT,	#所属种类家族编号
	 title VARCHAR(128),         #主标题
	 subtitle VARCHAR(128),      #副标题
	 price DECIMAL(10,2),        #价格
	 
	 lname VARCHAR(32),          #商品名称
	 details VARCHAR(10024),      #产品详细说明
	 
	 sold_count INT,             #已售出的数量
	 is_onsale BOOLEAN           #是否促销中
);

/*蛋糕图片*/
CREATE TABLE cake_laptop_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	laptop_id INT,              #蛋糕编号
	href VARCHAR(128)          #图片路径
);

/*用户信息*/
CREATE TABLE cake_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32) unique, #用户名 
	upwd VARCHAR(32)NOT NULL , #密码
	email VARCHAR(64) NOT NULL , #邮箱
	phone VARCHAR(16) NOT NULL , #手机号
	avatar VARCHAR(128),        #头像图片路径
	user_name VARCHAR(32),      #用户姓名
	gender INT     #性别  0-女  1-男
);

/*收货地址信息*/
CREATE TABLE cake_receiver_address(
	 aid INT PRIMARY KEY AUTO_INCREMENT,
	 user_id INT,                #用户编号
	 receiver VARCHAR(16),       #接收人姓名
	 province VARCHAR(16),       #省
	 city VARCHAR(16),           #市
	 county VARCHAR(16),         #县
	 address VARCHAR(128),       #详细地址
	 cellphone VARCHAR(16),      #手机
	
	  is_default BOOLEAN          #是否为当前用户的默认收货地址
	);

/*购物车条目*/
CREATE TABLE cake_shoppingcart_item(
	iid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,      #用户编号
	product_id INT,   #商品编号
	count INT,        #购买数量
	is_checked BOOLEAN #是否已勾选，确定购买
);

/*用户订单*/

CREATE TABLE cake_order_detail(
	did INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT,           #订单编号
	product_id INT,         #产品编号 
	count INT               #购买数量
);

/*首页轮播广告商品*/

CREATE TABLE cake_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT, #编号
	img VARCHAR(128),                   #图片
	title VARCHAR(64),                  #标题
	href VARCHAR(128)                   #图片链接
);

/*首页商品*/

CREATE TABLE cake_index_product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(64),    #标题
	details VARCHAR(128), #商品详情
	pic VARCHAR(128),     #图片
	price DECIMAL(10,2),  #价格
	href VARCHAR(128)   #图片链接
);

/*************/
/******数据导入*******/
/*************/
/******蛋糕种类家族*******/
INSERT INTO cake_laptop_family VALUES
(NULL,'鲜奶蛋糕'),
(NULL,'水果蛋糕'),
(NULL,'巧克力蛋糕'),
(NULL,'慕斯蛋糕'),
(NULL,'无糖蛋糕'),
(NULL,'数码蛋糕'),
(NULL,'冰激凌蛋糕'),
(NULL,'黑森林蛋糕'),
(NULL,'榴莲千层');

/*商品-蛋糕*/
INSERT INTO cake_laptop VALUES
(1,1,'往后余生相濡以沫','新鲜制作，同城配送，最快俩小时送达！',239,'鲜奶草莓蛋糕','甄选优质低筋小麦面粉、农家散养笨鸡蛋，专业制作，新鲜的食材，纯正的蛋糕师多年的经验调试出口感和甜度适宜的产品，当天制作，专人配送',109,true),
(2,1,'冰雪奇缘公主蛋糕','新鲜制作，同城配送，最快俩小时送达！',229,'鲜奶网红蛋糕','甄选优质低筋小麦面粉、农家散养笨鸡蛋，专业制作，新鲜的食材，纯正的蛋糕师多年的经验调试出口感和甜度适宜的产品，当天制作，专人配送',339,true),
(3,3,'巧克力森林','新鲜制作，同城配送，最快俩小时送达！',279,'巧克力蛋糕','甄选优质低筋小麦面粉、农家散养笨鸡蛋，专业制作，新鲜的食材，纯正的蛋糕师多年的经验调试出口感和甜度适宜的产品，当天制作，专人配送',99,true),
(4,3,'巧克力森林','新鲜制作，同城配送，最快俩小时送达！',279,'巧克力蛋糕','甄选优质低筋小麦面粉、农家散养笨鸡蛋，专业制作，新鲜的食材，纯正的蛋糕师多年的经验调试出口感和甜度适宜的产品，当天制作，专人配送',99,true);

/*蛋糕图片*/
INSERT INTO cake_laptop_pic VALUES
(NULL,1,'img/product/20201109203107.jpg'),
(NULL,2,'img/product/20201109203128.jpg'),
(NULL,3,'img/product/20201109203134.jpg'),
(NULL,3,'img/product/20201109203134.jpg');

/*用户信息*/
INSERT INTO cake_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO cake_index_carousel VALUES
(NULL, 'img/product/20201109203107.jpg','轮播广告商品1','product_details.html?lid=1'),
(NULL,'img/product/20201109203128.jpg','轮播广告商品2','product_details.html?lid=2'),
(NULL, 'img/product/20201109203134.jpg','轮播广告商品3','product_details.html?lid=3'),
(NULL, 'img/product/20201109203128.jpg','轮播广告商品4','product_details.html?lid=2');

/*首页商品*/
INSERT INTO cake_index_product VALUES
(NULL, '往后余生相濡以沫','新鲜制作，同城配送，最快俩小时送达！','img/product/20201109203107.jpg', 229, 'product_details.html?lid=1'),
(NULL, '冰雪奇缘公主蛋糕','新鲜制作，同城配送，最快俩小时送达！','img/product/20201109203128.jpg', 239, 'product_details.html?lid=2'),
(NULL, '巧克力森林','新鲜制作，同城配送，最快俩小时送达！','img/product/20201109203134.jpg', 279, 'product_details.html?lid=3'),
(NULL, '巧克力森林','新鲜制作，同城配送，最快俩小时送达！','img/product/20201109203134.jpg', 279, 'product_details.html?lid=3');