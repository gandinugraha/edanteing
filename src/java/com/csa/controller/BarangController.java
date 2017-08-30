
package com.csa.controller;

import com.csa.model.BarangModel;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   //  2MB
                       maxFileSize = 1024 * 1024 * 10,  //  10MB
                    maxRequestSize = 1024 * 1024 * 50)  //  50MB


public class BarangController extends HttpServlet {

   private static final String SAVE_DIR = "barang/";
   @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        String proses=request.getParameter("proses");
        String action=request.getParameter("action");
        if (proses.equals("input-barang")){
            response.sendRedirect("barang/add_barang.jsp");
            return;
        }else if(proses.equals("edit-barang")){
            response.sendRedirect("barang/edit_barang.jsp?id="+request.getParameter("id"));
            return;
        }else if (proses.equals("logout"))
        {
            HttpSession session = request.getSession();
            session.removeAttribute("username");
            session.invalidate();
            response.sendRedirect("login.jsp");
        }else if(proses.equals("hapus-barang")){
            BarangModel bm=new BarangModel();
            bm.setId_barang(Integer.parseInt(request.getParameter("id")));
            bm.hapus();
            response.sendRedirect("barang/view_barang.jsp");
        }  
    }
    
      protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        String data = request.getParameter("data");
        String proses = request.getParameter("proses");
        
        
        PrintWriter out = response.getWriter();
        String savePath = "C:\\Users\\DiTz\\Documents\\NetBeansProjects\\CSAWebApp\\web\\images" + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (data != null){
           if(data.equals("barang")){
                BarangModel bm=new BarangModel();
                    
                  Part part = request.getPart("gambar");
                 String fileName = extractFileName(part);
                 part.write(savePath + File.separator + fileName);

                 String filePath = File.separator + fileName;
                 bm.setGambar_barang(filePath);
  
                  bm.setNama_barang(request.getParameter("nama"));
                  bm.setHarga_barang(Integer.parseInt(request.getParameter("harga")));
                  bm.setQty_barang(Integer.parseInt(request.getParameter("qty")));
                  bm.setSatuan_barang(request.getParameter("satuan"));
                  bm.setStatus(request.getParameter("status"));
                 if (proses.equals("input-barang")){
                      bm.add();
                 } else if (proses.equals("update-barang")){
                     bm.setId_barang(Integer.parseInt(request.getParameter("id_barang")));
                    bm.update();
                 }
                 response.sendRedirect("barang/view_barang.jsp");
            }
        }
    }
      
      
      private String extractFileName(Part part) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    
}
