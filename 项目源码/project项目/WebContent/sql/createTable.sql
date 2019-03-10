use school;

drop table if exists private_tutor_comment;
drop table if exists teacher_info_comment;
drop table if exists club_activity_comment;
drop table if exists second_hand_material;
drop table if exists private_tutor;
drop table if exists teacher_info;
drop table if exists study_online;
drop table if exists club_activity;

drop table if exists user;


-- /*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table if not exists user
(
   user_net_id          int not null,
   user_name            varchar(255),
   contect_method       char(255),
   type                 int,
   major                char(255),
   passwd               varchar(255),
   age                  int ,
   mail                 varchar(255),
   primary key (user_net_id)
);


-- /*==============================================================*/
-- /* Table: second_hand_material                                  */
-- /*==============================================================*/
create table if not exists second_hand_material
(
   textbook_id          int not null,
   user_net_id          int,
   textbook_name        varchar(255),
   author               varchar(255),
   pub                  varchar(255),
   price                float(4),
   filename             varchar (500),
   time         varchar(255),
   primary key (textbook_id)
);
-- insert into second_hand_material values(3,3,'aa','aa','a',20);
-- select * from second_hand_material order by textbook_id desc limit 1;

alter table second_hand_material add constraint FK_user_textbook foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;

-- use school;




/*==============================================================*/
/* Table: private_tutor                                         */
/*==============================================================*/
create table if not exists private_tutor
(
   teach_id             int not null,
   user_net_id          int,
   grade                char(255),
   subject              varchar(255),
   location             varchar(255),
   wage                 float(4),
   schooling_requirement varchar(255),
   like_number          int,
   time         varchar(255),
   primary key (teach_id)
);



alter table private_tutor add constraint FK_user_teach foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;




/*==============================================================*/
/* Table: teacher_info                                          */
/*==============================================================*/
create table if not exists teacher_info
(
   info_id              int not null,
   user_net_id          int,
   info_content         varchar(1000),
   like_number          int,
   time         varchar(255),
   primary key (info_id)
);

alter table teacher_info add constraint FK_user_teachinfo foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;






/*==============================================================*/
/* Table: study_online                                          */
/*==============================================================*/
create table if not exists study_online
(
   book_id              int not null,
   user_net_id          int,
   book_name            varchar(255),
   description      varchar(255),
   filename       varchar(255),
   time         varchar(255),
   primary key (book_id)
);

alter table study_online add constraint FK_user_online_book foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;





/*==============================================================*/
/* Table: club_activity                                         */
/*==============================================================*/
create table if not exists club_activity
(
   activity_id          int not null,
   user_net_id          int,
   activity_name        varchar(255),
   activity_content     varchar(500),
   department           varchar(255),
   activity_location    varchar(255),
   activity_datetime    varchar(255),
   like_number          int,
   time         varchar(255),
   primary key (activity_id) 
);

alter table club_activity add constraint FK_user_activity foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;



/*==============================================================*/
/* Table: study_experience                                      */
/*==============================================================*/



/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/


create table if not exists private_tutor_comment
(
    comment_id     int not null,
    teach_id       int,
    user_net_id    int,
    comment_content      varchar(255),
    primary key (comment_id)
);




alter table private_tutor_comment add constraint FK_commnet_teach1 foreign key (teach_id)
      references private_tutor (teach_id) on delete restrict on update restrict;
alter table private_tutor_comment add constraint FK_user_comment1 foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;


create table if not exists teacher_info_comment
(
    comment_id     int not null,
    info_id      int,
    user_net_id    int,
    comment_content      varchar(255),
    primary key (comment_id)
);

alter table teacher_info_comment add constraint FK_comment_info1 foreign key (info_id)
      references teacher_info (info_id) on delete restrict on update restrict;
alter table teacher_info_comment add constraint FK_user_comment2 foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;
      



create table if not exists club_activity_comment
(
    comment_id     int not null,
  activity_id      int,
    user_net_id    int,
    comment_content      varchar(255),
    primary key (comment_id)
);

alter table club_activity_comment add constraint FK_comment_activity1 foreign key (activity_id)
      references club_activity (activity_id) on delete restrict on update restrict;
alter table club_activity_comment add constraint FK_user_comment3 foreign key (user_net_id)
      references user (user_net_id) on delete restrict on update restrict;
      
