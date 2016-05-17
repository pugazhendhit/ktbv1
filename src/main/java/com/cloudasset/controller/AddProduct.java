package com.cloudasset.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cloudasset.model.Product;

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String pid = request.getParameter("pid");
		    String name = request.getParameter("name");
		    String ctg = request.getParameter("ctg");
		    String price = request.getParameter("price");
		    String img = request.getParameter("img");
		    
		    Product product = new Product();
		    product.setImagepath(img);
		    product.setName(name);
		    product.setUnitPrice(price);
		    product.setDesc(ctg);
		    product.setCode(pid);
		    
		    HttpSession session = request.getSession();
		    if (session.getAttribute("cart") != null)
		    {
		      List<Product> cart = (List)session.getAttribute("cart");
		      cart.add(product);
		      session.setAttribute("cart", cart);
		      session.setMaxInactiveInterval(1800);
		    }
		    else
		    {
		      List<Product> cart = new ArrayList();
		      cart.add(product);
		      session.setAttribute("cart", cart);
		      session.setMaxInactiveInterval(1800);
		    }
		    System.out.println(pid + "," + name + "," + ctg + "," + price + "," + img);
		    
		    response.getWriter().append("Served at: ").append(request.getContextPath());
		  }
		  
		  protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException
		  {
		    doGet(request, response);
		  }

}
