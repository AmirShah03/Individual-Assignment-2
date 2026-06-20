<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
    
    
    if (p == null) {
        p = new ProfileBean();
        p.setStudentID("2024123456");
        p.setName("Ahmad Dani (Sila hantar borang)");
        p.setProgramme("CS230");
        p.setEmail("student@uitm.edu.my");
        p.setHobbies("Coding, Gaming, Reading");
        p.setIntroduction("Sistem sedia untuk menerima data. Pastikan borang dihantar melalui ProfileServlet.");
    }
%>
<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile Details</title>
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
            max-width: 650px;
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }

        .card-header {
            padding: 32px 32px 20px 32px;
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

        
        .success-banner {
            background: rgba(230, 246, 238, 0.8);
            border: 1px solid rgba(46, 204, 113, 0.3);
            border-radius: 16px;
            padding: 16px 20px;
            margin-bottom: 24px;
            color: #1e7e34;
            font-size: 0.95rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 12px rgba(46, 204, 113, 0.05);
        }

        .success-icon {
            background: #2ecc71;
            color: white;
            width: 22px;
            height: 22px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
            font-weight: bold;
        }

       
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 4px;
        }

        .form-group {
            flex: 1;
            margin-bottom: 20px;
            min-width: 200px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #656d7d;
        }

        
        .display-value {
            width: 100%;
            padding: 14px 18px;
            font-size: 0.95rem;
            background: rgba(240, 242, 245, 0.6);
            border-radius: 14px;
            color: #1a1d24;
            font-weight: 500;
            border: 1px solid rgba(255, 255, 255, 0.5);
            min-height: 50px;
            display: flex;
            align-items: center;
        }

        .display-value-text {
            align-items: flex-start;
            line-height: 1.5;
            display: block;
            white-space: pre-wrap;
            min-height: 100px;
            padding-top: 14px;
        }

        .student-id-highlight {
            font-weight: 700;
            color: #000000;
        }

        .programme-badge {
            background: #eef1f6;
            color: #4f5a70;
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
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

        .btn-primary {
            background: #1a1d24;
            color: #ffffff;
        }

        .btn-primary:hover {
            background: #2d323e;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: rgba(240, 242, 245, 0.9);
            color: #4a5060;
        }

        .btn-secondary:hover {
            background: #e4e7ed;
            transform: translateY(-1px);
        }

        
        @media (max-width: 576px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
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
            <h3>Profile Student Information</h3>
        </div>
        <div class="card-body">
            
            <div class="success-banner">
                <span class="success-icon">✓</span>
                <span>Profile successfully created!!!</span>
            </div>
            
            <form action="ProfileServlet" method="POST">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="studentId" value="<%= p.getStudentID() %>">
                <input type="hidden" name="name" value="<%= p.getName() %>">
                <input type="hidden" name="program" value="<%= p.getProgramme() %>">
                <input type="hidden" name="email" value="<%= p.getEmail() %>">
                <input type="hidden" name="hobbies" value="<%= p.getHobbies() != null ? p.getHobbies() : "" %>">
                <input type="hidden" name="bio" value="<%= p.getIntroduction() != null ? p.getIntroduction() : "" %>">

                <div class="form-row">
                    <div class="form-group">
                        <span class="form-label">Student ID</span>
                        <div class="display-value student-id-highlight"><%= p.getStudentID() %></div>
                    </div>
                    <div class="form-group">
                        <span class="form-label">Full name</span>
                        <div class="display-value"><%= p.getName() %></div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <span class="form-label">Programme</span>
                        <div class="display-value">
                            <span class="programme-badge"><%= p.getProgramme() %></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <span class="form-label">Email Address</span>
                        <div class="display-value"><%= p.getEmail() %></div>
                    </div>
                </div>

                <div class="form-group">
                    <span class="form-label">Hobbies/span>
                    <div class="display-value"><%= p.getHobbies() != null && !p.getHobbies().trim().isEmpty() ? p.getHobbies() : "-" %></div>
                </div>

                <div class="form-group">
                    <span class="form-label">Introduction</span>
                    <div class="display-value display-value-text"><%= p.getIntroduction() != null && !p.getIntroduction().trim().isEmpty() ? p.getIntroduction() : "" %></div>
                </div>
                
                <div class="button-group">
                    <a href="ProfileServlet?action=editForm&studentId=<%= p.getStudentID() %>" class="btn btn-primary">Update Profile</a>
                    <a href="ProfileServlet?action=view" class="btn btn-secondary">View Profile Registered</a>
                </div>
            </form>
            
        </div>
    </div>

</body>
</html>