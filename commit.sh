git status
read -r -p "Fichiers ok ??? 
[n/Y] " response
case $response in
    [nN][oO]|[nN]) 
        echo 'Vérifie'
        ;;
    *)
        git add .
        git commit

        read -r -p "On push ??? 
        [n/Y]  " response
        case $response in
            [nN][oO]|[nN]) 
                echo 'Ok push toi même'
                ;;
            *)
                branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
                read -r -p "Branch "$branch" 
                [n/Y]  " response
                case $response in
                    [nN][oO]|[nN]) 
                        echo 'Vérifie ta branche'
                        ;;
                    *)
                        git push origin "$branch"
                        ;;

                esac
                ;;
               
        esac
        ;;
esac
