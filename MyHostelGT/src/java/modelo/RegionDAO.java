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
        
    
}
