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
  int resp;
  
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
                empleado.setDpiEmpleado(rs.getString("dpiEmpleado"));
                empleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                empleado.setApellidoEmpleado(rs.getString("apellidoEmpleado"));
                empleado.setCorreoEmpleado(rs.getString("correoEmpleado"));
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
              em.setDpiEmpleado(rs.getString(2));
              em.setNombreEmpleado(rs.getString(3));
              em.setApellidoEmpleado(rs.getString(4));
              em.setCorreoEmpleado(rs.getString(5));
              em.setTelefono(rs.getString(6));
              em.setUsuario(rs.getString(7));
              em.setCodigotipoEmpleado(rs.getInt(8));
              listaEmpleado.add(em);
          }
      }catch(Exception e){
          e.printStackTrace();
      }
      return listaEmpleado;
  }
  
  public int agregar(Empleado emp){
      String sql="insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values (?,?,?,?,?,?,?,?)";
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.setInt(1, emp.getAcceso());
          ps.setString(2, emp.getDpiEmpleado());
          ps.setString(3, emp.getNombreEmpleado());
          ps.setString(4, emp.getApellidoEmpleado());
          ps.setString(5, emp.getCorreoEmpleado());
          ps.setString(6, emp.getTelefono());
          ps.setString(7, emp.getUsuario());
          ps.setInt(8, emp.getCodigotipoEmpleado());
          ps.executeUpdate();
          
      }catch(Exception e){
          e.printStackTrace();
      }
      
      return resp;
  }
  
  public Empleado listarAcceso(int cod){
      Empleado emp = new Empleado();
      String sql = "Select * from Empleado where acceso = "+cod;
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          while (rs.next()){
              emp.setAcceso(rs.getInt(1));
              emp.setDpiEmpleado(rs.getString(2));
              emp.setNombreEmpleado(rs.getString(3));
              emp.setApellidoEmpleado(rs.getString(4));
              emp.setCorreoEmpleado(rs.getString(5));
              emp.setTelefono(rs.getString(6));
              emp.setUsuario(rs.getString(7));
              emp.setCodigotipoEmpleado(rs.getInt(8));
          }
      }catch(Exception e){
          e.printStackTrace();
      }
      
      return emp;
  }
  
  public int actualizar(Empleado emp){
      String sql = "update Empleado set dpiEmpleado = ?, nombreEmpleado = ?, apellidoEmpleado = ?, correoEmpleado = ?, telefono = ?, usuario = ?, codigoTipoEmpleado = ? where acceso = ?";
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.setString(1, emp.getDpiEmpleado());
          ps.setString(2, emp.getNombreEmpleado());
          ps.setString(3, emp.getApellidoEmpleado());
          ps.setString(4, emp.getCorreoEmpleado());
          ps.setString(5, emp.getTelefono());
          ps.setString(6, emp.getUsuario());
          ps.setInt(7, emp.getCodigotipoEmpleado());
          ps.setInt(8, emp.getAcceso());
          ps.executeUpdate();
      }catch(Exception e){
          e.printStackTrace();
      }
      return resp;
  }
  
  public void eliminar(int cod){
      String sql = "delete from Empleado where acceso ="+cod;
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.executeUpdate();
      }catch(Exception e){
          e.printStackTrace();
      }
  }
  
}
