package iterator;
import models.Producto;


public interface ProductoIterator {
    boolean hasNext();
    Producto next();
}