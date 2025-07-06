package models;

public class Restaurante {
    private int id;
    private String nombre;
    private String direccion;
    private String telefono;
    private String foto;
    private double latitud;    // Nueva variable para latitud
    private double longitud;   // Nueva variable para longitud

        // Constructores
    public Restaurante() {

    }
    // Constructores
    public Restaurante(int id, String nombre, String direccion, String telefono, String foto) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.foto = foto;
    }
    
    public Restaurante(int id, String nombre, String direccion, String telefono, String foto, double latitud, double longitud) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.foto = foto;
        this.latitud = latitud;          // Asignar latitud
        this.longitud = longitud;        // Asignar longitud
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getLatitud() {
        return latitud;   // Getter para latitud
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;   // Setter para latitud
    }

    public double getLongitud() {
        return longitud;  // Getter para longitud
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;  // Setter para longitud
    }
}