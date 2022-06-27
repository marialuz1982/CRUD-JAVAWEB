<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  </head>
  <body>
      <div class="container">
          <h1>Agregar registro</h1>
          <hr><!-- comment -->
          <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
              <label>DNI</label>
              <input type="text" name="txtDNI" class="form-control">
              <label>NOMBRE</label>
              <input type="text" name="txtNombre" class="form-control">
              <br>
              <input type="submit" value="Guardar" class="btn btn-primary btn-lg">              
              <a href="index.jsp" class="btn btn-info btn-lg">Regresar</a>
          </form>    
          
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
<%
          /*Connection con;
          String url="jdbc:mysql://localhost:3306/registro?zeroDateTimeBehavior=CONVERT_TO_NULL";
          String Driver="com.mysql.jdbc.Driver";
          String user="root";
          String clave="12345";
          Class.forName(Driver);
          con=DriverManager.getConnection(url,user,clave);
          PreparedStatement ps;
          String dni,nom;
          dni=request.getParameter("txtDNI");
          nom = request.getParameter("txtNombre");
          if(nom != null && dni != null){
          ps=con.prepareStatement("insert into usuario(Nombres, DNI)values('"+nom+"','"+dni+"')");
          ps.executeUpdate();          
            
          response.sendRedirect("index.jsp");
    }*/
          
       Connection con;
       String url="jdbc:mysql://localhost:3306/registro";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="12345";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       String dni, nom;
       nom=request.getParameter("txtNom");
       dni=request.getParameter("txtDNI");      
       if(nom!=null && dni!=null){
           ps=con.prepareStatement("insert into persona(Nombres, DNI)values('"+nom+"','"+dni+"')");
           ps.executeUpdate();
           //JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
           response.sendRedirect("index.jsp");
           
       }
       
%>