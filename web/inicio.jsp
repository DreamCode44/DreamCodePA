<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%@ page import="java.sql.*, clase.conectar" %>
<%
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String enter = request.getParameter("enter");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        int tipoC = 0;

            try {
                conectar msj = new conectar();
                cn = msj.conectar();

                pstm = cn.prepareStatement("SELECT * FROM inicio_sesion WHERE (correo = ? OR usuario = ?) AND contra = ?");
                pstm.setString(1, enter);
                pstm.setString(2, enter);
                pstm.setString(3, contraseña);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    tipoC = 1;
                } else {
                    // Cerramos el primer PreparedStatement y ResultSet antes de reutilizarlos
                    if (rs != null) {
                        rs.close();
                    }
                    if (pstm != null) {
                        pstm.close();
                    }

                    pstm = cn.prepareStatement("SELECT * FROM doctor WHERE (correo = ? OR usuario = ?) AND contra = ?");
                    pstm.setString(1, enter);
                    pstm.setString(2, enter);
                    pstm.setString(3, contraseña);
                    rs = pstm.executeQuery();

                    if (rs.next()) {
                        tipoC = 2;
                    }
                }

                if (tipoC == 1) {
                    response.sendRedirect("usuario.html");
                } else if (tipoC == 2) {
                    response.sendRedirect("medico.html");
                } else {
                    out.println("<script>alert('Usuario o contraseña incorrectos');</script>");
                    out.println("<script>window.location.href='inicio.html';</script>");
                }
            } catch (SQLException e) {
                out.println("<script>alert('Error en la base de datos: " + e.getMessage() + "');</script>");
                out.println("<script>window.location.href='inicio.html';</script>");
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (pstm != null) {
                        pstm.close();
                    }
                    if (cn != null) {
                        cn.close();
                    }
                } catch (SQLException e) {
                    // Manejo de errores al cerrar recursos
                }
            }
            %>
</body>
</html>