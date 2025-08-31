# 📊 Análisis de DB MySQL con Python (Pandas + Matplotlib)

Este proyecto muestra brevemente el tratamiento de una base de datos MySQL utilizando Python para la conexión, ejecución de consultas, procesamiento y análisis de la misma.

---

## 🎯 Descripción del Proyecto
La base de datos es extraída de un sistema de gestión industrial durante su etapa de implementación, buscando generar algunos análisis iniciales sobre la operación de determinados procesos y las tareas realizadas por los operarios.

Para observar y ejecutar los procedimientos de análisis realizados se puede acceder al [notebook](/notebooks/analysis.ipynb) adjunto.

---

## 📂 Modelo de datos
![Diagrama ERD](/db/erd.png)

- **usuarios**: información de usuarios y permisos asignados. 
- **pprod_cortelad**: planillas de producción del proceso Corte de Ladrillos.
- **pprod_inyección**: planillas de producción del proceso Inyección.
- **pprod_embolsado**: planillas de producción del proceso Embolsado.
- **partes_de_trabajo**: registro de actividades fuera de procesos productivos.
- **paradas_prog**: registro de paradas que fueron programadas.
- **paradas_no_prog**: registro de paradas no programadas.

---

## 🚀 Ejecución del Notebook

**Requisitos previos:**
- Tener MySQL Server en ejecución
- Tener instalado Python 3.10+
- Tener pip actualizado
  
1. Crear la base de datos en MySQL y cargar datos:
    ```bash
    mysql -u root -p < db/schema.sql
    mysql -u root -p < db/seed.sql
    ```
2. Instalar dependencias de Python:
    ```bash
    pip install -r requirements.txt
    ```
3. Cargar notebook `/notebooks/analysis.ipynb`

---

## 📈 Resultados
![Gráfico 1](/notebooks/hrs_operario_proceso.png)
![Gráfico 2](/notebooks/rendimiento_calidad_producto.png)

---

## 🛠️ Tecnologías utilizadas
- **MySQL**
- **MySQL Workbench** → diseño de diagrama entidad-relación (ERD)
- **Python**
- **SQLAlchemy** → conexión y extracción de datos
- **Pandas** → procesamiento de datos
- **Matplotlib** → visualización de resultados
- **Jupyter Notebook** → presentación de análisis realizados

---

## 🔍 Próximos pasos

- Diseñar consultas que integren planillas de producción con paradas y otras actividades.
- Ampliar dataset de prueba a nuevos periodos de análisis.
- Definir KPIs clave y construir dashboards interactivos para evaluar su comportamiento.

---

## 📜 Licencia

Este proyecto está bajo licencia MIT.