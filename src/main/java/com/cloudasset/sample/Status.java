package com.cloudasset.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Status extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Status() {
        super();
    }

    /*----------------------------------------------------- */
    /**
     * GetRequest, Called from the payment gateway. 
     * Send the Status, UUID in the Request.
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String status   = request.getParameter("status").toString();
		String uuid  = request.getParameter("uuid").toString();
		
		Global.statusMAp.put(uuid,status);
	}

	/* --------------------------------------------------- */
	/**
	 * PostRequest , forwards the request to GetRequest
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
