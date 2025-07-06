package controllers;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.CarritoDAO; // Asegúrate de importar tu DAO
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import models.Carrito;

@WebServlet(name = "GenerarPDFController", urlPatterns = {"/GenerarPDFController"})
public class GenerarPDFController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        CarritoDAO cartDAO = new CarritoDAO(); // Crea una instancia de tu DAO
        List<Carrito> cartItems = null;

        // Si el usuario está autenticado, obtener los items del carrito
        if (userId != null) {
            try {
                cartItems = cartDAO.getItemsByUserId(userId); // Método para obtener los items del carrito del usuario
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al acceder a los datos del carrito.");
                return;
            }
        }

        // Configuración de la respuesta para el PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"pedido.pdf\"");

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Título
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            document.add(new Paragraph("Detalles del Pedido", titleFont));
            document.add(new Paragraph("\n"));

            // Crear tabla
            PdfPTable table = new PdfPTable(4); // 4 columnas
            table.setWidthPercentage(100); // Tabla ocupa el 100% del ancho
            table.addCell("Producto");
            table.addCell("Precio");
            table.addCell("Cantidad");
            table.addCell("Subtotal");

            if (cartItems != null && !cartItems.isEmpty()) {
                double totalPedido = 0;

                for (Carrito item : cartItems) {
                    double subtotal = item.getPrecio() * item.getCantidad();
                    totalPedido += subtotal;

                    table.addCell(item.getNombre());
                    table.addCell("S/ " + item.getPrecio());
                    table.addCell(String.valueOf(item.getCantidad()));
                    table.addCell("S/ " + subtotal);
                }

                // Total
                PdfPCell totalCell = new PdfPCell(new Phrase("Total del Pedido: S/ " + totalPedido));
                totalCell.setColspan(3); // Colspan para que ocupe 3 columnas
                totalCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                totalCell.setBackgroundColor(BaseColor.LIGHT_GRAY); // Opcional: color de fondo
                table.addCell(totalCell);

            } else {
                table.addCell("No hay artículos en el carrito.");
                table.addCell("");
                table.addCell("");
                table.addCell("");
            }

            document.add(table);

        } catch (DocumentException e) {
            e.printStackTrace(); // Para depuración
        } finally {
            document.close();
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador para generar PDF del pedido";
    }
}