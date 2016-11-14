read -r -p "Choisi un serveur: 
-- Hopital 
-- Bleau_vps (bvps)
-- Bleau_o2switch (bo2s)
-- Chouettes
==> " response
case $response in
    [hH][oO][pP][iI][tT][aA][lL]) 
        ssh root@80.67.190.170
        ;;
    [b][v][p][s])
        ssh root@80.67.190.137
        ;;
    [b][o][2][s])
        ssh wcsfont@wcs-fontainebleau.fr
        ;;
    [c][h][o][u][e][t][t][e][s])
        ssh chouettes@chouetteshiboux.com
        ;;
    *)
        echo "Pas de serveur portant ce nom"
        
esac