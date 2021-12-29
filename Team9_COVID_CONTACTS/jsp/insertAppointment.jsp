<%@ page import = "java.sql.*"%>

  <%
    String doctorID = request.getParameter("doctorID");
    int doctor = Integer.parseInt(doctorID);
    String userID = request.getParameter("userID");
    int user = Integer.parseInt(userID);
    String symptoms = request.getParameter("symptoms");
    String date = request.getParameter("time_slot");

    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("INSERT INTO appointments (user_id_doc, user_id_p, symptoms, time_slot) VALUES (?, ?, ?, ?);");

      ps.setInt(1, doctor);
      ps.setInt(2, user);
      ps.setString(3, symptoms);
      ps.setString(4, date);

      int x = ps.executeUpdate();
      if(x>0)
      {
        %> <jsp:include page="success.jsp"/> <%
        out.println("Success");
      }
      else
      {
        out.println("Fail");
      }
    }
    catch(Exception e){
      out.println(e);
    }
  %>
