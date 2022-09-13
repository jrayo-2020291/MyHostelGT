package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoEmpleadoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;    
    
        public List listar(){
        String sql = "select * from TipoEmpleado";
        List<TipoEmpleado> listaTipoEmpleado = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                TipoEmpleado te = new TipoEmpleado();
                te.setCodigoTipoEmpleado(rs.getInt(1));
                te.setDescripcion(rs.getString(2));
                listaTipoEmpleado.add(te);;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaTipoEmpleado;        
    }
        public int agregar(TipoEmpleado emp){
        String sql = "insert into TipoEmpleado ( CodigoTipoEmpleado, Descripcion) values (?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, emp.getCodigoTipoEmpleado());
            ps.setString(2, emp.getDescripcion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }
    
    public TipoEmpleado listaCodigoTipoEmpleado(int id){
        TipoEmpleado emp = new TipoEmpleado();
        String sql = "Select * from TipoEmpleado where codigoTipoEmpleado= "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                emp.setCodigoTipoEmpleado(rs.getInt(1));
                emp.setDescripcion(rs.getString(2));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return emp;
    }
    
    public int actualizar(TipoEmpleado tipoEmple){
        String sql = "update TipoEmpleado set descripcion = ? where codigoTipoEmpleado = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipoEmple.getDescripcion());
            ps.setInt(2, tipoEmple.getCodigoTipoEmpleado());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se ha podido actualizar");
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from TipoEmpleado where codigoTipoEmpleado ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}
