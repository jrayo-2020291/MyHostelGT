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
}

