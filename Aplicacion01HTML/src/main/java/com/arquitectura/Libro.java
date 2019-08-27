package com.arquitectura;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class Libro {
	private String isbn;
	private String titulo;
	private String categoria;
	
	public Libro() {
		this.isbn = "";
		this.titulo = "";
		this.categoria= "";
	}
	public Libro(String isbn, String titulo, String categoria)
	{
		this.categoria = categoria;
		this.titulo = titulo;
		this.isbn = isbn;
	}
	public Libro(String isbn)
	{
		this.isbn=isbn;
		this.titulo="";
		this.categoria="";
			
	}
	public static List<String> buscarTodasLasCategorias()
	{
		String consultaSQL = "select distinct(Categoria) from Libros";
		DataBaseHelper helper= new DataBaseHelper();
		List<String> listaCategorias = helper.seleccionarRegistros(consultaSQL,String.class);
		return listaCategorias;
	}
	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	

	public  void insertar()
	{
		String consultaSQL = "insert into Libros(isbn,Titulo,Categoria) values";
		consultaSQL +="('" + isbn + "','" + titulo + "','" + categoria + "')";
		DataBaseHelper helper = new DataBaseHelper();
		helper.modificarRegistro(consultaSQL);
	}
	
	public static  List<Libro> buscarTodos()
	{
		
		String consultaSQL = "select isbn, Titulo, Categoria from Libros";
		DataBaseHelper helper= new DataBaseHelper();
		List<Libro> listaDeLibros = helper.seleccionarRegistros(consultaSQL,Libro.class);
		return listaDeLibros;
	}
	
	public void borrar()
	{
		String consultaSQL = "delete from libros where isbn="+ this.isbn+"";
		DataBaseHelper<Libro> helper= new DataBaseHelper<Libro>();
		helper.modificarRegistro(consultaSQL);
	}
	
	public void salvar() {
		String consultaSQL = "update libros set titulo='" + this.titulo+
				"', categoria='"+ this.categoria+"' where isbn=" + this.isbn+ "";
		DataBaseHelper<Libro> helper = new DataBaseHelper<Libro>();
		helper.modificarRegistro(consultaSQL);
	}
	
	public static Libro buscarPorClave(String isbn)
	{
		String consultaSQL="select isbn, titulo, categoria from Libros where "+
				"isbn="+ isbn+"";
		DataBaseHelper<Libro> helper= new DataBaseHelper<Libro>();
		List<Libro> listaDeLibros= helper.seleccionarRegistros(consultaSQL,Libro.class);
		return listaDeLibros.get(0);
	}
	
	public static List<Libro> buscarPorCategoria(String categoria)
	{
		String consultaSQL = "select isbn, titulo,categoria from Libros where categoria='"+
				categoria+"'";
		DataBaseHelper<Libro> helper= new DataBaseHelper<Libro>();
		List<Libro> listaDeLibros = helper.seleccionarRegistros(consultaSQL, Libro.class);
		return listaDeLibros;
	}
} 
