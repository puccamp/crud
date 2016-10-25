package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.FuncionarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcionario;

/**
 *
 * @author Breno Antunes
 */
@WebServlet(urlPatterns = {"/servletFuncionario"})
public class servletFuncionario extends HttpServlet {

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FuncionarioDao funcDao;

        try {
            funcDao = new FuncionarioDao();
            funcDao.removeFuncionario(Long.parseLong(request.getParameter("idExcluir")));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(servletFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Funcionario f = new Funcionario();
        f.setId(Long.parseLong(request.getParameter("id")));
        f.setNome(request.getParameter("nome"));
        f.setEmail(request.getParameter("email"));
        f.setCargo(request.getParameter("cargo"));
        f.setSalario(Double.parseDouble(request.getParameter("salario")));

        try {
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date result =  df.parse(request.getParameter("datanasc"));
            f.setDataNascimento(result);
        } catch (ParseException ex) {
            System.out.println("error: "+ ex);
        }
        FuncionarioDao funcDao;
        try {
            funcDao = new FuncionarioDao();
            funcDao.updateFuncionario(f);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(servletFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("index.jsp");

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        FuncionarioDao funcDao;
        
        if(request.getParameter("method") !=null && method.equals("delete")){
            this.doDelete(request, response);
        }else if(request.getParameter("method")!=null && method.equals("put")){
            try {
                funcDao = new FuncionarioDao();
                int userId = Integer.parseInt(request.getParameter("funcId"));
                Funcionario f = funcDao.getFuncById(userId);
                request.setAttribute("func", f);
                RequestDispatcher view = request.getRequestDispatcher("formFuncionario.jsp");
                view.forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(servletFuncionario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            if(!request.getParameter("id").equals("")){
                this.doPut(request, response);
            }else{
                Funcionario f = new Funcionario();
                f.setNome(request.getParameter("nome"));
                f.setEmail(request.getParameter("email"));
                f.setCargo(request.getParameter("cargo"));
                f.setSalario(Double.parseDouble(request.getParameter("salario")));

                try {
                    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                    Date result =  df.parse(request.getParameter("datanasc"));
                    f.setDataNascimento(result);
                } catch (ParseException ex) {
                    System.out.println("error: "+ ex);
                }

                try{
                    funcDao = new FuncionarioDao();
                    funcDao.addFuncionario(f);
                } catch (ClassNotFoundException ex) {
                    System.out.println("Error: " + ex);
                }

                response.sendRedirect("index.jsp");
            }
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void elseif(boolean b) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
