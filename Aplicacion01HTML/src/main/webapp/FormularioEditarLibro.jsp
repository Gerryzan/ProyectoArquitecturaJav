<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.arquitectura.Libro"%>
<% Libro libro = Libro.buscarPorClave(request.getParameter("isbn"));%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="CSS/formato.css"/>
		<script type="text/javascript">
			function validation(){
					var isbn=document.getElementById("isbn");
					var miformulario=document.getElementById("miformulario");
						if(isbn.value =="")
						{	
							alert("datos no validos");
							return false;
						}else{
							miformulario.submit();}
				}
		</script>
	<title>Formulario Libro</title>
</head>    
	<body>
			<form id="formularioEdicion" action="SalvarLibro.jsp" 
			onsubmit="return validation();">
				<fieldset>
					<legend>Formulario alta libro</legend>
					<p>
						<label for="isbn">ISBN:</label>
						<input type="text" id="isbn" name="isbn" 
						value="<%=libro.getIsbn()%>"/>
					</p>
					<p>
						<label for="titulo">Titulo</label>
						<input type="text" id="titulo" name="titulo"
						value="<%=libro.getTitulo()%>"/>
					</p>
					<p>
						<label for="categoria">Categoria :</label>
						<select name="categoria">
							<%
								List<String> listaDeCategorias=null;
								listaDeCategorias=Libro.buscarTodasLasCategorias();
								for(String categoria: listaDeCategorias)
								{
									if(libro.getCategoria().equals(categoria)){%>
									<option value="<%=categoria%>" selected="selected"><%=categoria%>
									</option>
									<%}else{%>
									<option value="<%=categoria%>"><%=categoria%></option>
									<%}
								} %>
						</select>	
						<br/>
					</p>
					 <p>
						<input type="submit" value="Salvar"/>
					</p>
				</fieldset>
			</form>
	</body>
</html>