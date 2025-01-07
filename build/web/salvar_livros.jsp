

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int ano = Integer.parseInt(request.getParameter("ano"));

            try {
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosbd", "root", "1234567");

                st = con.prepareStatement("INSERT INTO livros VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, titulo);
                st.setString(3, autor);
                st.setInt(4, ano);

                st.executeUpdate();
                out.print("Seu livro foi cadastrado com SUCESSO!!");
            } catch (Exception e) {
                String erro = e.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("Este livro já está cadastrado");
                } else {
                    out.print(erro);
                }
            }

        %>
    </body>
</html>
