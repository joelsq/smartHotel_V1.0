USE hotel;

#存储过程的测试用例
#call proc_roomAdd('R2-2','双床房',25,2,250,1,1,1,1,0,@state);
#call proc_roomDel('R1-4',@state);
#call proc_roomUpdate('R2-2','家庭房',null,null,null,null,null,null,null,null,@state);

CALL proc_roomSelect('R2-2',@state);

#打印输出参数state
SELECT @state;
