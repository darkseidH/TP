#!/usr/bin/python
# -*- coding: utf-8 -*-
familles = {
	'genre':{'genre':3, 'espece':4, 'famille':5, 'nom_commun':10, 'variete':11},
	'infos':{'annee_plantation':6, 'hauteur':7, 'circonference':8},
	'adresse':{'geopoint':1, 'arrondissement':2, 'adresse':9, 'nom_ev':13}}
from sys import stdin
from os import getenv
# définir la variable arbres avec le LOGNAME
print "arbres='%sArbres'" % getenv('LOGNAME')
# créer la table
print "create arbres, %s" % (", ".join(["'%s'"%famille for famille in familles]))
for ligne in stdin:
	ligne = ligne.strip()
	if not ligne.startswith('('): continue
	mots = ligne.split(';')
	# identifiant
	id = "arbre-%02d" % int(mots[12 - 1])
	# produire les cellules
	for famille in familles:
		for colonne in familles[famille]:
			numero = familles[famille][colonne] - 1
			valeur = mots[numero].replace("'","_")
			if not valeur: continue
			print "put arbres, '%s', '%s:%s', '%s'" % (id, famille, colonne, valeur)
# affichage de la table à la fin
	print "scan arbres"
