package team.hotel.dao;
/**
* @author Suqiao Lin
* @version 创建时间：2018年7月6日
* 用于测试
*/
public class DBPrint {
	public  void PrintReadSQL(String table,String sql) {
		System.out.println("table="+table+",执行读取数据库语句："+sql);
	}
	
	public  void PrintUpdateSQL(String table,String sql) {
		System.out.println("table="+table+",执行更新数据库语句："+sql);
	}
	
	public  void PrintDelSQL(String table,String sql) {
		System.out.println("table="+table+",执行删除数据库语句："+sql);
	}
	
	public  void PrintSeleteSQL(String table,String sql) {
		System.out.println("table="+table+",执行选择数据库语句："+sql);
	}
	
	public void PrintSQL(String table,String sql) {
		System.out.println("table="+table+",执行一般数据库语句："+sql);
	}
}
