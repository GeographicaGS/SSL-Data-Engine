# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# create_domain.py
# Created on: 2014-06-17 16:10:59.00000
#   (generated by ArcGIS/ModelBuilder)
# Description: 
# ---------------------------------------------------------------------------

# Import arcpy module
import arcpy


# Local variables:
acantilado = "C:\\Users\\malkab\\Desktop\\linea_costa_produccion_out.mdb\\acantilado"
linea_costa_produccion_out_mdb = "C:\\Users\\malkab\\Desktop\\linea_costa_produccion_out.mdb"
linea_costa = "C:\\Users\\malkab\\Desktop\\linea_costa_produccion_out.mdb\\ed50_utm_30n\\linea_costa"

# Process: Table To Domain
arcpy.TableToDomain_management(acantilado, "id_acantilado", "descripcion_acantilado", linea_costa_produccion_out_mdb, "acantilado", "Acantilado", "REPLACE")

# Process: Assign Domain To Field
arcpy.AssignDomainToField_management(linea_costa, "id_acantilado", "acantilado", "")
