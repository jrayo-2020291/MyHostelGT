package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ReservacionDAO {
  Conexion cn = new Conexion(); 
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  int resp;
  
  public List listar(){
      String sql = "Select * from reservacion";
      List <Reservacion> listaReservacion = new ArrayList<>();
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          while(rs.next()){
              Reservacion re = new Reservacion();
              re.setCodigoReservacion(rs.getInt(1));
              re.setFechaEntrada(rs.getString(2));
              re.setFechaSalida(rs.getString(3));
              re.setCostReservacion(rs.getDouble(4));
              re.setID(rs.getInt(5));
              re.setNumHabitacion(rs.getInt(6));
              re.setAcceso(rs.getInt(7));
              listaReservacion.add(re);
          }
      }catch(Exception e){
          e.printStackTrace();
      }
      return listaReservacion;
  }
  
  public int agregar(Reservacion re){
        String sql = "insert into reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values (?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, re.getFechaEntrada());
            ps.setString(2, re.getFechaSalida());
            ps.setDouble(3, re.getCostReservacion());
            ps.setInt(4, re.getID());
            ps.setInt(5, re.getNumHabitacion());
            ps.setInt(6, re.getAcceso());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }
    
    public Reservacion listarCodigoReservacion(int id){
        Reservacion re = new Reservacion();
        String sql = "Select * from reservacion where codigoReservacion = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                re.setFechaEntrada(rs.getString(2));
                re.setFechaSalida(rs.getString(3));
                re.setCostReservacion(rs.getDouble(4));
                re.setID(rs.getInt(5));
                re.setNumHabitacion(rs.getInt(6));
                re.setAcceso(rs.getInt(7));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return re;
    }
    
    public int actualizar(Reservacion re){
        String sql = "update reservacion set fechaEntrada = ?, fechaSalida = ?, costReservacion = ?, ID = ?, numHabitacion = ?, acceso = ? where codigoReservacion = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, re.getFechaEntrada());
            ps.setString(2, re.getFechaSalida());
            ps.setDouble(3, re.getCostReservacion());
            ps.setInt(4, re.getID());
            ps.setInt(5, re.getNumHabitacion());
            ps.setInt(6, re.getAcceso());
            ps.setInt(7, re.getCodigoReservacion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from reservacion where codigoReservacion ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
  
  
}
