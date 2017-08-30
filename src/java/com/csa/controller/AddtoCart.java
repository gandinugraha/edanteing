/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.controller;

import com.csa.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DiTz
 */
public class AddtoCart extends HttpServlet {

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
          HttpSession session = request.getSession();
            String proses = request.getParameter("proses");
            int idRemove = Integer.parseInt(request.getParameter("id"));
            if(proses!=null){
                Cart shoppingCart;
                shoppingCart = (Cart) session.getAttribute("cart");
                if(shoppingCart == null){
                  shoppingCart = new Cart();
                  session.setAttribute("cart", shoppingCart);
                }
                session.setAttribute("cart", shoppingCart);
                HashMap<Integer, Integer> items = shoppingCart.getCartItems();
                items.remove(idRemove);
                response.sendRedirect("index.jsp?page=product_summary");
            }else {
                response.setContentType("text/html;charset=UTF-8");
                Cart shoppingCart;
                shoppingCart = (Cart) session.getAttribute("cart");
                if(shoppingCart == null){
                  shoppingCart = new Cart();
                  session.setAttribute("cart", shoppingCart);
                }
                Integer id = Integer.parseInt(request.getParameter("id"));
                Integer qty = Integer.parseInt(request.getParameter("qty"));
                shoppingCart.addToCart(id, qty);
                response.sendRedirect("index.jsp?page=product_summary");
            }
   }

}
