USE hotel;

#存储过程的测试用例
#call proc_roomAdd('R2-2','双床房',25,2,250,1,1,1,1,0,@state);
#call proc_roomDel('R1-2',@state);
#call proc_roomUpdate('R2-2','家庭房',null,null,null,null,null,null,null,null,@state);
#CALL proc_roomSelect('R2-2',@state);

CALL proc_userAdd('lg','123456',10,'guest',NULL,NULL,@state);
#call proc_userDel('admin',@state);
#CALL proc_userSelect('guest',@state);

#打印输出参数state
SELECT @state;


#SELECT * FROM financial_report WHERE fin_date='2018-07-06';

#连接join测试
/*
SELECT checklist_id, guest_id, guest_phone,guest_name,guest_gender,room_id,room_num,check_in_date,
check_in_date,check_days,check_out_date,check_meal_type,check_num_of_people,check_room_consume,check_total_consume
FROM checklist LEFT JOIN `guest` ON `check_guest_id`=`guest_id`
*/
#LEFT JOIN room ON `check_room_id`=`room_id` WHERE 1=1;