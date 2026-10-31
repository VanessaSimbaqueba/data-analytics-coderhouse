# RetailPro

Proyecto de análisis de datos de ventas de una tienda de tecnología. Permite consultar y analizar la información comercial con SQL Server y visualizarla en Power BI.

**Repositorio (público):** https://github.com/VanessaSimbaqueba/data-analytics-coderhouse

## Descripción

RetailPro centraliza los datos de clientes, productos, categorías y ventas de la base `Ventas_Tech_DB` para responder preguntas de negocio. Algunos hallazgos del análisis:

- La categoría Computación concentra el 77 % de lo facturado ($4950 de $6444).
- Buenos Aires es la ciudad que más compra (41 %).
- Hay 1 cliente registrado que nunca compró y 1 producto del catálogo (Webcam HD) sin ventas.

## Herramientas utilizadas

- **SQL Server y SSMS** para crear la base y ejecutar las consultas
- **Power Query (lenguaje M)** para la limpieza y transformación de datos
- **Power BI** para el modelo de datos y la visualización

## Cómo ejecutar los scripts SQL

1. Cloná el repositorio:
   ```bash
   git clone https://github.com/VanessaSimbaqueba/data-analytics-coderhouse.git
   ```
2. Abrí **SQL Server Management Studio (SSMS)** y conectate a tu instancia.
3. Verificá que exista la base `Ventas_Tech_DB` con las tablas `ventas`, `clientes`, `productos` y `categorias`.
4. Abrí cada script `.sql` y ejecutalo con **F5**. Cada uno comienza con `USE Ventas_Tech_DB;`.

## Consultas incluidas

| Consulta | Técnica | Propósito |
|---|---|---|
| Vista base | INNER JOIN | Unir ventas, clientes, productos y categorías para Power BI |
| Clientes sin ventas | LEFT JOIN | Detectar clientes que nunca compraron |
| Productos sin ventas | LEFT JOIN | Identificar productos sin movimiento |
| Consolidado por período | UNION ALL | Comparar lo facturado antes y desde el 10 de marzo de 2024 |
| Resumen mensual y ranking | GROUP BY | Facturación por mes y productos más rentables |

## Cambios respecto a la versión generada por la IA

| # | Qué decía la versión de la IA | Cómo quedó | Por qué lo cambié |
|---|---|---|---|
| 1 | Herramientas: "Python (pandas), Excel y Tableau" | "SQL Server y SSMS, Power Query y Power BI" | La IA asumió un stack genérico. No usé Python ni Tableau: el análisis se hizo con SQL Server y Power BI. |
| 2 | "Abrí tu gestor de bases de datos preferido (MySQL, PostgreSQL, SQL Server, etc.)" | Pasos concretos con SSMS, la base `Ventas_Tech_DB` y F5 | Mis scripts usan sintaxis de SQL Server (`TOP`, `IF NOT EXISTS`, `USE`) y no corren igual en otros motores. |
| 3 | Descripción genérica: "responder preguntas de negocio" | Hallazgos concretos con cifras reales del análisis | Una descripción sin datos no muestra el valor del proyecto; los números salen de mis consultas. |

## Autor

Vanessa Simbaqueba. Proyecto de un curso de análisis de datos.
