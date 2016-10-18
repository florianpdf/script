git status
echo '\n'
read -r -p "Fichiers ok ??? 
[n/Y] " response
case $response in
    [nN][oO]|[nN]) 
        echo '\n'
        echo 'Vérifie'
        ;;
    *)
        git add .
        git commit
        echo '\n'
        read -r -p "On push ???   [n/Y]  " response
        echo '\n'
        case $response in
            [nN][oO]|[nN]) 
                echo 'Ok push toi même \n'
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
