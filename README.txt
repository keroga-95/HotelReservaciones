# PV Proyecto Final

Aplicación web desarrollada con ASP.NET Web Forms y .NET Framework 4.7.2.

## Requisitos

- Visual Studio
- .NET Framework 4.7.2
- SQL Server
- SQL Server Management Studio
- LinqToDB 5.4.1.9

## Base de datos

La base de datos se encuentra en:

`Database/PV_ProyectoFinal.sql`

Para configurar la base de datos:

1. Abrir SQL Server Management Studio.
2. Ejecutar el archivo `Database/PV_ProyectoFinal.sql`.
3. Verificar que se haya creado la base de datos `PV_ProyectoFinal`.
4. Revisar la cadena de conexión en `Web.config`.
5. Cambiar `Data Source` según la instancia de SQL Server de cada computadora.

## Conexión

Actualmente el proyecto utiliza una conexión similar a:

`Data Source=KEROGAPC\SQLEXPRESS;Database=PV_ProyectoFinal;Integrated Security=True;TrustServerCertificate=True`

El valor de `Data Source` puede variar dependiendo de la instalación de SQL Server.
