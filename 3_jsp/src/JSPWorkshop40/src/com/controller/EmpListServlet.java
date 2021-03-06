package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.EmpDTO;
import com.service.EmpService;

@WebServlet("/EmpListServlet")
public class EmpListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmpService service = new EmpService();
        List<EmpDTO> list = service.select();

        request.setAttribute("list", list);
        // forward
        RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
        dis.forward(request, response);
    }

}
