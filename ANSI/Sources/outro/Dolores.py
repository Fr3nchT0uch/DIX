# -*- coding:cp437 -*-
# WARNIG : encodage pour Console DOS sous Windows uniquement !!!

# DoLores (c) www.ctrl-pomme-reset.fr
# version 0.041 (23.06.2014)

# transforme un BMP (256 couleurs avec palette APPLEII 16 couleurs sur les 16 premiers index)
# vers format DLORES (80xLignes)
# BMP : 80 octets par ligne  - couleur cod‚e sur 1 octet ($00-$0F)
# BMP : lignes sauv‚es de BAS vers HAUT (la premiŠre ligne est donc en fin de fichier)
# entr‚e : xxxx.bmp
# sortie : xxxx

import sys
import glob
import os.path


paletteA2  = [0x00,0x02,0x04,0x06,0x01,0x03,0x08,0x0A,0x05,0x07,0x0C,0x0E,0x09,0x0B,0x0D,0x0F]
paletteAux = [0x00,0x08,0x01,0x09,0x02,0x0A,0x03,0x0B,0x04,0x0C,0x05,0x0D,0x06,0x0E,0x07,0x0F]

def TraitementFichier(nameBMP,nameOut):

    fbmp = open(nameBMP,"rb")
    load = fbmp.read()                                  # lecture du fichier BMP
    lenBMP = len(load)                                  # on r‚cupŠre sa taille
    
    workBMP = bytearray(load)                           # on transforme en byte array

    nbLigne = workBMP[22]+(workBMP[23]*256)             # r‚cup‚ration nb de ligne (offset 22 et 23) (attention $FFFF maxi)
    OffsetFirstLigne = (nbLigne-1)*80+ 1078             # offset premiŠre ligne de l'image
    OffsetSecondLigne = OffsetFirstLigne - 80           # offset seconde ligne de l'image 

    workOut = bytearray()                               # cr‚ation byte array de sortie
    workOut.append(0)                                   # on laisse de la place pour la nb de ligne

    # traitement
    i = 0                                               # index ligne
    j = 0                                               # index byte (80 par ligne)
    CountOut = 1                                        # compteur fichier sortie (pour la taille) - on d‚marre … 1 pour l'octet r‚serv‚
    while i<(nbLigne/2):                                # boucle principale (compteur ligne/2 -> on traite 2 lignes … la fois)
        while j<80:                                     # boucle secondaire (compteur byte)
            OffsetB1 = OffsetFirstLigne - (80*i*2) + j
            OffsetB2 = OffsetSecondLigne - (80*i*2) + j
            a = paletteA2[workBMP[OffsetB1]]            # on r‚cupŠre la couleur correspondante 
            b = paletteA2[workBMP[OffsetB2]]            # … la palette Apple II
            
            if (j%2) == 0:                              # si colonne paire (mem aux)
                a = paletteAux[a]
                b = paletteAux[b]                       # on rechange l'index de palette
            
            workOut.append(a+b*16)                      # on remplit
            CountOut +=1                                # on ajoute 1
            j +=1
        j = 0   # remise … 0
        i +=1

    workOut[0] = nbLigne/2                              # on fixe le nb de ligne (divis‚ par 2 car deux car/ligne en LORES)
    ###
    fOut = open(nameOut,"wb")                           # ouverture/cr‚ationfichier de sortie
    fOut.write(workOut)                                 # ‚criture de la byte array vers le fichier de sortie
    
    # fin - nettoyage / fermeture fichiers
    fbmp.close()                                        # fermeture fichier BMP
    fOut.close()                                        # fermeture fichier sortie

    return nbLigne,CountOut
    ########

if __name__ == '__main__':

    print
    print("DoLores v0.041 - 2014")
    print 
	
    

    l = glob.glob('*.bmp')                                          # liste tous les fichiers .bmp du rep
    for i in l:                                                     # boucle traitement liste
        (filepath,filename)=os.path.split(i)                        # d‚coupe path+filename
        (shortname,extension)=os.path.splitext(filename)            # d‚coupe name+extension
        (nbLigne,CountOut) = TraitementFichier(filename,shortname)  # on traite chaque fichier BMP
        print '{} => {} ({}x2 lignes - {} octets)'.format(filename,shortname,nbLigne/2,CountOut)
        
