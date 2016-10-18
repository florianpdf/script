read -r -p "Choisi un serveur: 
-- Hopital 
-- Fontainebleau (bleau)
==> " response
case $response in
    [hH][oO][pP][iI][tT][aA][lL]) 
        ssh root@80.67.190.170
        ;;
    [bB][lL][eE][aA][uU])
        ssh root@80.67.190.137
        ;;
    *)
        echo "Pas de serveur portant ce nom"
        
esac