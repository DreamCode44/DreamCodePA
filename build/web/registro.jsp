<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import ="java.sql.*, clase.conectar" %>
        <% 
            Connection cn = null;
            PreparedStatement pstm = null;
            conectar msj = new conectar();
            cn = msj.getConnection();
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            String contraseña = request.getParameter("contra");
            
            pstm = cn.prepareStatement("insert into inicio_sesion values('"+usuario+"','"+correo+"','"+contraseña+"');");
            pstm.executeUpdate();
            
            cn.close();
            pstm.close();
            
            out.println("<script> window.location.href='inicio.html';</script>");
            
            
            
            
        %>
    </body>
</html>