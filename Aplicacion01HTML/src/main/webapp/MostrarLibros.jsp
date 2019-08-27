<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.arquitectura.Libro"%>
<%@ page import="java.util.List"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Libros</title>
</head>
<body>
<form id="formularioFiltros" action="MostrarLibros.jsp">
<fieldset>
<legend>Libros</legend>
<p>
<select name="categoria">
<% List<String> listaDeCategorias=null;
		
		listaDeCategorias = Libro.buscarTodasLasCategorias();
		
		
		//5
		for(String categoria:listaDeCategorias){%>
		<option value="<%=categoria %>">
		<%=categoria%></option>
		<%}%>
			</select>
			<input type="submit" value="filtrar"/>
			</p>
		
		
		<% 
		List<Libro> libros = null;
		if(request.getParameter("categoria")==null || 
			request.getParameter("categoria").equals("seleccionar")){
			libros=Libro.buscarTodos();
		}else{
			libros= Libro.buscarPorCategoria(request.getParameter("categoria"));
		}
		for(Libro book: libros){%>
		<p>
			<%=book.getIsbn()%>
			<%=book.getTitulo()%>
			<%=book.getCategoria()%>
			<a href="BorrarLibro.jsp?isbn=<%=book.getIsbn()%>">Borrar</a>
			<a href="FormularioEditarLibro.jsp?isbn=<%=book.getIsbn()%>">Editar</a>
				<br/>
			
		<%}%></p>
<p>
<a href="FormilarioInsertarLibro.jsp">insertar Libro</a> </p>
</fieldset>
</form>
</body>
</html>