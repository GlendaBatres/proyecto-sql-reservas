# Proyecto de Consultas SQL - Sistema de Reservas

## Motor de Base de Datos Usado
**PostgreSQL**

## Esquema de la Base de Datos
Este proyecto utiliza una base de datos relacional diseñada para gestionar un sistema de alojamientos y reservas (tipo Airbnb/Hotel). El esquema está compuesto por las siguientes tablas principales:

* **owners**: Almacena los datos de los propietarios.
* **locations**: Contiene las ubicaciones (ciudades/países).
* **accommodation_types**: Define el tipo de lugar (Casa, Apartamento, Hotel, etc.).
* **accommodations**: Tabla central con los detalles de los alojamientos y sus precios.
* **guests**: Almacena la información personal de los huéspedes.
* **bookings**: Registra las reservas, uniendo a los huéspedes con los alojamientos y definiendo fechas (check-in / check-out).
* **payments**: Registra las transacciones financieras vinculadas a cada reserva.
* **reviews**: Almacena las calificaciones y comentarios de los huéspedes.

---
*Proyecto realizado para la plataforma Kodigo.*
