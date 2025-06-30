package models;

public class Usuario {
    private int id;
    private String nombre;
    private String apellido;
    private String email;
    private String contrasenia;
    private String telefono;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getContrasenia() { return contrasenia; }
    public void setContrasenia(String contrasenia) { this.contrasenia = contrasenia; }
        public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
}