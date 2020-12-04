<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%@ page import="bookment.utils.DBUtils" %>

<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");
    String userName = request.getParameter("username");
    String passWd = request.getParameter("password");

    Connection con = DBUtils.getDBConnection();
    String query = "INSERT INTO account(username, email, password) VALUES(?, ?, ?)";
    assert con != null;
    PreparedStatement pstmt = null;
    try {
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, userName);
        pstmt.setString(2, email);
        pstmt.setString(3, passWd);
        pstmt.executeUpdate();

        out.println("<script>");
        out.println("alert('회원가입 되었습니다.')");
        out.println("location.href='signin.jsp'");
        out.println("</script>");
    } catch (SQLException throwables) {
        throwables.printStackTrace();
        out.println("<script>");
        out.println("alert('회원가입에 실패했습니다.')");
        out.println("location.href='signin.jsp'");
        out.println("</script>");
    } finally {
        DBUtils.close(pstmt);
        DBUtils.close(con);
    }
%>