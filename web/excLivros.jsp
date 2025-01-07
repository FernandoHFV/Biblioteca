<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir livros</title>
    </head>
    <body>
        
        <%
            int cod = Integer.parseInt(request.getParameter("codigo"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                PreparedStatement st;

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosbd", "root", "1234567");

                st = con.prepareStatement("DELETE FROM livros WHERE codigo=?");

                st.setInt(1, cod);

                int resultado = st.executeUpdate();

                if (resultado == 0) {
                    out.print("Livro não cadastrado");
                } else {
                    out.print("Livro excluido com sucesso!");
                }
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
        
        
    </body>
</html>
