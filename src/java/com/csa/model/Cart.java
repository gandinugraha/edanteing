
package com.csa.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DiTz
 */
public class Cart extends HttpServlet {

    HashMap<Integer, Integer> cartItems;
    public Cart(){
        cartItems = new HashMap<>();
    }

    public HashMap getCartItems() {
        return cartItems;
    }
    
    public void addToCart(int id, int qty){
        cartItems.put(id, qty);
    }
    

}
