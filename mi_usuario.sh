#!/bin/bash

#
#  Archivo con el código asociado a la gestión de Usuarios
#


menu_secundario_usuario(){
	clear
	echo "-----------------MENU SECUNDARIO USUARIO-----------------------------------------------"    
	echo "----------------------------------------------------------------" 	
   echo -e " \n \g Ha seleccionado la opción GESTIONAR GRUPOS"
   echo -e " \n \u Ha seleccionado la opción GESTIONAR USUARIOS"
   echo -e " \n \b Ha seleccionado la opción ELIMINAR GRUPOS Y USUARIOS"
   echo -e " \n \i Ha seleccionado la opción INSTALAR PAQUETE"
   echo -e " \n \f Ha seleccionado la opción VOLVER AL MENU PRINCIPAL"
   echo "----------------------------------------------------------------" 	 
   echo "----------------------------------------------------------------"
while !([ "$opcion" = 'f' ])
do	
	echo "seleccionar una opcion"	
	 read opcion 
	echo "Menu Procesos"
	case $opcion in
      	g) 
				gestionar_grupos
				
			;;	
	
			d) 
				gestionar_usuarios

				

			;;

			b) 
				eliminar_gru_us		
				
				
			;;
			
			f) 	
				echo f
				clear
			;;
			
			i)
				instalar_paquete	
			*) 
				echo "Opción incorrecta"		
				read fin_incorrecto
				clear
			;;
			esac
done


}

gestionar_grupos()
{
	echo "Se va a proceder a crear el grupo, intruduzca el nombre del grupo"
		read grupo
		groupadd $grupo
	
}


gestionar_usuarios()
{    
    	
	echo "Introduce el nombre del usuario que quieres crear y se añadira al grupo creado anteriormente"
		read nombre
		useradd -d /home/$nombre -m -g $grupo -s /bin/bash $nombre
		echo"$nombre:$nombre" | chpasswd
    
}

eliminar_gru_us()
{
	echo "Has seleccionado eliminar primero el usuario, introduce su nombre"
		read nombre_1
	echo "Has seleccionado eliminar el grupo, introduce su nombre"
		read grupo_1
	userdel $nombre_1
	groupdel $grupo_1
}

instalar_paquete()
{
		echo "Escribe por teclado el paquete que quieras instalar"
 			read paquet
			apt-get install $paquet
}
