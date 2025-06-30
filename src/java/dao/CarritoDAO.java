package dao;

import java.util.ArrayList;
import java.util.List;
import models.Carrito;

public class CarritoDAO {
    private List<Carrito> items = new ArrayList<>();

    public void addItem(Carrito item) {
        
        for (Carrito cartItem : items) {
            if (cartItem.getId() == item.getId()) {
                cartItem.setCantidad(cartItem.getCantidad() + item.getCantidad());
                return;
            }
        }
        items.add(item);
    }

    public List<Carrito> getItems() {
        return items;
    }

    public double getTotal() {
        double total = 0;
        for (Carrito item : items) {
            total += item.getPrecio() * item.getCantidad();
        }
        return total;
    }

    public void removeItemById(int id) {
        for (Carrito item : items) {
            if (item.getId() == id) {
                if (item.getCantidad() > 1) {
                    item.setCantidad(item.getCantidad() - 1); 
                } else {
                    items.remove(item); 
                }
                return; 
            }
        }
    }
}