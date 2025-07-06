<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function showFields() {
         
            document.querySelectorAll('.dynamic-fields').forEach(field => {
                field.style.display = 'none';
            });
            
            const tipoPago = document.getElementById('tipoPago').value;
            if (tipoPago === 'tarjeta') {
                document.getElementById('tarjetaFields').style.display = 'block';
            } else if (tipoPago === 'yape') {
                document.getElementById('yapeFields').style.display = 'block';
            } else if (tipoPago === 'plin') {
                document.getElementById('plinFields').style.display = 'block';
            }
        }
    </script>
</html>
