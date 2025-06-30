package controllers;

public class CarItem {
    private int id; 
    private String nombre;
    private String precio;
    private String foto;

    public CarItem(int id, String nombre, String precio, String foto) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.foto = foto;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPrecio() {
        return precio;
    }

    public String getFoto() {
        return foto;
    }
}