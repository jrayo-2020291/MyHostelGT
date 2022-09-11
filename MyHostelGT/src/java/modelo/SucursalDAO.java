package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SucursalDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; 
    int resp;
    
    public List listar(){
        String sql = "select * from sucursal";
        List<Sucursal> listaSucursales = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Sucursal su = new Sucursal();
                su.setCodigoSucursal(rs.getInt(1));
                su.setDescripcion(rs.getString(2));
                su.setPuntuacion(rs.getInt(3));
                su.setDireccion(rs.getString(4));
                su.setCodigoRegion(rs.getInt(5));
                su.setCodigoVolumen(rs.getInt(6));
                listaSucursales.add(su);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaSucursales;        
    }
    
    public int agregar(Sucursal suc){
        String sql = "insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values (?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, suc.getDescripcion());
            ps.setInt(2, suc.getPuntuacion());
            ps.setString(3, suc.getDireccion());
            ps.setInt(4, suc.getCodigoRegion());
            ps.setInt(5, suc.getCodigoVolumen());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public Sucursal listarCodigoSucursal(int id){
        Sucursal suc = new Sucursal();
        String sql = "Select * from Sucursal where codigoSucursal = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                suc.setDescripcion(rs.getString(2));
                suc.setPuntuacion(rs.getInt(3));
                suc.setDireccion(rs.getString(4));
                suc.setCodigoRegion(rs.getInt(5));
                suc.setCodigoVolumen(rs.getInt(6));  
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return suc;
    }
    
    public int actualizar(Sucursal suc){
        String sql = "update Sucursal set descripcion = ?, puntuacion = ?, direccion = ?, codigoRegion = ?, codigoVolumen = ? where codigoSucursal = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, suc.getDescripcion());
            ps.setInt(2, suc.getPuntuacion());
            ps.setString(3, suc.getDireccion());
            ps.setInt(4, suc.getCodigoRegion());
            ps.setInt(5, suc.getCodigoVolumen());
            ps.setInt(6, suc.getCodigoSucursal());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from Sucursal where codigoSucursal ="+id;
        System.out.println(sql);
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            
            
        }
    }
}

