package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClasificacionDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        String sql = "select * from clasificacion";
        List<Clasificacion> listaClasificacion = new ArrayList<>();
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                while(rs.next()){
                    Clasificacion clasif = new Clasificacion();
                    clasif.setCodigoClasificacion(rs.getInt(1));
                    clasif.setCategoria(rs.getString(2));
                    listaClasificacion.add(clasif);
                }

            }catch(Exception e){
                e.printStackTrace();
            }
        return listaClasificacion;
    }
        
    public int agregar(Clasificacion clas){
        String sql = "insert into Clasificacion (categoria) values (?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, clas.getCategoria());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public Clasificacion listarCodigoClasificacion(int id){
        Clasificacion clas = new Clasificacion();
        String sql = "select * from Clasificacion where codigoClasificacion = "+id;
        try{
            con = cn.Conexion();
             ps = con.prepareStatement(sql);
             rs = ps.executeQuery();
             while(rs.next()){
                 clas.setCategoria(rs.getString(2));
             }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return clas;
    }
    
    public int actualizar(Clasificacion clas){
        String sql = "update clasificacion set categoria = ? where codigoClasificacion = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, clas.getCategoria());
            ps.setInt(2, clas.getCodigoClasificacion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from Clasificacion where codigoClasificacion ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            
            
        }
    }
}
