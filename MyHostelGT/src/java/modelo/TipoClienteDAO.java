
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoClienteDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;    
    
        public List listar(){
        String sql = "select * from TipoCliente";
        List<TipoCliente> listaTipoCliente = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                TipoCliente tc = new TipoCliente();
                tc.setCodigoTipoCliente(rs.getInt(1));
                tc.setDescripcion(rs.getString(2));
                listaTipoCliente.add(tc);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaTipoCliente;        
    }
    
        
    public int agregar(TipoCliente tipclien){
        String sql = "insert into TipoCliente (descripcion) values (?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipclien.getDescripcion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public TipoCliente listarCodigoTipoCliente(int id){
        TipoCliente tipclien = new TipoCliente();
        String sql = "Select * from TipoCliente where codigoTipoCliente = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                tipclien.setDescripcion(rs.getString(2)); 
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return tipclien;
    }
    
    public int actualizar(TipoCliente tipclien){
        String sql = "update TipoCliente set descripcion = ? where codigoTipoCliente = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipclien.getDescripcion());
            ps.setInt(2, tipclien.getCodigoTipoCliente());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se ha podido actualizar");
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from TipoCliente where codigoTipoCliente ="+id;
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
