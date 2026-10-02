# Proyecto RetailPro — Arquitectura y Análisis de Datos

---

## 1. Contexto del Proyecto
Este repositorio contiene el backend de datos y el motor analítico para el sistema de Inteligencia de Negocios de **RetailPro**, una distribuidora B2B de tecnología. 

El proyecto nace con el objetivo de diagnosticar una problemática específica del negocio: auditar integralmente por qué los clientes del segmento corporativo de la zona sur redujeron su tasa de recompra durante el último semestre, integrando variables comerciales, logísticas y financieras.

## 2. Estructura del Repositorio
El repositorio refleja el flujo de trabajo progresivo de normalización y extracción de datos, estructurado en los siguientes scripts SQL:

* **`ventas_tech_db.sql` (Módulo 3):** Script DDL y DML que genera la estructura relacional de la base de datos (tablas maestras y transaccionales, PK/FK, restricciones 3NF) y carga los registros operativos iniciales.
* **`m4_consultas_negocio.sql` (Módulo 4):** Extracción de las primeras métricas clave del negocio mediante funciones de agregación (SUM, COUNT, AVG), respondiendo a los KPIs iniciales del brief estratégico.
* **`m5_consultas_joins.sql` (Módulo 5):** Construcción de las vistas enriquecidas del proyecto. Utiliza `INNER JOIN`, `LEFT JOIN` y `UNION ALL` para consolidar el catálogo, la geografía y las operaciones en una tabla de hechos centralizada. Esta vista es la fuente de datos directa para el dashboard en Power BI.

## 3. Modelo Relacional (3NF)
La arquitectura de la base de datos fue diseñada garantizando la Tercera Forma Normal (3NF) y se compone de cuatro entidades principales:
* **`territorios`:** Dimensión geográfica.
* **`clientes`:** Padrón de cuentas corporativas y minoristas.
* **`productos`:** Catálogo tecnológico con costos y precios.
* **`ventas`:** Tabla transaccional central.

## 4. Guía de Ejecución
Para reproducir el entorno y auditar las consultas, seguir estos pasos:
1. El código fue desarrollado y optimizado para **SQL Server**. Utilizar SQL Server Management Studio (SSMS) o Azure Data Studio.
2. Ejecutar primero el archivo `ventas_tech_db.sql` en su totalidad para inicializar el esquema `Ventas_Tech_DB` y poblar las tablas.
3. Ejecutar los scripts analíticos (`m4` y `m5`) de manera independiente para visualizar el cruce de datos y los indicadores.

## 5. Próximos Pasos (Roadmap)
Este repositorio se encuentra en desarrollo iterativo. Las vistas enriquecidas generadas en la actual etapa de SQL servirán como materia prima directa para la ingesta, transformación (Power Query) y visualización en **Power BI** en las siguientes fases del proyecto.

--

*Proyecto desarrollado por Ramiro Delucis 
