# coding=utf8

'''

Shape bulk exporter from a PostGIS. Depends on ogr2ogr

'''

import os

class ShapeBulkExporter:
	"""
	Shape bulk exporter from PostGIS.
	"""

	__conns = None
	"""Connection strings."""

	__ogr2ogrPath = ''
	
	def __init__(self, ogr2ogrPath):
		"""Class initializer."""

		self.__conns = dict()
		self.__ogr2ogrPath = ogr2ogrPath


	def addPgConnection(self, name, host, dbname, port, user, password):
		"""Creates a connection to PostGIS."""

		connString = 'PG:"host='+host+ \
			' user='+user+ \
			' dbname='+dbname+ \
			' password='+password+ \
			' port='+port+'"'
			
		self.__conns[name] = connString


	def toShape(self, connection, tableName, shapeName, geometry, \
				epsg, encoding='UTF8', folder='.', overwrite=False):
		"""Exports to shape a table or view in connection."""

		com = self.__ogr2ogrPath+' '

		if overwrite:
			com = com+'-overwrite '

		com = com+'-f "ESRI Shapefile" '+ \
			  folder+' '+ \
			  self.__conns[connection]+' '+ \
			  '"'+tableName+'" '+ \
			  '-a_srs EPSG:'+str(epsg)+' '+ \
			  '-nln '+shapeName+' '+ \
			  '-lco ENCODING='+encoding+' '+\
			  '-lco SHPT='+geometry

		os.system(com)
		
