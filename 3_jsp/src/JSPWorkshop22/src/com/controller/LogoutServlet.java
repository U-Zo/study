package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // 세션에서 사용자 정보 얻기
        HttpSession session = request.getSession();
        MemberDTO dto = (MemberDTO) session.getAttribute("login");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print("<html>");
        out.print("<body>");

        if (dto == null) {
            // 로그인 화면으로 유도
            response.sendRedirect("loginForm.html");
        } else {
            // 세션정보 삭제
            session.invalidate();
            out.print("정상적으로 로그아웃");
            out.print("<a href='loginForm.html'>로그인 화면</a>");
        }
        out.print("</body>");
        out.print("</html>");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
