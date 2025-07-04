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
import dao.CarritoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import models.Carrito;

@WebServlet(name = "GenerarPDFController", urlPatterns = {"/GenerarPDFController"})
public class GenerarPDFController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession session = request.getSession();
        CarritoDAO cart = (CarritoDAO) session.getAttribute("cart");

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

            if (cart != null && !cart.getItems().isEmpty()) {
                double totalPedido = 0;

                for (Carrito item : cart.getItems()) {
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
        return "Short description";
    }

}
