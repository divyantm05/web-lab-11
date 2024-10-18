
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;


//@WebServlet(urlPatterns = {"/mathservlet"})
public class MathServlet extends HttpServlet {
    ArrayList<String>list=new ArrayList<>();
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
        double num1=Double.parseDouble(req.getParameter("num1"));
        double num2=Double.parseDouble(req.getParameter("num2"));
        String operation=(String)req.getParameter("operation");
        String op="";
        String result="";
        if(operation==null)
            operation="+";
        switch(operation){
            case "add":
                result=(num1+num2)+"";
                op="+";
                break;
            case "sub":
                result=(num1-num2)+"";
                op="-";
                break;
            case "mult":
                result=(num1*num2)+"";
                op="*";
                break;
            case "divide":
                if(num2==0){
                    req.setAttribute("error","can't divide by 0");
                    op="/";
                    result="error";
                    break;
                }else{
                    result=(num1/num2)+"";
                    op="/";
                    break;
                }
                
        }
        list.addFirst(new String(num1+" "+op+" "+num2+" = "+result));
        req.setAttribute("result", result);
        req.setAttribute("list",list);
        req.getRequestDispatcher("index.jsp").forward(req, res);
    }
    
}