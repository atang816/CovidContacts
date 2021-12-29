<%@ page import = "java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Covid Contacts-user</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora&family=Noto+Serif:wght@700&family=Open+Sans+Condensed:wght@300;700&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <link rel = "stylesheet" href = "../css/style.css">
  </head>

  <body class = "signUpBody">
    <header>
      <p class="logo">COVID CONTACTS</p>

      <nav>
        <ul class = "indexlist">
          <li><a href="../html/index.html">Home</a></li>
          <li><a href="../html/friends.html">Contact List</a></li>
          <li><a href="../html/doctor.html">Doctor's Contact</a></li>
          <li><a href="../html/covidnews.html">Covid News</a></li>
        </ul>
        <a href = "../html/user.html" class="user-links">Account</a><br /><br />
        <a href="../html/signInSignUp.html" class="user-links">Sign Out</a>
      </nav>
    </header>
    <h1 class = "user">User Page</h1>

    <%

      String password = request.getParameter("password");
      String email = request.getParameter("email");


      try
      {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
        PreparedStatement ps = conn.prepareStatement("SELECT user.user_id, user.first_name, user.last_name, user.user_pass, user.email, user.phone FROM user WHERE user.email = ? AND user.user_pass = ?;");
        ps.setString(1,email);
        ps.setString(2,password);


        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
          out.println("Your ID: " + rs.getInt(1) + "<br/><br/>");
          out.println("First Name: " + rs.getString(2) + "<br/><br/>");
          out.println("Last Name: " + rs.getString(3) + "<br/><br/>");
          out.println("Password: " + rs.getString(4) + "<br/><br/>");
          out.println("email: " + rs.getString(5) + "<br/><br/>");
          out.println("Phone: " + rs.getString(6) + "<br/><br/>");
        }
      }
      catch(Exception e){
        out.println(e);
      }
    %>



  </body>
</html>
