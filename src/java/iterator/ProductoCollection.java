package iterator;

import java.util.List;
import models.Producto;

public class ProductoCollection {
    private List<Producto> productos;

    public ProductoCollection(List<Producto> productos) {
        this.productos = productos;
    }

    public ProductoIterator createIterator() {
        return new ProductoListIterator();
    }

    private class ProductoListIterator implements ProductoIterator {
        private int index = 0;

        @Override
        public boolean hasNext() {
            return index < productos.size();
        }

        @Override
        public Producto next() {
            return productos.get(index++);
        }
    }
}
