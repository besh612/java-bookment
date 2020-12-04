<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%@ page import="bookment.utils.DBUtils" %>

<%
    request.setCharacterEncoding("utf-8");
    String userName = request.getParameter("username");
    String passWd = request.getParameter("password");

    Connection con = DBUtils.getDBConnection();
    String query = "SELECT * FROM account where username = ?";
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String id;
        String password;
        assert con != null;

        pstmt = con.prepareStatement(query);
        pstmt.setString(1, userName);
        rs = pstmt.executeQuery();
        rs.next();
        id = rs.getString("id");
        password = rs.getString("password");

        out.println("<script>");
        if (passWd.equals(password)) {
            session.setAttribute("id", id);
            session.setAttribute("isLogin", "true");

            out.println("alert('로그인 되었습니다.')");
            out.println("location.href='index.jsp'");
        } else {
            out.println("alert('아이디 혹은 비밀번호가 틀렸습니다.')");
            out.println("location.href='signin.jsp'");
        }
        out.println("</script>");

    } catch (SQLException throwables) {
        throwables.printStackTrace();
        out.println("<script>");
        out.println("alert('아이디 혹은 비밀번호가 틀렸습니다.')");
        out.println("location.href='signin.jsp'");
        out.println("</script>");
    } finally {
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(con);
    }
%>