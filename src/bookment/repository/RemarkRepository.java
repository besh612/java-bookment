package bookment.repository;

import bookment.dto.Remark;
import java.sql.*;

import bookment.utils.DBUtils;
import java.util.ArrayList;
import java.util.List;

public class RemarkRepository {

	private static RemarkRepository instance = new RemarkRepository();

	private RemarkRepository() {
	}

	public static RemarkRepository getInstance() {
		return instance;
	}

	public int insert(Remark data, String id) {
		Connection con = DBUtils.getDBConnection();
		String query = "INSERT INTO books(bookname, isbn, content, rating, thumbnail, creator, author) VALUES(?, ?, ?, ?, ?, ?, ?)";
		assert con != null;
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, data.getName());
			pstmt.setString(2, data.getIsbn());
			pstmt.setString(3, data.getContent());
			pstmt.setString(4, Integer.toString(data.getRating()));
			pstmt.setString(5, data.getCover());
			pstmt.setString(6, id);
			pstmt.setString(7, data.getAuthor());
			return pstmt.executeUpdate();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		} finally {
			DBUtils.close(pstmt);
			DBUtils.close(con);
		}
		return -1;
	}

	public int delete(String id) {
		Connection con = DBUtils.getDBConnection();
		String query = "DELETE FROM books where id = ?";
		PreparedStatement pstmt = null;
		try {
			assert con != null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception : " + e);
		} finally {
			DBUtils.close(pstmt);
			DBUtils.close(con);
		}
		return -1;
	}

	public int modify(Remark data, String id) {
		Connection con = DBUtils.getDBConnection();
		String query = "Update books set content = ?, rating = ? where id = ? ";
		assert con != null;
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, data.getContent());
			pstmt.setString(2, Integer.toString(data.getRating()));
			pstmt.setString(3, id);
			return pstmt.executeUpdate();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		} finally {
			DBUtils.close(pstmt);
			DBUtils.close(con);
		}
		return -1;
	}

	public List<Remark> getList(String id) {
		Connection con = DBUtils.getDBConnection();
		String query = "SELECT * FROM books where creator = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Remark> list = null;
		try {
			assert con != null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					Remark data = new Remark();
					data.setId(rs.getInt("id"));
					data.setName(rs.getString("bookname"));
					data.setDate(rs.getTimestamp("date"));
					data.setRating(rs.getInt("rating"));
					data.setCover(rs.getString("thumbnail"));
					data.setCreator(rs.getInt("creator"));
					data.setAuthor(rs.getString("author"));
					list.add(data);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception : " + e);
		} finally {
			DBUtils.close(rs);
			DBUtils.close(pstmt);
			DBUtils.close(con);
		}
		return list;
	}

	public Remark getContent(String id) {
		Connection con = DBUtils.getDBConnection();
		String query = "SELECT * FROM books where id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Remark data = null;
		try {
			assert con != null;

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new Remark();
				data.setName(rs.getString("bookname"));
				data.setContent(rs.getString("content"));
				data.setDate(rs.getTimestamp("date"));
				data.setRating(rs.getInt("rating"));
				data.setCover(rs.getString("thumbnail"));
				data.setAuthor(rs.getString("author"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception : " + e);
		} finally {
			DBUtils.close(rs);
			DBUtils.close(pstmt);
			DBUtils.close(con);
		}
		return data;
	}
}