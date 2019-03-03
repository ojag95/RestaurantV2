<%-- 
Pagina que retorna un JSON con las categorias de los platillos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page language="java" contentType="application/json;charset=UTF-8" %>

<%  ProductoDAO dao = new ProductoDAO();
    dao.obtenerJSONTipos(request, response);
%>
    
