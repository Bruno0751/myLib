package controll;

import dao.ClienteDao;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.Cliente;
import persistence.ConexaoMysqlBruno;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 20/04/2022
 */
public class ServPricipal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conexaoMysqlBruno = null;
        try {
            conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            String req = request.getRequestURI();
            System.out.println(req);
            switch (req) {
                case "/myLib/prj":
                case "/myLib/msc":
                case "/myLib/minhasMusicas":
                case "/myLib/money":
                    this.requisitar(request);
                    response.sendRedirect("index.jsp");
                    break;
                case "/myLib/adicionarCliente":
                    this.insertCliente(request);
                    response.sendRedirect("loader.jsp");
                    break;
                case "/teste":
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet ServPricipal</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Servlet ServPricipal at " + request.getContextPath() + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                    break;
            }
        } catch (Exception e) {
            System.out.println("ERRO REQUEST");
            JOptionPane.showMessageDialog(null, "ERRO REQUEST", "ERRO", JOptionPane.ERROR_MESSAGE);
            response.sendRedirect("index.jsp");
        } finally {
            if (conexaoMysqlBruno != null) {
                conexaoMysqlBruno.close();
                System.out.println("fechow conexaoMysqlBruno");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServPricipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServPricipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void requisitar(HttpServletRequest request) throws IOException {
        if (request.getRequestURI().equals("/myLib/prj")) {
            Desktop.getDesktop().open(new File("D:\\PrjDesktopJava\\myLib"));
        }
        if (request.getRequestURI().equals("/myLib/money")) {
            Desktop.getDesktop().open(new File("D:\\Documents\\MONEY"));
        }
        if (request.getRequestURI().equals("/myLib/msc")) {
            Desktop.getDesktop().open(new File("D:\\Music"));
        }
        if (request.getRequestURI().equals("/myLib/minhasMusicas")) {
            Desktop.getDesktop().open(new File("D:\\minhas_musicas"));
        }
    }

    private void insertCliente(HttpServletRequest request) throws Exception {
        Cliente obj = new Cliente();
        obj.setNome(request.getParameter("txtNome"));
        obj.setIdade(Integer.parseInt(request.getParameter("numIdade")));
        obj.setEnviarEmail(request.getParameter("email"));
        if (obj.getEnviarEmail().equals("sim")) {
            obj.setEmail(true);
        } else if (obj.getEnviarEmail().equals("nao")) {
            obj.setEmail(false);
        }
        obj.setTipo(Byte.parseByte(request.getParameter("slTipo")));
        System.out.println(obj.toString());
        ClienteDao.insertCliente(obj);
    }

}
