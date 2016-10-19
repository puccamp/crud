package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import controllers.FuncionarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcionario;

/**
 *
 * @author developer
 */
@WebServlet(urlPatterns = {"/addFuncionario"})
public class servletAddFuncionario extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            FuncionarioDao funcDao = new FuncionarioDao();
            funcDao.addFuncionario(f);
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error: " + ex);
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
