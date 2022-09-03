/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Grupo 3
 */
public class ClienteDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
        public List listar(){
            String sql = "select * from cliente";
            List<Cliente> listaCliente = new ArrayList<>();
                try{
                    con = cn.Conexion();
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        Cliente cl = new Cliente();
                        cl.setID(rs.getInt(1));
                        cl.setNombreCliente(rs.getString(2));
                        cl.setTelefono(rs.getString(3));
                        cl.setCodigoMetodoPago(rs.getInt(4));
                        cl.setCodigoTipoCliente(rs.getInt(5));
                        listaCliente.add(cl);
                    }
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            return listaCliente;
        }
}
