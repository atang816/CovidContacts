<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <link href="https://fonts.googleapis.com/css2?family=Lora&family=Noto+Serif:wght@700&family=Open+Sans+Condensed:wght@300;700&family=Poppins:wght@500&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="../css/doctorstyle.css">
    <title>Covid Contacts Friends</title>
  </head>

    <body class="doctorpage">

        <h1 class=flist>Your Doctor</h1>

    <%
      String userID = request.getParameter("userDisplayID");

      int user = Integer.parseInt(userID);

      try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
        PreparedStatement ps = conn.prepareStatement("SELECT appointments.user_id_doc, user.first_name, user.last_name, user.email, user.phone FROM user, appointments, doctor WHERE appointments.user_id_doc = doctor.doctor_id AND doctor.doctor_id  = user.user_id AND appointments.user_id_p = ?;");


        ps.setInt(1, user);

        ResultSet rs = ps.executeQuery();

        while(rs.next())
        {
          out.println("ID: " + rs.getInt(1) + "<br/><br/>");
          out.println("First Name: " + rs.getString(2) + "<br/><br/>");
          out.println("Last Name: " + rs.getString(3) + "<br/><br/>");
          out.println("email: " + rs.getString(4) + "<br/><br/>");
          out.println("Personal Phone: " + rs.getString(5) + "<br/><br/>");
          

        }


      }
      catch(Exception e){
        out.println(e);
      }
    %>
  </body>
</html>
