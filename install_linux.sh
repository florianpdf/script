echo "\033[0;31m Bienvenue \n"
echo "\033[0;31m Ce script va te permettre d'installer les principaux outils sur une distribution Linux Ubuntu 16.04"
echo "\033[0;31m Les outils suivant seront instalés (dans l'ordre)"
echo "\033[0;31m Tu as la possibilité de refuser l'installation d'un outil"
echo "\033[0;31m 1. Mise à jour de la librairie apt-get"
echo "\033[0;31m 2. Mise à jour de votre OS"
echo "\033[0;31m 3. Installation et configuration de git"
echo "\033[0;31m 4. Création d'un gitignore global pour Symfony2"
echo "\033[0;31m 5. Installation de LAMP (Apache, MySql, PHP)"
echo "\033[0;31m 6. Installation de phpMyAdmin \n"

###################################
#### Définition des fonctions #####
###################################

show_gitignore (){
echo "# Cache and logs (Symfony2)
/app/cache/*
/app/logs/*
!app/cache/.gitkeep
!app/logs/.gitkeep

# Email spool folder
/app/spool/*

# Cache, session files and logs (Symfony3)
/var/cache/*
/var/logs/*
/var/sessions/*
!var/cache/.gitkeep
!var/logs/.gitkeep
!var/sessions/.gitkeep

# Parameters
/app/config/parameters.yml
/app/config/parameters.ini

# Managed by Composer
/app/bootstrap.php.cache
/var/bootstrap.php.cache
/bin/*
!bin/console
!bin/symfony_requirements
/vendor/

# Assets and user uploads
/web/bundles/
/web/uploads/

# Assets managed by Bower
/web/assets/vendor/

# PHPUnit
/app/phpunit.xml
/phpunit.xml

# Build data
/build/

# Composer PHAR
/composer.phar

# Backup entities generated with doctrine:generate:entities command
*/Entity/*~

# PhpStorm config
.idea"
}

###################################
# Fin de Définition des fonctions #
###################################

read -r -p "On continue ? [N/y] " response
case $response in
    [yY][eE][sS]|[yY]) 
		echo "\033[31;1;4;5;7mUpdate apt-get \033[0m\n"
		read -r -p "On coninue ? [N/y] \n" response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo apt-get update
		        echo "\n"
		        echo "Done... \n"
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Upgrade apt-get \033[0m\n"
		read -r -p "On coninue ? [N/y] \n" response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo apt-get upgrade
		        echo "\n"
		        echo "Done... \n"
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Installation de git \033[0m\n"
		read -r -p "On coninue ? [N/y] \n" response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo apt-get install git
		        echo "\n"
		        echo "\033[32;1;1;1;3m Now that you have git installed, you need to do a few things so that the commit messages that will be generated for you will contain your correct information.\n"
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
				config_git (){
					echo "\033[0;36mSaisi ton nom\033[0m"
					read nom
					echo "\033[0;36mSaisi ton prenom\033[0m"
					read prenom
					echo "\033[0;36mSaisi l'adresse mail que tu as utilisé lors de ton inscription à github\033[0m"
					read github
					echo "\n"
					echo "\033[31;1;4;5;7mLes informations saisis sont:\033[0m"
					echo "\033[31;1;4;5;7mNom et prénom:\033[0m $nom $prenom"
					echo "\033[31;1;4;5;7mE-mail:\033[0m $github \n"
					read -r -p "Ces infos sont-elles correct ? [N/y] " response
					case $response in
					    [yY][eE][sS]|[yY])
							git config --global user.name "$nom $prenom"
							git config --global user.email "$github"
							;;
						*)
							echo "\n"
							echo "On recommence \n"
							config_git
							;;
						esac
				}
				config_git
				echo "\n"
				echo "\033[32;1;1;1;3m Git est maintenant installé et configuré."
				echo "\n"
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Création d'un gitignore global pour Symfony2 \033[0m\n"
		echo "\033[32;1;1;1;3m Source: https://github.com/github/gitignore/blob/master/ \033[0m\n"
		read -r -p "Souhaite tu créer un gitignore_global ? [N/y]" response
		case $response in
		    [yY][eE][sS]|[yY])
		    	echo "\n"	
				read -r -p "Souhaite tu consulter au préalable le detail du gitignore_global avant de le créer ? [N/y]" response
				case $response in
				    [yY][eE][sS]|[yY])
						echo "\n"
						show_gitignore
						echo "\n"
						read -r -p "Cela te convient ? [N/y]" response
						case $response in
						    [yY][eE][sS]|[yY])
								git config --global core.excludesfile ~/.gitignore_global
								show_gitignore > ~/.gitignore_global
								echo "\n"
								echo "Le fichier à été créé dans ton home, tu peux le modifier à tout moment \n"
						        echo "Appuie sur Entrée pour continuer... \n"
								;;
							*)
								echo "\n"
								echo "No problème, on continue"
								;;
						esac
						;;
					*)
						echo "\n"
						git config --global core.excludesfile ~/.gitignore_global
						show_gitignore > ~/.gitignore_global
						echo "Le fichier à été créé dans ton home, tu peux le modifier à tout moment \n"
				        echo "Appuie sur Entrée pour continuer... \n"
						;;
				esac
				;;

			*)
				echo "\n"
				echo "No problème on continu l'install"
				;;
		esac

		echo "\033[31;1;4;5;7m Installation de Sublime Text V2 ou V3 \033[0m\n"
		read -r -p "On coninue ? [N/y] " response
		case $response in
		    [yY][eE][sS]|[yY])
				read -r -p "v2 ou v3 (Par default v3) ? [V3/v2] " response
					case $response in
					    [V2][v2]) 
					        sudo add-apt-repository ppa:webupd8team/sublime-text-2
							sudo apt-get update
							sudo apt-get install sublime-text
					        echo "Appuie sur Entrée pour continuer... \n"
							read a
					        ;;
					    *)
							sudo add-apt-repository ppa:webupd8team/sublime-text-3
							sudo apt-get update
							sudo apt-get install sublime-text-installer
					        echo "Appuie sur Entrée pour continuer... \n"
							read a
					        ;;
					esac
				;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Installation de LAMP \033[0m\n"
		read -r -p "On coninue ? [N/y] " response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo apt-get install apache2 php mysql-server libapache2-mod-php php-mysql
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Modification des droits sur localhost, passage en 777 sur /var/www/html \033[0m\n"
		read -r -p "On coninue ? [N/y] " response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo chmod -R 777 /var/www/html/
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Rename index.html \033[0m\n"
		read -r -p "On coninue ? [N/y] " response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo mv /var/www/html/index.html /var/www/html/index
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac

		echo "\033[31;1;4;5;7m Installation de phpMyAdmin \033[0m\n"
		echo "\033[32;1;1;1;3m This will ask you a few questions in order to configure your installation correctly. \n"

		echo "\033[31;1;1;1;3m Warning: When the first prompt appears, apache2 is highlighted, but not selected. \n" 
		echo "\033[31;1;1;1;3m If you do not hit Space to select Apache, the installer will not move the necessary files during installation. \n" 
		echo "\033[31;1;1;1;3m Hit Space, Tab, and then Enter to select Apache. \n"

		echo "\033[32;1;1;1;3m For the server selection, choose apache2. \n"
		echo "\033[32;1;1;1;3m Select yes when asked whether to use dbconfig-common to set up the database \n"
		echo "\033[32;1;1;1;3m You will be prompted for your database administrator's password \n"

		echo "\033[32;1;1;1;3m You will then be asked to choose and confirm a password for the phpMyAdmin application itself \033[0m\n"

		read -r -p "On coninue ? [N/y] " response
		case $response in
		    [yY][eE][sS]|[yY]) 
		        sudo apt-get install phpmyadmin php-mbstring php-gettext
		        echo "Appuie sur Entrée pour continuer... \n"
				read a
				echo "\033[31;1;1;1;3m The installation process actually adds the phpMyAdmin Apache configuration file into the \033[0;3m /etc/apache2/conf-enabled/ \033[31;1;1;1;3m directory, where it is automatically read. \n"
		        echo "\033[31;1;1;1;3m The only thing we need to do is explicitly enable the PHP mcrypt and mbstring extensions, which we can do by typing: \n"
		        echo "\033[31;1;4;5;7m Continuer ?"
		        read -r -p "On coninue ? [N/y] " response
					case $response in
		    			[yY][eE][sS]|[yY])
							sudo phpenmod mcrypt
							sudo phpenmod mbstring
							echo "\033[31;1;4;5;7m Restart du serveur Apache"
							echo "Appuie sur Entrée pour continuer... \n"
							read a
							sudo systemctl restart apache2
							echo "\033[31;1;1;1;3m You can now access the web interface by visiting your server's domain name or public IP address followed by /phpmyadmin \n"
					        echo "\033[31;1;1;1;3m Merci à DigitalOcean || https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-16-04 \n"
					        echo "Appuie sur Entrée pour continuer... \n"
							read a
							;;
						*)
							echo "\033[31;1;4;5;7m Restart du serveur Apache"
							echo "Appuie sur Entrée pour continuer... \n"
							read a
							sudo systemctl restart apache2
							echo "\033[31;1;1;1;3m You can now access the web interface by visiting your server's domain name or public IP address followed by /phpmyadmin"
					        echo "\033[31;1;1;1;3m Merci à DigitalOcean || https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-16-04"
					        echo "Appuie sur Entrée pour continuer... \n"
							read a
							;;
					esac
		        ;;
		    *)
		        echo 'Au suivant... \n'
		        ;;
		esac
		;;
    *)
        echo 'A bientot... \n'
        ;;
esac
