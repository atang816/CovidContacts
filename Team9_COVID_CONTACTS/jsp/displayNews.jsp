<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <link href="https://fonts.googleapis.com/css2?family=Lora&family=Noto+Serif:wght@700&family=Open+Sans+Condensed:wght@300;700&family=Poppins:wght@500&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="../css/covidstyle.css">
    <title>Covid Contacts Friends</title>
  </head>

    <body class="newspage">
      <h1 class = "news">Covid News</h1>

  <%
    String category = request.getParameter("category");
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("SELECT sources.category, stories.title, stories.description, sources.article_url FROM sources, stories WHERE sources.article_id = stories.article_id AND sources.category = ?;");

      ps.setString(1,category);

      ResultSet rs = ps.executeQuery();

      while(rs.next())
      {
        out.println("News Category: " + rs.getString(1) + "<br/><br/>");
        out.println("Title: " + rs.getString(2) + "<br/><br/>");
        out.println("Story Description: " + rs.getString(3) + "<br/><br/>");
        out.println("Story URL: " +rs.getString(4) + "<br/><br/>");


      }
    }
    catch(Exception e){
      out.println(e);
    }
  %>

  </body>
</html>
