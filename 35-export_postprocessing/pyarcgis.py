# coding=UTF8

"""

pyarcgis: wrapper to arcpy with objects.

"""
import arcpy


class GeoDatabase(object):
    """Geodatabase object."""
    id = None
    workspace = None

    def __init__(self, id, workspace=None):
        """Constructor."""
        self.id = id
        self.setWorkspace(workspace)

    def setWorkspace(self, workspace):
        """Sets the workspace for this database."""
        self.workspace = workspace

    def tableToDomain(self, table, idField, descField, domain, replace=None, database=None):
        """Creates a domain from a table."""
        database = self.workspace if database==None else database
        mode = "REPLACE" if replace==None or replace==True else "APPEND"

        if self.workspace==None:
            raise NoWorkspaceError(self.id)

        arcpy.TableToDomain_management(self.workspace+"\\"+table, idField, descField, database, 
                                       domain.name, domain.description, mode)
        domain.setCreationDatabase(self)
        return domain

    def assignDomainToField(self, table, applyField, domain):
        """Applies a domain to a field."""
        arcpy.AssignDomainToField_management(self.workspace+"\\"+table, applyField, domain.name, "")
        return self


class GeoDatabaseDomain(object):
    """Geodatabase domain."""
    name = None
    description = None
    creationDatabase = None

    def __init__(self, name, description):
        """Constructor."""
        self.name = name
        self.description = description

    def setCreationDatabase(self, database):
        """Sets the creation database."""
        self.creationDatabase = database


class NoWorkspaceError(Exception):
    def __init__(self, value):
        self.value = value
        
    def __str__(self):
        return "No workspace defined "+self.value
