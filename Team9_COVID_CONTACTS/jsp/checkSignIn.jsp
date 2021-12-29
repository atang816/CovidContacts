<%@ page import = "java.sql.*"%>

  <!DOCTYPE html>
  <html lang="en" dir="ltr">
    <head>
      <meta charset="utf-8">
      <title></title>
    </head>
    <body>
      <%! String email, password; %>
      <%
        email = request.getParameter("email");
        password = request.getParameter("password");
        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
          PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE email = ? AND user_pass = ?");

          ps.setString(1,email);
          ps.setString(2,password);

          ResultSet rs = ps.executeQuery();

          boolean check = false;
          while(rs.next())
          {
            out.println("ID: " + rs.getInt(1) + "<br/><br/>");
            out.println("FName: " + rs.getString(2) + "<br/><br/>");
            out.println("\t\t"+ "LName: " +rs.getString(3) + "<br/><br/>");
            out.println("\t\t"+ "Password: " + rs.getString(4) + "<br/><br/>");
            out.println("\t\t"+ "email: " +rs.getString(5) + "<br/><br/>");
            out.println("\t\t"+ "phone: " +rs.getString(6) + "<br/><br/>");
            check = true;

          }


        if(check == true)
        {
          out.println("Successful login");
          %> <jsp:include page="success.jsp"/> <%
        }
        else
        {
          out.println("Try again");
          %> <jsp:include page="redirect.jsp"/> <%
        }
      }
        catch(Exception e)
        {
          out.println("SQLException caught: " + e.getMessage());
        }
        %>
    </body>
  </html>
