# coding=UTF8

"""

SSL database postprocessing.

"""
import arcpy
import pyarcgis


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

        domains = [
            {
                "domainTable": "acantilado",
                "keyField": "id_acantilado", 
                "descField": "descripcion_acantilado",
                "domainName": "acantilado",
                "domainDesc": "Acantilado",
                "applicationFields": ["id_acantilado"]
            },
            {
                "domainTable": "criterio",
                "keyField": "id_criterio", 
                "descField": "descripcion_criterio",
                "domainName": "criterio",
                "domainDesc": "Criterio digitalizacion",
                "applicationFields": ["id_criterio"]
            },
            {
                "domainTable": "deslinde",
                "keyField": "id_deslinde", 
                "descField": "descripcion_deslinde",
                "domainName": "deslinde",
                "domainDesc": "Rebasamiento de deslinde",
                "applicationFields": ["id_deslinde"]
            },
            {
                "domainTable": "duna",
                "keyField": "id_duna", 
                "descField": "descripcion_duna",
                "domainName": "duna",
                "domainDesc": "Dunas",
                "applicationFields": ["id_duna"]
            },
            {
                "domainTable": "estacion",
                "keyField": "id_estacion", 
                "descField": "descripcion_estacion",
                "domainName": "estacion",
                "domainDesc": "Estacion de digitalizacion",
                "applicationFields": ["id_estacion"]
            },
            {
                "domainTable": "fuente_toponimo_ssl",
                "keyField": "id_fuente_toponimo_ssl", 
                "descField": "descripcion_fuente_toponimo_ssl",
                "domainName": "fuente_toponimo_ssl",
                "domainDesc": "Fuente del toponimo SSL",
                "applicationFields": ["id_fuente_toponimo_ssl"]
            },
            {
                "domainTable": "infraestructura",
                "keyField": "id_infraestructura", 
                "descField": "descripcion_infraestructura",
                "domainName": "infraestructura",
                "domainDesc": "Infraestructura",
                "applicationFields": ["id_infraestructura_frente", "id_infraestructura_2_linea"]
            },
            {
                "domainTable": "infraestructura_exposicion",
                "keyField": "id_infraestructura_exposicion", 
                "descField": "descripcion_infraestructura_exposicion",
                "domainName": "infraestructura_exposicion",
                "domainDesc": "Exposicion de infraestructura",
                "applicationFields": ["id_infraestructura_exposicion"]
            },
            {
                "domainTable": "infraestructura_localizacion",
                "keyField": "id_infraestructura_localizacion", 
                "descField": "descripcion_infraestructura_localizacion",
                "domainName": "infraestructura_localizacion",
                "domainDesc": "Localizacion de infraestructura",
                "applicationFields": ["id_infraestructura_localizacion"]
            },
            {
                "domainTable": "infraestructura_tipo",
                "keyField": "id_infraestructura_tipo", 
                "descField": "descripcion_infraestructura_tipo",
                "domainName": "infraestructura_tipo",
                "domainDesc": "Tipo de infraestructura",
                "applicationFields": ["id_infraestructura_tipo"]
            },
            {
                "domainTable": "playa",
                "keyField": "id_playa", 
                "descField": "descripcion_playa",
                "domainName": "playa",
                "domainDesc": "Playas",
                "applicationFields": ["id_playa"]
            },
            {
                "domainTable": "sustrato",
                "keyField": "id_sustrato", 
                "descField": "Descripcion",
                "domainName": "sustrato",
                "domainDesc": "Tipo de sustrato de costas sedimentarias",
                "applicationFields": ["id_sustrato"]
            },
            {
                "domainTable": "tipo_linea",
                "keyField": "id_tipo_linea", 
                "descField": "Descripcion",
                "domainName": "tipo_linea",
                "domainDesc": "Tipo de linea para generar corta, larga, erosion",
                "applicationFields": ["id_tipo_linea"]
            },
            {
                "domainTable": "tipo_margen",
                "keyField": "id_tipo_margen", 
                "descField": "descripcion_tipo_margen",
                "domainName": "tipo_margen",
                "domainDesc": "Tipo de margen",
                "applicationFields": ["id_tipo_margen"]
            },
            {
                "domainTable": "tipologia_nv1",
                "keyField": "id_tipologia_nv1", 
                "descField": "descripcion_nv1",
                "domainName": "tipologia_nv1",
                "domainDesc": "Tipologia a nivel 1",
                "applicationFields": ["id_tipologia_nv1"]
            },
            {
                "domainTable": "tipologia_nv2",
                "keyField": "id_tipologia_nv2", 
                "descField": "descripcion_nv2",
                "domainName": "tipologia_nv2",
                "domainDesc": "Tipologia a nivel 2",
                "applicationFields": ["id_tipologia_nv2"]
            },
            {
                "domainTable": "tipologia_nv3",
                "keyField": "id_tipologia_nv3", 
                "descField": "descripcion_nv3",
                "domainName": "tipologia_nv3",
                "domainDesc": "Tipologia a nivel 3",
                "applicationFields": ["id_tipologia_nv3"]
            },
            {
                "domainTable": "tipologia_nv4",
                "keyField": "id_tipologia_nv4", 
                "descField": "descripcion_nv4",
                "domainName": "tipologia_nv4",
                "domainDesc": "Tipologia a nivel 4",
                "applicationFields": ["id_tipologia_nv4"]
            },
            {
                "domainTable": "urbano",
                "keyField": "id_urbano", 
                "descField": "descripcion_urbano",
                "domainName": "urbano",
                "domainDesc": "Urbano",
                "applicationFields": ["id_urbano"]
            },
            {
                "domainTable": "urbano_proximidad",
                "keyField": "id_urbano_proximidad", 
                "descField": "descripcion_urbano_proximidad",
                "domainName": "urbano_proximidad",
                "domainDesc": "Proximidad del urbano",
                "applicationFields": ["id_urbano_proximidad"]
            },
            {
                "domainTable": "excl_dsas",
                "keyField": "id_excl_dsas", 
                "descField": "excl_dsas",
                "domainName": "excl_dsas",
                "domainDesc": "Exclusion DSAS",
                "applicationFields": ["id_excl_dsas"]
            },
            {
                "domainTable": "causa_excl",
                "keyField": "id_causa_excl", 
                "descField": "causa_excl",
                "domainName": "causa_excl",
                "domainDesc": "Causa de exclusion",
                "applicationFields": ["id_causa_excl"]
            }
        ]

        db = pyarcgis.GeoDatabase("linea_costa", workspace=database)
        for d in domains:
            messages.addMessage(d)
            domain = pyarcgis.GeoDatabaseDomain(d["domainName"], d["domainDesc"])
            db.tableToDomain(d["domainTable"], d["keyField"], d["descField"], domain)
            for field in d["applicationFields"]:
                db.assignDomainToField("ed50_utm_30n\\linea_costa", field, domain)

        return True

