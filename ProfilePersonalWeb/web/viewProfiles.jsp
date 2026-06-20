<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ProfileBean"%>
<%
    List<ProfileBean> listProfiles = (List<ProfileBean>) request.getAttribute("listProfiles");
    String currentSearch = (String) request.getAttribute("currentSearch");
    String currentFilter = (String) request.getAttribute("currentFilter");
    if(currentSearch == null) currentSearch = "";
    if(currentFilter == null) currentFilter = "";
%>
<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Student Profiles</title>
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
        }

        .dashboard-container {
            width: 100%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        
        .dashboard-header {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            padding: 24px 32px;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.04);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dashboard-header h1 {
            font-size: 1.6rem;
            font-weight: 600;
            color: #1a1d24;
            letter-spacing: -0.5px;
        }

        
        .search-bento-block {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            padding: 20px 24px;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.04);
        }

        .filter-form {
            display: grid;
            grid-template-columns: 2fr 2fr 1fr;
            gap: 16px;
            align-items: center;
        }

        .input-group {
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 14px 20px;
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

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        
        .btn {
            padding: 12px 24px;
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

        .btn-action {
            padding: 8px 16px;
            font-size: 0.85rem;
            border-radius: 10px;
        }

        
        .table-bento-block {
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.03);
            overflow: hidden;
            padding: 16px;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        
        .bento-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px; 
            text-align: left;
        }

        .bento-table th {
            padding: 16px 24px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #7a8293;
            border: none;
        }

        .bento-table tbody tr {
            background: #ffffff;
            transition: all 0.2s ease;
        }

        
        .bento-table tbody tr td:first-child {
            border-top-left-radius: 16px;
            border-bottom-left-radius: 16px;
            padding-left: 28px;
        }

        .bento-table tbody tr td:last-child {
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
            padding-right: 28px;
        }

        .bento-table td {
            padding: 20px 24px;
            font-size: 0.95rem;
            color: #383e4c;
            vertical-align: middle;
            border-top: 1px solid rgba(240, 242, 245, 0.5);
            border-bottom: 1px solid rgba(240, 242, 245, 0.5);
        }

        .bento-table tbody tr:hover {
            transform: scale(1.006);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.02);
            background: #fafbfc;
        }

        
        .student-id {
            font-weight: 700;
            color: #1a1d24;
        }

        .student-name {
            font-weight: 500;
            color: #2c3038;
        }

        
        .programme-badge {
            background: #eef1f6;
            color: #4f5a70;
            padding: 6px 14px;
            border-radius: 10px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
        }

        
        .row-actions {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn-edit {
            background: #fff4e5;
            color: #b26200;
        }
        .btn-edit:hover { background: #ffe9cc; }

        .btn-delete {
            background: #ffebe6;
            color: #cc2900;
        }
        .btn-delete:hover { background: #ffd6cc; }

        .empty-state {
            text-align: center;
            padding: 48px !important;
            color: #7a8293;
            font-style: italic;
        }

        
        @media (max-width: 992px) {
            .filter-form {
                grid-template-columns: 1fr;
                gap: 12px;
            }
            .dashboard-header {
                flex-direction: column;
                gap: 16px;
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        
        <div class="dashboard-header">
            <h1>Registered Student Profiles</h1>
            <a href="menu.html" class="btn btn-secondary">Back to Menu</a>
        </div>
        
        <div class="search-bento-block">
            <form action="ProfileServlet" method="GET" class="filter-form">
                <input type="hidden" name="action" value="view">
                
                <div class="input-group">
                    <input type="text" name="searchQuery" class="form-control" 
                           placeholder="Search by Student ID or Name..." value="<%= currentSearch %>">
                </div>
                
                <div class="input-group">
                    <input type="text" name="filterProgramme" class="form-control" 
                           placeholder="Filter by Programme (e.g. CS230)..." value="<%= currentFilter %>">
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn btn-primary" style="flex: 1;">Apply</button>
                    <a href="ProfileServlet?action=view" class="btn btn-secondary" style="flex: 1;">Reset</a>
                </div>
            </form>
        </div>

        <div class="table-bento-block">
            <div class="table-container">
                <table class="bento-table">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Programme</th>
                            <th>Email</th>
                            <th>Hobbies</th>
                            <th>Introduction</th>
                            <th style="text-align: center; width: 160px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if(listProfiles != null && !listProfiles.isEmpty()) {
                                for(ProfileBean p : listProfiles) {
                        %>
                        <tr>
                            <td><span class="student-id"><%= p.getStudentID() %></span></td>
                            <td><span class="student-name"><%= p.getName() %></span></td>
                            <td><span class="programme-badge"><%= p.getProgramme() %></span></td>
                            <td><%= p.getEmail() %></td>
                            <td><%= p.getHobbies() != null ? p.getHobbies() : "-" %></td>
                            <td><%= p.getIntroduction() != null ? p.getIntroduction() : "-" %></td>
                            <td>
                                <div class="row-actions">
                                    <a href="ProfileServlet?action=editForm&studentId=<%= p.getStudentID() %>" class="btn btn-action btn-edit">Edit</a>
                                    <a href="ProfileServlet?action=delete&studentId=<%= p.getStudentID() %>" 
                                       class="btn btn-action btn-delete" 
                                       onclick="return confirm('Are you sure you want to delete profile for <%= p.getName() %>?');">Delete</a>
                                </div>
                            </td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="7" class="empty-state">No registered student profiles found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
    </div>

</body>
</html>