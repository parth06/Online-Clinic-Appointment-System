package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class BookSlot_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Book Slot</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            HttpSession sess = request.getSession();
            if(sess.getAttribute("pid") == null){
                response.sendRedirect("PatLogin.jsp");
            }
            else{
                out.println("<h1>Welcome " + sess.getAttribute("pname") + "</h1>");
                out.println("<form action='DoLogout.jsp' method='POST'>");
                out.println("<input type='submit' value='Log out'><br><br>");
                out.println("</form>");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                //out.println(request.getAttribute("did"));
                out.println(request.getAttribute("sdate"));
                /*String sql = "SELECT * FROM `slot` WHERE `did`=1;//'" + request.getAttribute("did") + "' ";//and `date`='"+Date.valueOf(request.getAttribute("date").toString())+"'";
                ResultSet rs1 = st.executeQuery(sql);
                rs1.next();
               
                out.println(" <br><fieldset><legend>Slot Info</legend><table border='1'>");
                    int id1 = rs1.getInt(1);
                    int did = rs1.getInt(2);
                    Date d2 =rs1.getDate(3);
                    String fromt=rs1.getString(4);
                    String tot=rs1.getString(5);
                    int booked = rs1.getInt(6);
                    out.println("<tr><th>id </th><th>Doctor Id </th><th>Date </th><th>from </th><th>to </th><th>Booked</th></tr>");
                    out.println("<tr><td>"+id1+"</td><td>"+did+"</td><td>"+d2+"</td><td>"+fromt+"</td><td>"+tot+"</td><td>"+booked+"</td>");
                out.println("</table></fieldset>");
                rs1.close();
                
                int h1=Character.getNumericValue(fromt.charAt(0));
                int h2=Character.getNumericValue(fromt.charAt(1));
                int h=(h1*10)+h2;
                
                int m1=Character.getNumericValue(fromt.charAt(3));
                int m2=Character.getNumericValue(fromt.charAt(4));
                int m=(m1*10)+m2;
                
                m=m+5;
                if(m>=60)
                {
                    h=h+1;
                    m=m-60;
                }
                booked+=1;
                out.println("Your Appoinment Booked at "+h +"hour "+m+"min.");

                sql = " UPDATE `slot` SET`booked`='"+booked+"' WHERE `did`='" + request.getAttribute("did") + "' ";
                st.executeUpdate(sql);
                conn.close();
                */
            }
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
