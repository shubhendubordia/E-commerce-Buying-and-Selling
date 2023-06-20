
package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entites.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
//            AUTHENTICATING USER
            UserDao userdao = new UserDao(FactoryProvider.getFactory());
            User user = userdao.getUserByEmailAndPassword(email, password);
            HttpSession httpSession = request.getSession();
            if(user == null){
                
                httpSession.setAttribute("message", "Invalid Details!! try with another one");
                response.sendRedirect("login.jsp");
//                return;
            }else{
                out.println("<h1> Welcome "+user.getUserName()+"</h1>");
                
                httpSession.setAttribute("currentuser",user);
                
               
                if(user.getUserType().equals("admin")){
                    
                    response.sendRedirect("admin.jsp");
                }
                
                if(user.getUserType().equals("normal")){
                    
                    response.sendRedirect("normal.jsp");
                }
                else{
//                  response.sendRedirect("normal.jsp");
                    response.sendRedirect("admin.jsp");
//                    out.println("we have not identify user type");
                       
                }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
