<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
 body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .password-container {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        width: 350px;
    }

    .password-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .password-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    .password-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        transition: border-color 0.3s;
    }

    .password-container input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
    }

    .password-container button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        border: none;
        border-radius: 6px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .password-container button:hover {
        background: #0056b3;
    }

    .message {
        text-align: center;
        margin-top: 15px;
        color: red;
        font-weight: bold;
    }
</style>

<div class="password-container">
    <h2>Change Password</h2>
    <form action="change-password" method="post">
        <label for="currentPassword">Current Password</label>
        <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter current password" required>

        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>

        <label for="confirmPassword">Confirm New Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>

        <button type="submit">Change Password</button>
    </form>

    <!-- Example message placeholder -->
    <div class="message">${message}</div>
</div>
</html>