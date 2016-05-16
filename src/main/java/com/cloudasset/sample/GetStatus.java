package com.cloudasset.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetStatus extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public GetStatus() {
        super();
    }

    /* -------------------------------------------- */
    /**
     * Get Request
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uuid = request.getParameter("uuid").toString();
		String status = Global.statusMAp.get(uuid);
		String invoiceId = Global.invoiceMAp.get(uuid) ;
		String json ="{\"staus\":\""+status+"\",\"invoiceId\":\""+invoiceId+"\"}";
		response.setContentType("application/json");
		response.getWriter().write(json);
	}
	
	
	/*-------------------------------------------- */ 
	/**
	 * Post Request
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
