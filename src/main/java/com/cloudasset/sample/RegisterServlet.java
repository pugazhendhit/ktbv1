package com.cloudasset.sample;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.cloudasset.model.UserKTB;
import com.cloudasset.service.RegisterService;

public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

    /*------------------------------------------------ */
	/**
	 * Registers the user, and creates the customer_id in payment gateway.
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String url = "http://119.160.221.121:3210/ecom/customers/";
		
		try {
			String firstname = request.getParameter("fn");
			String lastname  = request.getParameter("ln");
			String usr       = request.getParameter("em");
			String pwd       = request.getParameter("ps");
			String customer_id = null; 
			String responseJson = null;
			
			if(usr == null || usr.length()<1){
				responseJson ="{\"status\":\"Registration Failed \",\"customer_id\":\""+customer_id+"\"}";
			}else{
				String json ="{\"secret_token\":\"abc123\",\"email\":\""+usr+"\","
						+ "\"name\":\""+firstname+"\"}";
			    HttpClient httpClient = HttpClientBuilder.create().build();
				HttpPost postRequest = new HttpPost(url);
				postRequest.addHeader("Accept", "application/json");
				StringEntity input = new StringEntity(json);
				input.setContentType("application/json");
				postRequest.setEntity(input);
				HttpResponse response1 = httpClient.execute(postRequest);
				BufferedReader rd = new BufferedReader(new InputStreamReader(response1.getEntity().getContent()));
		        String line  = "";
	            if(response1.getStatusLine().getStatusCode() == 201) {
		            while ((line = rd.readLine()) != null) {
		               JSONParser j = new JSONParser();
		               JSONObject o = (JSONObject)j.parse(line);
		               customer_id = (String) o.get("customer_id");
		            }
	            }
	            
	            
	            UserKTB userobj = new UserKTB(customer_id, usr, firstname, lastname, pwd);
	            RegisterService service = new RegisterService();
	            boolean result = service.register(userobj);
	            
	            if(result){
	            	
	            	HttpSession session = request.getSession();
					session.setAttribute("user", usr);
					session.setMaxInactiveInterval(30*60);
					 responseJson ="{\"status\":\"Registerd Successfully\",\"customer_id\":\""+customer_id+"\"}";
	            }else{
	            	 responseJson ="{\"status\":\"User already registered.\",\"customer_id\":\""+customer_id+"\"}";
	            }
	    	
	           
			}
			response.setContentType("application/json");
			response.getWriter().write(responseJson);
		
		}catch (Exception e) {
				e.printStackTrace();
	    }
	}

}
