# coding=UTF8

"""

SSL database postprocessing.

"""
import arcpy


class Toolbox(object):
    def __init__(self):
        """Define the toolbox (the name of the toolbox is the name of the
        .pyt file)."""
        self.label = "SSL Postprocessing"
        self.alias = "SSL Postprocessing"
        self.description = "Tools for postprocessing SSL production databases."

        # List of tool classes associated with this toolbox
        self.tools = [SslCoastLineProductionPostprocessing]


class SslCoastLineProductionPostprocessing(object):
    def __init__(self):
        """Define the tool (tool name is the name of the class). (Required)"""
        self.label = "Coast Line Production DB Postprocessing"
        self.description = "Postprocessing for production database for coast line."
        self.canRunInBackground = True
        self.category = "Coast Line"
        self.stylesheet = None

    def getParameterInfo(self):
        """Define parameter definitions. (Optional)"""
        database = arcpy.Parameter(
            displayName = "Database",
            name = "database",
            datatype = "DEWorkspace",
            parameterType = "Required",
            direction = "Input")
        database.filter.list = ["Local Database"]

        output = arcpy.Parameter(
            displayName = "Output",
            name = "output",
            datatype = "DEWorkspace",
            parameterType = "Derived",
            direction = "Output"
        )
        output.parameterDependencies = [database.name]
        output.schema.clone = True

        params = [database, output]
        return params

    def isLicensed(self):
        """Set whether tool is licensed to execute. (Optional)"""
        return True

    def updateParameters(self, parameters):
        """Modify the values and properties of parameters before internal
        validation is performed.  This method is called whenever a parameter
        has been changed. (Optional)"""
        return

    def updateMessages(self, parameters):
        """Modify the messages created by internal validation for each tool
        parameter.  This method is called after internal validation. (Optional)"""
        return

    def execute(self, parameters, messages):
        """The source code of the tool. (Required)"""
        database = parameters[0].valueAsText
        messages.addMessage("Processing {}...".format(database))

        self.__createDomain(database, messages, "acantilado", "id_acantilado", 
                            "descripcion_acantilado", "acantilado", "Acantilado", "id_acantilado")
        self.__createDomain(database, messages, "criterio", "id_criterio", "descripcion_criterio", "criterio", 
                            "Criterio digitalización", "id_criterio")
        self.__createDomain(database, messages, "deslinde", "id_deslinde", "descripcion_deslinde", 
                            "deslinde", "Rebasamiento de deslinde", "id_deslinde")
        self.__createDomain(database, messages, "duna", "id_duna", "descripcion_duna", "duna", 
                            "Dunas", "id_duna")
        self.__createDomain(database, messages, "estacion", "id_estacion", "descripcion_estacion", 
                            "estacion", "Estación de digitalización", "id_estacion")
        self.__createDomain(database, messages, "fuente_toponimo_ssl", "id_fuente_toponimo_ssl", 
                            "descripcion_fuente_toponimo_ssl", "fuente_toponimo_ssl",
                            "Fuente del toponimo SSL", "id_fuente_toponimo_ssl")
        self.__createDomain(database, messages, "infraestructura", "id_infraestructura",
                            "descripcion_infraestructura", "infraestructura", "Infraestructuras",
                            "id_infraestructura_frente")
        arcpy.AssignDomainToField_management(database+"\\ed50_utm_30n\\linea_costa",
                                             "id_infraestructura_2_linea", "infraestructura", "")
        self.__createDomain(database, messages, "infraestructura_exposicion", "id_infraestructura_exposicion", 
                            "descripcion_infraestructura_exposicion", "infraestructura_exposicion", 
                            "Exposición de infraestructura", "id_infraestructura_exposicion")
        self.__createDomain(database, messages, "infraestructura_localizacion",
                            "id_infraestructura_localizacion", "descripcion_infraestructura_localizacion",
                            "infraestructura_localizacion", "Localización de infraestructura", 
                            "id_infraestructura_localizacion")
        self.__createDomain(database, messages, "infraestructura_tipo", "id_infraestructura_tipo", 
                            "descripcion_infraestructura_tipo", "infraestructura_tipo", 
                            "Tipo de infraestructura", "id_infraestructura_tipo")
        self.__createDomain(database, messages, "playa", "id_playa", "descripcion_playa",
                            "playa", "Playas", "id_playa")
        self.__createDomain(database, messages, "sustrato", "sustrato", "Descripcion", "sustrato",
                            "Tipo de sustrato en costas sedimentarias", "id_sustrato")
        self.__createDomain(database, messages, "tipo_linea", "tipo_linea", "Descripcion", "tipo_linea",
                            "Tipo de línea para generar corta, larga, erosión", "tipo_linea")
        self.__createDomain(database, messages, "tipo_margen", "id_tipo_margen", "descripcion_tipo_margen", 
                            "tipo_margen", "Tipo de margen", "id_tipo_margen")
        self.__createDomain(database, messages, "tipologia_nv1", "id_tipologia_nv1", "descripcion_nv1", 
                            "tipologia_nv1", "Tipología a nivel 1", "id_tipologia_nv1")
        self.__createDomain(database, messages, "tipologia_nv2", "id_tipologia_nv2", "descripcion_nv2", 
                            "tipologia_nv2", "Tipología a nivel 2", "id_tipologia_nv2")
        self.__createDomain(database, messages, "tipologia_nv3", "id_tipologia_nv3", "descripcion_nv3", 
                            "tipologia_nv3", "Tipologia a nivel 3", "id_tipologia_nv3")
        self.__createDomain(database, messages, "tipologia_nv4", "id_tipologia_nv4", "descripcion_nv4", 
                            "tipologia_nv4", "Tipologia a nivel 4", "id_tipologia_nv4")
        self.__createDomain(database, messages, "urbano", "id_urbano", "descripcion_urbano", "urbano", 
                            "Urbano", "id_urbano")
        self.__createDomain(database, messages, "urbano_proximidad", "id_urbano_proximidad", 
                            "descripcion_urbano_proximidad", "urbano_proximidad",
                            "Proximidad del urbano", "id_urbano_proximidad")
        return True

    def __createDomain(self, database, messages, table, id_field, desc_field, name, desc, applyField):
        """Creates and applies a domain to a table."""
        messages.addMessage("Creating domain '{}'...".format(name))
        arcpy.TableToDomain_management(database+"\\"+table, id_field, desc_field, database,
                                       name, desc, "REPLACE")
        arcpy.AssignDomainToField_management(database+"\\ed50_utm_30n\\linea_costa",
                                             applyField, name, "")


