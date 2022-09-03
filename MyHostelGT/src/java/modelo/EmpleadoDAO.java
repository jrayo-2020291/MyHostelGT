package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class EmpleadoDAO {
  Conexion cn = new Conexion(); 
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  
  public Empleado validar(String usuario, String acceso){
      Empleado empleado = new Empleado();
      String sql = "select * from empleado where usuario = ? and acceso = ?";
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.setString(1, usuario);
          ps.setString(2, acceso);
          rs = ps.executeQuery();
          while(rs.next()){
                empleado.setAcceso(rs.getInt("acceso"));
                empleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setUsuario(rs.getString("usuario"));
                empleado.setCodigotipoEmpleado(rs.getInt("codigotipoEmpleado"));
            
            }
      }catch(Exception e){
          e.printStackTrace();
      }
      return empleado;
  }
  public List listar(){
      String sql = "Select * from empleado";
      List <Empleado> listaEmpleado = new ArrayList<>();
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          while(rs.next()){
              Empleado em = new Empleado();
              em.setAcceso(rs.getInt(1));
              em.setNombreEmpleado(rs.getString(3));
              em.setTelefono(rs.getString(4));
              em.setUsuario(rs.getString(5));
              em.setCodigotipoEmpleado(rs.getInt(6));
              listaEmpleado.add(em);
          }
      }catch(Exception e){
          e.printStackTrace();
      }
      return listaEmpleado;
  }
}
