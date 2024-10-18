<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator</title>
        <style>
            * {
                font-family: 'Roboto', Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
    
            body {
                background-color: #f5f5f5;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                /* min-height: 100vh; */
            }
    
            .input-container {
                width: 400px;
                padding: 20px;
                background-color: white;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin-bottom: 20px;
                display: flex;
                justify-content: center;
            }
    
            input[type="number"] ,select{
                width: 300px;
                height: 40px;
                padding: 0 10px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 16px;
                margin-top: 10px;
            }
    
            button {
                height: 40px;
                padding: 0 20px;
                background-color: #6200ee;
                color: white;
                border: none;
                border-radius: 6px;
                font-size: 16px;
                cursor: pointer;
                display: block;
                margin: auto;
                margin-top: 20px;
            }
    
            .task-container {
                width: 400px;
                background-color: white;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                padding: 20px;
                min-height:300px;
            }
    
            ul {
                list-style-type: none;
                padding: 0;
            }
    
            li {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 0;
                border-bottom: 1px solid #ddd;
                color: blue;
                font-family: cursive;
            }
    
            li:last-child {
                border-bottom: none;
            }
    
            /* button {
                background-color: #e53935;
                color: white;
                border: none;
                padding: 6px 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            } */
    
            button:hover {
                background-color: #d32f2f;
            }
            .result{
                color: rgb(0, 224, 0);
                font-size: 30px;
                text-align: center;
                font-weight: 400;
                width: 400px;
                background-color: white;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 10px;
            }
            
            </style>
    </head>
    <body>
        <h1>calculator</h1>
        <%
            String error=(String)request.getAttribute("error");
            if(error!=null){
            
        %>
            <p style="color:red;"><%= error%></p>
        <%}%>
        <div class="input-container">

       
        <form method="post" action="mathservlet" >
            <input type="number" name="num1" placeholder="num1" required/><br>
            <select name="operation">
                <option value="add">+</option>
                <option value="sub">-</option>
                <option value="mult">*</option>
                <option value="divide">/</option>
            </select>
            <br>
            <input type="number" name="num2" placeholder="num2" required/><br>
            <button type="submit">Calculate</button>
        </form>
    </div>
        <%
            String result=(String)request.getAttribute("result");
            if(result!=null){
            %>
            <p class="result">Result : <%= result%></p>
            <div class="task-container">

            <ul>
            <%}
                ArrayList<String>list=(ArrayList<String>)request.getAttribute("list");
                if(list!=null){
                    for(String item:list){%>
             <li><%=item%></li>
                    <%}

                }
            %>
            </ul>
        </div>
    </body>
</html>
