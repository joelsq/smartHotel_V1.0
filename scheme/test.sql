USE hotel;

#存储过程的测试用例
#call proc_checklistAdd(1,1,'2018-07-06 20:05:00',2,null,null,2,null,null,@state);
#call proc_checklistAdd(3,5,'2018-07-06 22:04:13',1,'2018-07-07 12:00:00',null,1,null,null,@state);
#call proc_checklistAdd(3,7,'2018-07-06 23:05:13',2,'2018-07-08 12:00:00',null,3,null,null,@state);
#call proc_checklistDel(5,@state);                     
#call proc_checklistUpdate(null,null,null,4,null,'dinner',3,null,null,@state);       
#call proc_checklistSelect(1,@state);


#call proc_guestAdd('aa','15625106005','123456','441222000668','male',null,null,@state);
#call proc_guestDel('guest2',@state);
#call proc_guestUpdate('aa','13229058730','111111',null,null,null,null,@state);
#call proc_guestSelect('guest2',@state);



#call proc_room_reviewAdd('R3-1',NULL,15,NULL,NULL,@state);
#call proc_room_reviewAdd('R4-2',3,104,null,NULL,@state);
#call proc_room_reviewAdd('R5-2',5,21,null,NULL,@state);
#call proc_room_reviewDel('R3-1',@state);
#call proc_room_reviewSelect('R4-2',@state);
#call proc_room_reviewUpdate('R5-2',null,1,null,null,@state);


#call proc_roomAdd('R2-2','双床房',25,2,250,1,1,1,1,0,@state);
#call proc_roomDel('R1-2',@state);
#call proc_roomUpdate('R2-2','家庭房',null,null,null,null,null,null,null,null,@state);
#CALL proc_roomSelect('R2-2',@state);



#CALL proc_userAdd('lgg','123456',10,'guest',NULL,NULL,@state);
#call proc_userDel('admin',@state);
#CALL proc_userSelect('guest',@state);
#call proc_userUpdate('lg','111222',null,null,null,null,@state);



#打印输出参数state
SELECT @state;


SELECT * FROM financial_report WHERE fin_date='2018-07-06';

#连接join测试
/*
SELECT checklist_id, guest_id, guest_phone,guest_name,guest_gender,room_id,room_num,check_in_date,
check_in_date,check_days,check_out_date,check_meal_type,check_num_of_people,check_room_consume,check_total_consume
FROM checklist LEFT JOIN `guest` ON `check_guest_id`=`guest_id`
*/
#LEFT JOIN room ON `check_room_id`=`room_id` WHERE 1=1;