package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import java.util.ArrayList; 
import model.dao.AsiakasDao;
import model.Asiakas2;


@WebServlet("/asiakkaat2")
public class Asiakkaat2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Asiakkaat2() {
        super();
        System.out.println("asiakkaat2.asiakkaat2"); 
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("asiakkaat2.doGet"); 
		AsiakasDao dao=new AsiakasDao(); 
		ArrayList<Asiakas2>asiakkaat=dao.listaaKaikki(); 
		System.out.println(asiakkaat); 
		String strJSON = new JSONObject().put("asiakkaat2", asiakkaat).toString();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.println(strJSON);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("asiakkaat2.doPost"); 
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
