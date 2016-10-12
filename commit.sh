git status
read -r -p "Fichiers ok ??? [N/y]" response
case $response in
    [yY][eE][sS]|[yY]) 
        git add .
        git commit

        read -r -p "On push ??? [N/y]" response
        case $response in
            [yY][eE][sS]|[yY]) 
                branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
                read -r -p "Branch "$branch" [N/y]" response
                case $response in
                    [yY][eE][sS]|[yY]) 
                        git push origin "$branch"
                        ;;
                    *)
                        echo 'Vérifie ta branche \n'
                        ;;
                esac
                ;;
            *)
                echo 'Ok push toi même \n'
                ;;
        esac
        ;;
    *)
        echo 'Vérifie \n'
        ;;
esac
