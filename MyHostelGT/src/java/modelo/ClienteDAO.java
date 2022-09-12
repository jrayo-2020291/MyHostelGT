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
    int resp;
    
        public List listar(){
            String sql = "select * from Cliente";
            List<Cliente> listaCliente = new ArrayList<>();
                try{
                    con = cn.Conexion();
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        Cliente cl = new Cliente();
                        cl.setID(rs.getInt(1));
                        cl.setNombreCliente(rs.getString(2));
                        cl.setApellidoCliente(rs.getString(3));
                        cl.setTelefono(rs.getString(4));
                        cl.setDPI(rs.getString(5));
                        cl.setDireccion(rs.getString(6));
                        cl.setCorreo(rs.getString(7));
                        cl.setCodigoMetodoPago(rs.getInt(8));
                        cl.setCodigoTipoCliente(rs.getInt(9));
                        listaCliente.add(cl);
                    }
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            return listaCliente;
        }
        
        public int agregar(Cliente cli){
            String sql= "insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, codigoMetodoPago, codigoTipoCliente) values(?,?,?,?,?,?,?,?)";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setString(1, cli.getNombreCliente());
                ps.setString(2, cli.getApellidoCliente());
                ps.setString(3, cli.getTelefono());
                ps.setString(4, cli.getDPI());
                ps.setString(5, cli.getDireccion());
                ps.setString(6, cli.getCorreo());
                ps.setInt(7, cli.getCodigoMetodoPago());
                ps.setInt(8, cli.getCodigoTipoCliente());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
                    
            return resp;        
        }
        
        public Cliente listarIDCliente(int id){
            Cliente cli = new Cliente();
            String sql = "select * from Cliente where ID = "+ id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    cli.setNombreCliente(rs.getString(2));
                    cli.setApellidoCliente(rs.getString(3));
                    cli.setTelefono(rs.getString(4));
                    cli.setDPI(rs.getString(5));
                    cli.setDireccion(rs.getString(6));
                    cli.setCorreo(rs.getString(7));
                    cli.setCodigoMetodoPago(rs.getInt(8));
                    cli.setCodigoTipoCliente(rs.getInt(9));
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return cli;
        }
        
        public int actualizar(Cliente cli){
            String sql = "update Cliente set nombreCliente = ?, apellidoCliente = ?, telefono = ?, DPI = ?, direccion = ?, correo = ?, codigoMetodoPago = ?, codigoTipoCliente = ? where ID = ?";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setString(1, cli.getNombreCliente());
                ps.setString(2, cli.getApellidoCliente());
                ps.setString(3, cli.getTelefono());
                ps.setString(4, cli.getDPI());
                ps.setString(5, cli.getDireccion());
                ps.setString(6, cli.getCorreo());
                ps.setInt(7, cli.getCodigoMetodoPago());
                ps.setInt(8, cli.getCodigoTipoCliente());
                ps.setInt(9, cli.getID());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
            return resp;
        }
        
        public void eliminar(int id){
            String sql = "delete from Cliente where ID = "+ id;
            System.out.println(sql);
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
}
