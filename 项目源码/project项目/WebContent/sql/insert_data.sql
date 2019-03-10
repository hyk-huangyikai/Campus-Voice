
insert into user values(5501,'小明',77777,1,'计算机科学与技术','12',22,'111111@qq.com');
insert into user values(5502,'小红',66666,1,'生物','12',18,'111111@qq.com');
insert into user values(5503,'小华',22222,1,'应用数学','12',20,'111111@qq.com');
insert into user values(5504,'小林',33333,1,'物理','12',23,'111111@qq.com');
insert into user values(5505,'小张',55555,1,'化学','12',22,'111111@qq.com');
insert into user values(6601,'李老师',45342,2,'人类学','12',33,'111111@qq.com');
insert into user values(6602,'陈老师',34234,2,'管理学','12',45,'111111@qq.com');
insert into user values(6603,'王老师',56423,2,'金融学','12',42,'111111@qq.com');

insert into private_tutor values(1,5503,'大二','数学','广州',100,'重点大学',34,'2019-01-04 14:22:31');
insert into private_tutor values(2,5501,'大一','英语','北京',120,'双一流',25,'2019-01-12 00:26:12');
insert into private_tutor values(3,6601,'大四','语文','西安',50,'重点大学',13,'2019-02-08 13:22:02');
insert into private_tutor values(4,6602,'大三','政治','上海',200,'暂时没有要求',65,'2019-03-05 09:26:51');

insert into teacher_info values(1,6601,'心理实验安排测试，需要50名志愿者，有需要的同学请报名',30,'2019-01-22 14:22:31');
insert into teacher_info values(2,6603,'**时刻计算机二级开始，请同学们准时复习',2,'2019-02-18 13:22:02');
insert into teacher_info values(3,6602,'图像人脸识别志愿者征集，有需要的请联系',53,'2019-03-01 08:26:51');

insert into club_activity values(1,5501,'音乐大赛','歌声比武','校团委','操场','2019.5.1',35,'2019-01-28 16:44:15');
insert into club_activity values(2,5502,'定向越野','最刺激的比拼，考验团体合作的时刻，不容错过','学生会','学校','2019.4.14',32,'2019-02-15 09:56:24');
insert into club_activity values(3,5502,'运动会','展现你优雅的身姿','体育部','操场','2019.3.15',20,'2019-02-22 14:12:26');
insert into club_activity values(4,5503,'画画比赛','如果有这份才艺，为何不尝试一下呢？','文艺协会','活动室','2019.6.1',15,'2019-03-05 20:10:31');


insert into private_tutor_comment values(1,1,5502,'这份信息我很需要！');
insert into private_tutor_comment values(2,2,5505,'我有朋友需要，可以联系一下');
insert into private_tutor_comment values(3,2,5504,'信息比较齐全');
insert into private_tutor_comment values(4,1,5501,'比较方便');
insert into private_tutor_comment values(5,3,5503,'以后都可以来这里查看家教信息了');

insert into teacher_info_comment values(1,1,5501,'收到，这个比较适合我');
insert into teacher_info_comment values(2,2,6602,'谢谢老师');
insert into teacher_info_comment values(3,2,5502,'及时收到提醒，很暖心');
insert into teacher_info_comment values(4,1,6603,'我有兴趣参与呀');
insert into teacher_info_comment values(5,3,5503,'可以及时了解老师发布的动态，很实用！');

insert into club_activity_comment values(1,1,5505,' 活动非常好');
insert into club_activity_comment values(2,1,5504,'我很期待活动的到来');
insert into club_activity_comment values(3,2,5502,'迫不及待');
insert into club_activity_comment values(4,1,6601,'可以看到各种活动发布，真好!');
insert into club_activity_comment values(5,3,5501,'支持，一定参与');

