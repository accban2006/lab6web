package com.student.controller;

import com.student.dao.UserDAO;
import com.student.model.User;
import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/change-password")
public class ChangePasswordController extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(); // initialize DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to JSP form
        request.getRequestDispatcher("/change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        String message;

        // Validate current password using BCrypt
        if (!BCrypt.checkpw(currentPassword, user.getPassword())) {
            message = "Current password is incorrect.";
        }
        // Validate new password length
        else if (newPassword == null || newPassword.length() < 8) {
            message = "New password must be at least 8 characters long.";
        }
        // Confirm new password matches
        else if (!newPassword.equals(confirmPassword)) {
            message = "New password and confirmation do not match.";
        }
        else {
            // Update in database (DAO will hash with BCrypt)
            boolean updated = userDAO.updatePassword(user.getId(), newPassword);

            if (updated) {
                // Update session user with new hashed password
                user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt()));
                session.setAttribute("user", user);

                message = "Password changed successfully!";
            } else {
                message = "Error updating password. Please try again.";
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("views/change-password.jsp").forward(request, response);
    }
}