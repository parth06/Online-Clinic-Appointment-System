package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class DocDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Doctor Dashboard</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       ");

            HttpSession sess = request.getSession();
            if(sess.getAttribute("did") == null){
                response.sendRedirect("DocLogin.jsp");
            }
            else{
                out.println("<h1>Welcome " + sess.getAttribute("dname") + "</h1>");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                String sql = "SELECT * FROM doctor WHERE `id`='" + sess.getAttribute("did") + "'";
                ResultSet rs = st.executeQuery(sql);
                rs.next();
                String db_password = rs.getString("password");
                int id=rs.getInt(1);
                String dname=rs.getString(2);
                String duname=rs.getString(3);
                String password=rs.getString(4);
                String special=rs.getString(5);
                String phone=rs.getString(6);
                String address=rs.getString(7);
                
                out.println("<form action='DoLogout.jsp' method='POST'>");
                out.println("<input type='submit' value='Log out'><br><br>");
                out.println("</form>");
            }
        
      out.write("\n");
      out.write("         <fieldset><legend>Doctor Registration Page</legend>\n");
      out.write("        <form action=\"doRegDoc.jsp\" method=\"post\">\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Name : </td>\n");
      out.write("                <td>");
      out.print( id);
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Username : </td>\n");
      out.write("                <td><input type=\"text\" name=\"duname\" /></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Password : </td>\n");
      out.write("\t\t<td><input type=\"password\" name=\"password\"/></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>specialization </td>\n");
      out.write("\t\t<td><input type=\"text\" name=\"special\" /></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Phone No </td>\n");
      out.write("\t\t<td><input type=\"text\" name=\"phone\" /></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Address </td>\n");
      out.write("\t\t<td><input type=\"text\" name=\"address\" /></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\t\t<td>Submit</td>\n");
      out.write("\t\t<td><button>Submit</button></td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        </form>\n");
      out.write("        </fieldset>\n");
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
