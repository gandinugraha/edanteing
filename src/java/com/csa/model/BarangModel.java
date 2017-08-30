/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DiTz
 */
public class BarangModel extends HttpServlet {

    private int id_barang;
    private String nama_barang;
    private int harga_barang;
    private int qty_barang;
    private String satuan_barang;
    private String gambar_barang;
    private String status;
    
    Koneksi db = null;
    
    public BarangModel()
    {
        db = new Koneksi();
    }
   

    public int getId_barang() {
        return id_barang;
    }

    public void setId_barang(int id_barang) {
        this.id_barang = id_barang;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public int getHarga_barang() {
        return harga_barang;
    }

    public void setHarga_barang(int harga_barang) {
        this.harga_barang = harga_barang;
    }

    public int getQty_barang() {
        return qty_barang;
    }

    public void setQty_barang(int qty_barang) {
        this.qty_barang = qty_barang;
    }

    public String getSatuan_barang() {
        return satuan_barang;
    }

    public void setSatuan_barang(String satuan_barang) {
        this.satuan_barang = satuan_barang;
    }

    public String getGambar_barang() {
        return gambar_barang;
    }

    public void setGambar_barang(String gambar_barang) {
        this.gambar_barang = gambar_barang;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public List view()
    {
        List<BarangModel> data = new ArrayList<BarangModel>();
        ResultSet rs = null; 
        try {
            String sql = "select * from tb_barang ORDER BY id_barang desc ";
            rs = db.readData(sql);
            while (rs.next()) {
                BarangModel bm = new BarangModel();
                  bm.setId_barang(rs.getInt("id_barang"));
                  bm.setNama_barang(rs.getString("nama_barang"));
                  bm.setHarga_barang(rs.getInt("harga_barang"));
                  bm.setQty_barang(rs.getInt("qty_barang"));
                  bm.setSatuan_barang(rs.getString("satuan_barang"));
                  bm.setGambar_barang(rs.getString("gambar_barang"));
                  bm.setStatus(rs.getString("status"));
                data.add(bm);
            }
            db.disconnect(rs);
        } catch (Exception e) {
        }
        return data;
    }
      public void hapus(){
        String sql="DELETE FROM tb_barang WHERE id_barang='"+id_barang+"'";
        db.addData(sql);
        System.out.println("");
    }
    
    public void add()
    {
        String sql="insert into tb_barang values(null,'"+nama_barang+"','"+harga_barang+"','"+qty_barang+"','"+satuan_barang+"','"+gambar_barang+"','"+status+"')";
        db.addData(sql);
    }
    
       public void update(){
        String sql="UPDATE tb_barang SET nama_barang='"+nama_barang+"',harga_barang='"+harga_barang+"' ,qty_barang='"+qty_barang+"' ,satuan_Barang='"+satuan_barang+"',gambar_barang='"+gambar_barang+"',status='"+status+"' WHERE id_barang='"+id_barang+"'";
        db.addData(sql);
        System.out.println(sql);
    }

    public List cariID() {
        List<BarangModel> data = new ArrayList<BarangModel>();
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM tb_barang WHERE id_barang='"+id_barang+"'";
            rs = db.readData(sql);
            while (rs.next()) {
                BarangModel bm = new BarangModel();
                bm.setId_barang(rs.getInt("id_barang"));
                bm.setNama_barang(rs.getString("nama_barang"));
                bm.setHarga_barang(rs.getInt("harga_Barang"));
                bm.setQty_barang(rs.getInt("qty_barang"));
                bm.setSatuan_barang(rs.getString("satuan_barang"));
                bm.setGambar_barang(rs.getString("gambar_barang"));
                bm.setStatus(rs.getString("status"));
                data.add(bm);
            }
            db.disconnect(rs);
        } catch (Exception ex) {
            System.out.println("Terjadi Kesalah Saat menampilkan Cari ID" + ex);
        }
        return data;
 
    }
    
    

}
