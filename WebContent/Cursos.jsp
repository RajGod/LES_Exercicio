<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entity.Curso"%>
<%@page import="java.util.List"%>
<%@page import="Servlets.BuscarCursos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cursos Disponiveis</title>
<style>
#cursos {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#cursos td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#cursos tr:nth-child(even){background-color: #f2f2f2;}

#cursos tr:hover {background-color: #ddd;}

#cursos th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
       <div class="container">
         <div class="w3-panel w3-blue w3-round-xlarge">
	     <center><h1>Cursos oferecidos na E-learning </h1></center> 
	    </div>
	    <%
	    BuscarCursos bc = new BuscarCursos();
	    	List<Curso> lista = bc.buscarCursosAprovados();
	    	
	    %>
	 
	<form action="./CursoServlet" method="post">
		<div class="form-group">
			<label><H2>Cursos disponiveis:</H2></label>
			<select name="Curso" class="form-control">
				<%
					for(int x=0;x<lista.size();x++){
						%><option value="<%=lista.get(x).getCodigo()%>" >
							<%=lista.get(x).getNome()%>
						</option>
					<% }%>
						 
					
				<option value="disponivel">Vue.js  </option>
			</select>
		</div>
			<br>
			<p>
			<button type="submit" class="w3-button w3-blue">Adicionar Curso</button></p>
			
		  <table class="w3-table-all" id="cursos">
		    <thead >
						<tr>
							<th>Nome do curso</th>
							<th>Descri��o</th>
							<th>Dura��o</th>
						</tr>
						 <%
							for(int x=0;x<lista.size();x++){
						 %>	
						 	<tr>
						 		<td><%=lista.get(x).getNome() %></td>
						 		<td><%=lista.get(x).getDecricao() %></td>
						 		<td><%=lista.get(x).getDuracao() %></td>
						 	</tr>
						 	<% } %>
						
					 <thead >			
				</table>
		</form>
	 </div>	
   </body>
</html>