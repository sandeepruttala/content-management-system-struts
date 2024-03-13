<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="global.css">
    <!-- Add your CSS links here -->
</head>
<body>

<h2>Register</h2>
<form action="RegisterServlet" method="post">
    <div>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <!-- Include additional fields as necessary -->
    <div>
        <button type="submit">Register</button>
    </div>
</form>

</body>
</html>
