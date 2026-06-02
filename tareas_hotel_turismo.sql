--Insertar propietario
INSERT INTO owners( first_name, last_name, company_name, email, phone, address_line1, addres_line2,city, country, post_code)
VALUES ('Xiomara', 'Batres','glenda9@hotmail.com','79376112', 'colonia el molina','Apopa', 'San Miguel',)
SELECT *FROM owners

--Insertar alojamiento
INSERT INTO accommodations (
    owner_id, 
    accommodation_type_id, 
    location_id, 
    name, 
    description, 
    bedroom_count, 
    bathroom_count, 
    max_guests, 
    base_price_per_night, -- Agregamos el precio por noche
    currency_code, 
    check_in_time, 
    check_out_time
)
VALUES (
    9, 
    4, 
    4, 
    'Hotel Infinito', 
    'Hermosa vista a la playa', 
    1, 
    2, 
    4, 
    120.00,             -- Le ponemos un valor numérico al precio
    'USD', 
    '12:00:00', 
    '13:00:00'
);


SELECT * FROM  payments

 --Paso 1: Registrar el huésped
INSERT INTO guests (first_name, last_name, email, phone, date_of_birth, nationality, passport_number, emergency_contact_name) 
VALUES ('Xiomara', 'Umaña', 'batres9@gmail.com', 79376112, '1981-12-31', 'El Salvador','gb00075858', 'Wilfredo Galdamez' );

-- Paso 2: Crear la reserva (asumiendo que Xiomara obtuvo el id = 101 y el alojamiento es el 1)
INSERT INTO bookings (
    booking_id, guest_id, accommodation_id, room_id, booking_status_id, check_in_date, check_out_date, adult_count, child_count, subtotal_amount, total_amount, booking_reference)  -- ¡Agregamos la referencia!
VALUES ( 101, 1, 11,  2, 1, '2026-06-15', '2026-06-20', 1, 2, 345.90, 345.90, 'RES-101-ABCD'      -- Inventamos un código de confirmación en texto
);

--Insertar pago

INSERT INTO payments (booking_id, amount, payment_date, payment_method, payment_status) 
VALUES (10, 500.00, '2026-05-29', 'Tarjeta de Crédito', 'completed');

--Alojamientos activos
SELECT * FROM guests 
WHERE is_active = true;


-- Bucar huéspedes por país
SELECT first_name, last_name, nationality
FROM guests 
WHERE nationality = 'El Salvador';


-- Reservas por fechas(Uso de BETWEEN)
SELECT * FROM bookings 
WHERE check_in_date BETWEEN '2026-06-01' AND '2026-06-30';

--Actualizar precio
SELECT * FROM bookings 


UPDATE accommodations
SET base_price_per_night = 129.59
WHERE accommodation_id = 30;

--Estado reserva
UPDATE bookings
SET booking_status_id = 2   -- Esta es la columna correcta para el estado
WHERE booking_id = 85;      -- Modificamos únicamente la reserva 85

--Eliminar reseña
DELETE FROM reviews 
WHERE review_id = 60;

select * from accommodations


-- Reserva + huésped

SELECT b.booking_id AS reserva_id, g.first_name, g.last_name, b.check_in_date, b.check_out_date
FROM bookings b
INNER JOIN guests g ON b.guest_id = g.guest_id;

-- Alojamiento completo multiple
SELECT a.name AS alojamiento, o.first_name AS dueño, l.city AS ubicacion, t.type_name AS tipo
FROM accommodations a
INNER JOIN owners o ON a.owner_id = o.owner_id
INNER JOIN locations l ON a.location_id = l.location_id
INNER JOIN accommodation_types t ON a.accommodation_type_id = t.accommodation_type_id;

--Pagos + reservas 
SELECT p.payment_id AS pago_id, p.amount AS monto, p.payment_date, b.check_in_date
FROM payments p
INNER JOIN bookings b ON p.booking_id = b.booking_id;
SELECT * FROM payments

--LEFT JOIN- Sin reseñas(incluye null)
SELECT a.name AS alojamiento, r.rating, r.review_text
FROM accommodations a
LEFT JOIN reviews r ON a.accommodation_id = r.accommodation_id;


--LEFT JOIN- Sin reservas(filtrar null)

SELECT g.first_name, g.last_name
FROM guests g
LEFT JOIN bookings b ON g.guest_id = b.guest_id
WHERE b.booking_id IS NULL;

--AGG-Total ingreso(SUM)
SELECT SUM(amount) AS ingresos_totales
FROM payments;

--AGG-Promedio rating(AVG)
SELECT AVG(rating) AS promedio_general
FROM reviews;

--AGG-Top alojamiento(COUNT+LIMIT)

SELECT a.name AS alojamiento, COUNT(b.booking_id) AS total_reservas
FROM accommodations a
INNER JOIN bookings b ON a.accommodation_id = b.accommodation_id
GROUP BY a.name
ORDER BY total_reservas DESC
LIMIT 5;


--HAVING-Mas de 3 reservas 
SELECT g.first_name, g.last_name, COUNT(b.booking_id) AS total_reservas
FROM guests g
INNER JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.first_name, g.last_name
HAVING COUNT(b.booking_id) > 3;














--Subconsulta-Alojamiento mas caro
SELECT name AS alojamiento, base_price_per_night AS precio
FROM accommodations
WHERE base_price_per_night = (SELECT MAX(base_price_per_night) FROM accommodations);











