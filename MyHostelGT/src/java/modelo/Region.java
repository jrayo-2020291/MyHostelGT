/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Grupo 3
 */
public class Region {
    
    private int codigoRegion;
    private String region;

    public Region() {
    }

    public Region(int codigoRegion, String region) {
        this.codigoRegion = codigoRegion;
        this.region = region;
    }

    public int getCodigoRegion() {
        return codigoRegion;
    }

    public void setCodigoRegion(int codigoRegion) {
        this.codigoRegion = codigoRegion;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }
    
    
    
}
