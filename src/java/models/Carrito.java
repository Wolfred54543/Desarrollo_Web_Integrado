package models;

public class Carrito {
    private int id; // ID del carrito
    private int idProducto; // ID del producto
    private int idRestaurante; // ID del restaurante
    private String nombre;
    private double precio;
    private String foto;
    private int cantidad;
    
    public Carrito() {}

    public Carrito(int idProducto, int idRestaurante, String nombre, double precio, String foto, int cantidad) {
        this.idProducto = idProducto;
        this.idRestaurante = idRestaurante;
        this.nombre = nombre;
        this.precio = precio;
        this.foto = foto;
        this.cantidad = cantidad;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdRestaurante() {
        return idRestaurante;
    }

    public void setIdRestaurante(int idRestaurante) {
        this.idRestaurante = idRestaurante;
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

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        if (cantidad < 0) {
            throw new IllegalArgumentException("La cantidad no puede ser negativa.");
        }
        this.cantidad = cantidad;
    }

    public double getTotalPrice() {
        return precio * cantidad;
    }
    
}