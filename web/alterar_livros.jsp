<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de livros</title>
    </head>
    <body>
         <%
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int ano = Integer.parseInt(request.getParameter("ano"));

            Connection con;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosbd", "root", "1234567");
            
              st = con.prepareStatement("UPDATE livros SET titulo = ?, autor = ?, ano = ? WHERE codigo = ?");
            
                st.setString(1, titulo);
                st.setString(2, autor);
                st.setInt(3, ano);
                st.setInt(4, codigo);
                
                st.executeUpdate();
                out.print("Livro alterado com SUCESSO!");
        %>
        
        
        
    </body>
</html>
