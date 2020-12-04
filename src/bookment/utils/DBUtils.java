package bookment.utils;

import java.sql.*;

public class DBUtils {

	public static Connection getDBConnection() {
		Connection con;
		try {
			String jdbcUrl = "jdbc:mariadb://localhost:3306/bookment";
			String dbId = "root";
			String dbPass = "DB_PASSWORD";

			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			System.out.println("DB error : " + e);
			return null;
		}
		return con;
	}

	public static void close(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
