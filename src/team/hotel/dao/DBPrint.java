package team.hotel.dao;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 用于测试
 */
public class DBPrint {
	static public void PrintAddSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行插入数据库语句：" + sql);
	}

	static public void PrintReadSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行读取数据库语句：" + sql);
	}

	static public void PrintUpdateSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行更新数据库语句：" + sql);
	}

	static public void PrintDelSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行删除数据库语句：" + sql);
	}

	static public void PrintSeleteSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行选择数据库语句：" + sql);
	}

	static public void PrintSQL(String table, String sql) {
		System.out.println("table=" + table + ",执行一般数据库语句：" + sql);
	}

	static public void PrintSQL(String sql) {
		System.out.println("执行一般数据库语句：" + sql);
	}


}
