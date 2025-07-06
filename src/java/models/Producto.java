package models;

public class Producto {
    private int productoId;
    private String nombre;
    private double precio; 
    private String descripcion;
    private String foto;
    private int restauranteId;

    public Producto(int productoId, String nombre, double precio, String descripcion, String foto, int restauranteId) {
        this.productoId = productoId;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.foto = foto;
        this.restauranteId = restauranteId;
    }

    // Constructor por defecto
    public Producto() {}

    // Getters y Setters
    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio; 
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    public int getRestauranteId() {
        return restauranteId;
    }
    
    public void setRestauranteId(int restauranteId) {
        this.restauranteId = restauranteId;
    }
}