git status
read -r -p "Fichiers ok ??? [n/Y]" response
case $response in
    [nN][oO]|[nN]) 
        echo 'Vérifie \n'
        ;;
    *)
        git add .
        git commit

        read -r -p "On push ??? [n/Y]" response
        case $response in
            [nN][oO]|[nN]) 
                echo 'Ok push toi même \n'
                ;;
            *)
                branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
                read -r -p "Branch "$branch" [n/Y]" response
                case $response in
                    [nN][oO]|[nN]) 
                        echo 'Vérifie ta branche \n'
                        ;;
                    *)
                        git push origin "$branch"
                        ;;

                esac
                ;;
               
        esac
        ;;
esac
