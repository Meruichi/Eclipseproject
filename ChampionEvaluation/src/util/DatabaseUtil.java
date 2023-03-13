package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL = "jdbc:mysql://localhost:3306/ChampionEvaluation";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName(driver);
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
