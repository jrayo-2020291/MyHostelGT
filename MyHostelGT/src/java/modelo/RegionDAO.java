/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author grupo3
 */
public class RegionDAO {
    
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int resp;
        
        public List listar(){
        
            String sql = "select * from Region";
            List<Region> listaRegion = new ArrayList<>();
            try{
                con = cn.Conexion();
                ps = con.prepareCall(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    Region rg = new Region();
                    rg.setCodigoRegion(rs.getInt(1));
                    rg.setRegion(rs.getString(2));
                    listaRegion.add(rg);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return listaRegion;
        }
        
        //Metodo Agregar
        
        public int agregar(Region regi){
            
            String sql = "insert into Region(region) values(?)";
            
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setString(1, regi.getRegion());
                ps.executeUpdate();
                
            }catch(Exception e){
                e.printStackTrace();
            } 
            return resp;
        }
        
        //Buscar codigo
        
        public Region listarCodigoRegion(int id){
            Region regi = new Region();
            String sql = "select * from Region where codigoRegion = "+id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    regi.setRegion(rs.getString(2));
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return regi;
        }
        
        //Editar
        
        public int actualizar(Region regi){
            
            String sql = "update Region set region = ? where codigoRegion = ?";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setString(1, regi.getRegion());
                ps.setInt(2, regi.getCodigoRegion());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
            
            return resp;
        }
        
        public void eliminar(int id){
            String sql = "delete from Region where codigoRegion = "+id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
    
}