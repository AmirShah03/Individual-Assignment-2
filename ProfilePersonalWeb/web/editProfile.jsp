<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #e3e6ec 0%, #f3f5f8 100%);
            color: #2c3038;
            padding: 40px 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        
        .bento-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            width: 100%;
            max-width: 600px;
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }

        .card-header {
            padding: 28px 32px 20px 32px;
            text-align: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.04);
        }

        .card-header h3 {
            font-size: 1.45rem;
            font-weight: 600;
            color: #1a1d24;
            letter-spacing: -0.5px;
        }

        .card-body {
            padding: 32px;
        }

        
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #656d7d;
        }

        .form-control {
            width: 100%;
            padding: 14px 18px;
            font-size: 0.95rem;
            background: rgba(240, 242, 245, 0.7);
            border: 1px solid transparent;
            border-radius: 14px;
            color: #2c3038;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-control:focus {
            background: #ffffff;
            border-color: rgba(0, 0, 0, 0.1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        }

        
        .form-control-readonly {
            background: rgba(228, 231, 237, 0.5);
            color: #7a8293;
            cursor: not-allowed;
            font-weight: 500;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }

        
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 28px;
        }

        .btn {
            padding: 14px 24px;
            font-size: 0.95rem;
            font-weight: 600;
            border-radius: 14px;
            cursor: pointer;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            width: 100%;
        }

        
        .btn-update {
            background: #1a1d24;
            color: #ffffff;
        }

        .btn-update:hover {
            background: #2d323e;
            transform: translateY(-1px);
        }

        .btn-cancel {
            background: rgba(240, 242, 245, 0.9);
            color: #4a5060;
        }

        .btn-cancel:hover {
            background: #e4e7ed;
            transform: translateY(-1px);
        }

        
        .error-message {
            text-align: center;
            padding: 20px;
            color: #cc2900;
            font-weight: 500;
        }

        @media (max-width: 480px) {
            .card-body {
                padding: 24px;
            }
            .card-header {
                padding: 24px 20px 16px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="bento-card">
        <div class="card-header">
            <h3>Update Student Profile Record</h3>
        </div>
        <div class="card-body">
            <% if(p != null) { %>
            <form action="ProfileServlet" method="POST">
                <input type="hidden" name="action" value="update">
                
                <div class="form-group">
                    <label class="form-label">Student ID (Read-only)</label>
                    <input type="text" name="studentId" class="form-control form-control-readonly" value="<%= p.getStudentID() %>" readonly>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" value="<%= p.getName() %>" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Programme</label>
                    <input type="text" name="program" class="form-control" value="<%= p.getProgramme() %>" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="email" class="form-control" value="<%= p.getEmail() %>" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Hobbies</label>
                    <input type="text" name="hobbies" class="form-control" value="<%= p.getHobbies() != null ? p.getHobbies() : "" %>">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Biography / Introduction</label>
                    <textarea name="bio" class="form-control" rows="3"><%= p.getIntroduction() != null ? p.getIntroduction() : "" %></textarea>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-update">Save Changes</button>
                    <a href="ProfileServlet?action=view" class="btn btn-cancel">Cancel</a>
                </div>
            </form>
            <% } else { %>
                <p class="error-message">Profile data error: Record not found.</p>
            <% } %>
        </div>
    </div>

</body>
</html>