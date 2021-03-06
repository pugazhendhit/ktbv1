package com.cloudasset.sample;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.cloudasset.model.UserKTB;
import com.cloudasset.service.LoginService;

public class ProcessHandler extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private static final int START = 100000000;
	private static final int END   = 999999999;
	
    public ProcessHandler() {
    }

	/* ------------------------------------------- */
    /**
     * Get Request
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		    String local_ip = "10.144.97.193:3000/ktb";
//		    String landing_ip = "119.160.221.121:3080/ktb";
//          String url = "http://10.144.97.193:3000/ecom/invoices/";
		
		    String local_ip = "ktb-env.4nbepqprui.us-west-2.elasticbeanstalk.com";
		    String landing_ip = "ktb-env.4nbepqprui.us-west-2.elasticbeanstalk.com";
	    	String url = "http://119.160.221.121:3210/ecom/invoices/";
	    	
	     	 String paymentToken = null;
	     	 String message = null;
	 		 String json = null;
	 		 
		     try {
		    	LoginService service = new LoginService();
		    
	    		UserKTB user = service.getUserByUserId(request.getParameter("s"));
				String uniqueID = UUID.randomUUID().toString();
				
				// if customer id is present.
				if(user!= null){
					json ="{\"secret_token\":\"abc123\",\"amount\":\""+request.getParameter("p")+"\","
						+ "\"currency\":\"THB\","
						+ "\"status_url\":\"http://"+local_ip+"/status.do?uuid="+uniqueID+"\","
						+ "\"customer_id\":\""+user.getCustomerid()+"\","
						+ "\"collect_addresses\":\""+0+"\","
						+ "\"landing_url\":\"http://"+landing_ip+"/order.jsp?uuid="+uniqueID+"\"}";
				}else{
					json ="{\"secret_token\":\"abc123\",\"amount\":\""+request.getParameter("p")+"\","
							+ "\"currency\":\"THB\","
							+ "\"collect_addresses\":\""+0+"\","
							+ "\"status_url\":\"http://"+local_ip+"/status.do?uuid="+uniqueID+"\","
							+ "\"landing_url\":\"http://"+landing_ip+"/order.jsp?uuid="+uniqueID+"\"}";
				}
				
				System.out.println("******* invoices api call logs *************");
				System.out.println("URL : http://119.160.221.121:3210/ecom/invoices/");
				System.out.println("JSON Request: "+json);
			    HttpClient httpClient = HttpClientBuilder.create().build();
				HttpPost postRequest = new HttpPost(url);
				postRequest.addHeader("Accept", "application/json");
				StringEntity input = new StringEntity(json);
				input.setContentType("application/json");
				postRequest.setEntity(input);
				HttpResponse response1 = httpClient.execute(postRequest);
				BufferedReader rd = new BufferedReader(new InputStreamReader(response1.getEntity().getContent()));
		        String line  = "";
	            if(response1.getStatusLine().getStatusCode() == 201){
		            while ((line = rd.readLine()) != null) {
		               System.out.println("JSON Response: "+line);
		               JSONParser j = new JSONParser();
		               JSONObject o = (JSONObject)j.parse(line);
		               paymentToken = (String) o.get("payment_token");
		               message = (String) o.get("message");
		            }
		        	Global.uuidMAp.put(paymentToken,uniqueID);
		        	Global.invoiceMAp.put(uniqueID,nextIntInRange(START,END,new Random())+"");
	            }
	        	System.out.println("******* end *************");
			  } catch (Exception e) {
				e.printStackTrace();
			  } 
		     
		     System.out.println("******* Redirecting to payment gateway page *************");
		     System.out.println("http://119.160.221.121:3210/ecom/payments/");
		     
		     response.sendRedirect("http://119.160.221.121:3210/ecom/payments/"+paymentToken);
	}
	
	/* ------------------------------------------- */
	/**
	 * Post Request
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	/* -------------------------------------------- */
	/**
	 * Generating the random trasnction id
	 * @param min
	 * @param max
	 * @param rng
	 * @return
	 */
	private int nextIntInRange(int min, int max, Random rng) {
		   if (min > max) {
		      throw new IllegalArgumentException("Cannot draw random int from invalid range [" + min + ", " + max + "].");
		   }
		   int diff = max - min;
		   if (diff >= 0 && diff != Integer.MAX_VALUE) {
		      return (min + rng.nextInt(diff + 1));
		   }
		   int i;
		   do {
		      i = rng.nextInt();
		   } while (i < min || i > max);
		   return i;
	}



}
