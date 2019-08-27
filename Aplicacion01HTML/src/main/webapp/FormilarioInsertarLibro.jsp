<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.arquitectura.Libro"%>
<%@ page import="java.util.List"%>
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
			<form id="miformulario" action="InsertarLibro.jsp" 
				onsubmit="return validation();" >
				<fieldset>
						<legend>Formulario alta libro </legend>
						<p><label for="isbn">ISBN:</label>
							<input id="isbn" type="text" name="isbn"/>
						</p>
						<p> <label for="titulo">Titulo:</label>
							<input id="titulo" type="text" name="titulo"/>
						</p>
						<p> <label for="categoria">Categoria:</label>
							<select name="categoria">
							<option value="seleccionar"> seleccionar</opcion>
							<%
								
								List<String> listCategoria = null; 
							listCategoria=Libro.buscarTodasLasCategorias();
									
									//5
									for(String categorias: listCategoria){%>
									<option value="<%=categorias %>">
									<%=categorias%></option>
									<%}	%>
									
							</select>
						</p>
						<p>
							<input type="submit" value="insertar"/>
						</p>
				</fieldset>
			</form>
		</body>
</html>