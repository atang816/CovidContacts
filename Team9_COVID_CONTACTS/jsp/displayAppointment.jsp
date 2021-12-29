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

        <h1 class="flist">Your Appointments</h1>

  <%

    String userID = request.getParameter("userID");
    int user = Integer.parseInt(userID);


    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("SELECT user.first_name, user.last_name, hospital, symptoms, time_slot FROM appointments, user, doctor WHERE appointments.user_id_doc = doctor.doctor_id AND doctor.doctor_id  = user.user_id AND appointments.user_id_p = ?;");

      ps.setInt(1, user);


      ResultSet rs = ps.executeQuery();

      while(rs.next())
      {
        out.println("Doctor Name: " + rs.getString(1) + " " + rs.getString(2) + "<br/><br/>");
        out.println("Hospital: " +rs.getString(3) + "<br/><br/>");
        out.println("Symptoms: " + rs.getString(4) + "<br/><br/>");
        out.println("Date_Slot: " +rs.getString(5) + "<br/><br/>");

      }
    }
    catch(Exception e){
      out.println(e);
    }
  %>
  </body>
</html>
