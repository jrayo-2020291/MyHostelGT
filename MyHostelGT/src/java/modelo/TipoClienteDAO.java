
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
    
        public List listar(){
        String sql = "select * from tipocliente";
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
    
}
