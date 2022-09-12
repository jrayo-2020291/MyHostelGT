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
              re.setID(rs.getInt(4));
              re.setNumHabitacion(rs.getInt(5));
              re.setAcceso(rs.getInt(6));
              listaReservacion.add(re);
          }
      }catch(Exception e){
          e.printStackTrace();
      }
      return listaReservacion;
  }
}
