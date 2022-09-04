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
    
        public List listar(){
        String sql = "select * from TipoEmpleado";
        List<TipoEmpleado> listatipoEmpleado = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                TipoEmpleado te = new TipoEmpleado();
                te.setCodigoTipoEmpleado(rs.getInt(1));
                te.setDescripcion(rs.getString(2));
                listatipoEmpleado.add(te);;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listatipoEmpleado;        
    }
    
}

