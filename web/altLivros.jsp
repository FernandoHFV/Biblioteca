<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="StyleSheet" href="ss2.css"/>
        <title>Editar ou alterar livro</title>
    </head>
    <body>
        <%
            String paramCodigo = request.getParameter("codigo");
            if (paramCodigo == null || paramCodigo.isEmpty()) {
                out.print("<div class='message'>Código inválido.</div>");
                return;
            }

            int cod = Integer.parseInt(paramCodigo);

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosbd", "root", "1234567");
                 PreparedStatement st = con.prepareStatement("SELECT codigo, titulo, autor, ano FROM livros WHERE codigo = ?")) {

                st.setInt(1, cod);
                try (ResultSet rs = st.executeQuery()) {
                    if (!rs.next()) {
                        out.print("<div class='message'>Livro não encontrado.</div>");
                    } else {
        %>
        <form class="editar" method="post" action="alterar_livros.jsp">
    <p>
        <label for="codigo">Código de identificação:</label>
        <input type="text" name="codigo" id="codigo" 
               value='<%= (rs.getString("codigo") != null ? rs.getString("codigo").replace("\"", "&quot;") : "") %>' readonly>
    </p>
    <p>
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" id="titulo" 
               value='<%= (rs.getString("titulo") != null ? rs.getString("titulo").replace("\"", "&quot;") : "") %>'>
    </p>
    <p>
        <label for="autor">Autor:</label>
        <input type="text" name="autor" id="autor" size="40" maxlength="70" 
               value='<%= (rs.getString("autor") != null ? rs.getString("autor").replace("\"", "&quot;") : "") %>'>
    </p>
    <p>
        <label for="ano">Ano de publicação:</label>
        <input type="text" name="ano" id="ano" 
               value='<%= (rs.getString("ano") != null ? rs.getString("ano").replace("\"", "&quot;") : "") %>'>
    </p>
    <p>
        <input type="submit" value="Salvar alterações">
    </p>
</form>

    <form class="excluir" method="get" action="excLivros.jsp"> 
            <label for="codigo">Deseja excluir o livro:</label>
            <input type="text" name="codigo" id="codigo" value="<%= rs.getString("codigo") %>" readonly>
            <p><input type="submit" value="Excluir"></p>
        </form>
        <%
                    }
                }
            } catch (Exception e) {
                out.print("<div class='message'>Ocorreu um erro ao processar sua solicitação.</div>");
                e.printStackTrace();
            }
        %>
    </body>
</html>
