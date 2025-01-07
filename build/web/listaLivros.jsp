<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="ss2.css"/>
        <title>Listagem de livros</title>
    </head>
    <body class="tabela">
        <%
            try {
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosbd", "root", "1234567");

                st = con.prepareStatement("SELECT * FROM livros");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th> Código </th> <th> Título </th><th> Autor </th><th> Ano </th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td> <%= rs.getString("codigo")%></td>
                <td> <%= rs.getString("titulo")%></td>
                <td> <%= rs.getString("autor")%></td>
                <td> <%= rs.getString("ano")%></td>      
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
