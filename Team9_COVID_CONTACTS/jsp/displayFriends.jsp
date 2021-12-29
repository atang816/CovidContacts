<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <link href="https://fonts.googleapis.com/css2?family=Lora&family=Noto+Serif:wght@700&family=Open+Sans+Condensed:wght@300;700&family=Poppins:wght@500&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="../css/friendstyle.css">
    <title>Covid Contacts Friends</title>
  </head>

    <body class="groupChatLayout">
        <h1 class=flist>Your Contacts</h1>

    <%
      String userID = request.getParameter("userDisplayID");
      int user = Integer.parseInt(userID);
      try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
        PreparedStatement ps = conn.prepareStatement("SELECT first_name, last_name, phone, email FROM user, friends WHERE user.user_id = friends.user_id2 AND friends.user_id1 = ?;");
        ps.setInt(1, user);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
          out.println("Name: " + rs.getString(1) + " " + rs.getString(2) + "<br/><br/>");
          out.println("Phone Number: " + rs.getString(3) + "<br/><br/>");
          out.println("email: " + rs.getString(4) + "<br/><br/>");
        }
      }
      catch(Exception e){
        out.println(e);
      }
    %>
  </body>
</html>
