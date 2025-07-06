package models;

public class Menu {
    private int id;
    private String nombre;
    private String categoria;
    private double precio;
    private String foto;

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
    public String getFoto() { return foto; }
    public void setFoto(String foto) { this.foto = foto; }
}