
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
        <%
            Connection con;
            String url="jdbc:mysql://localhost:3306/registro?zeroDateTimeBehavior=CONVERT_TO_NULL";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="12345";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
            ResultSet rs;
            //smt = con.getConnection().createStatement();
            ps=con.prepareStatement("select * from persona");
            rs=ps.executeQuery();
        %>
        <div class="container">
            <h1>Empleados</h1>
            <hr>
            <div class="container">
                <form class="row g-3">
                    <div class="col-auto">
                        <a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> 
                       
                    </div>
                    <div class="col-auto">
                        
                        <input type="text" class="form-control" name="txtbuscar">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-info mb-3">Buscar</button>
                    </div>
                </form>
                <%
                    String nombuscar=request.getParameter("txtbuscar");
                    if(nombuscar != null){
                       ps=con.prepareStatement("select * from persona where Nombres like"+"'%"+nombuscar+"%'");
                       //rs=smt.executeQuery("select * from persona where Nombres like"+"'%"+nombuscar+"%'")
                       rs=ps.executeQuery();
                    
                    }else{
                        System.err.print("Error");
                    
                    }
                %>
            </div>
             <hr>
             <table class="table table-bordered">
                 <tr>
                     <th class="text-center">ID</th>
                     
                     <th class="text-center">DNI</th>
                     <th class="text-center">NOMBRE</th>
                     
                     <th class="text-center">ACCIONES</th>
                 
                 </tr>
                 <% 
                    while(rs.next()){
                                       
                     %>
                     <tr>
                         <td class="text-center"><%= rs.getInt("Id")%></td>
                         
                         <td class="text-center"><%= rs.getString("Dni")%></td>
                         <td class="text-center"><%= rs.getString("Nombres")%></td>
                         
                         <td class="text-center">
                             <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning">Editar</a>
                             <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger">Eliminar</a>
                         </td>
                     </tr>
                     <% } %>
             </table>
         </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
