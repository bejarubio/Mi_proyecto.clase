#!/bin/bash
source mi_extra.sh
#
#  Archivo con el código asociado a la gestión de procesos
#

menu_secundario_proceso(){
	clear
	echo "-----------------MENU SECUNDARIO PROCESOS-----------------------------------------------"    
	echo "----------------------------------------------------------------" 	
   echo -e " \n \u Ha seleccionado la opción GESTIONAR SEÑAL"
   echo -e " \n \d Ha seleccionado la opción GESTIONAR PRIORIDAD"
   echo -e " \n \s Ha seleccionado la opción VOLVER AL MENU PRINCIPAL"
   echo "----------------------------------------------------------------" 	 
   echo "----------------------------------------------------------------"
while !([ "$opcion" = 'e' ])
do	
	echo "seleccionar una opcion"	
	 read opcion 
	echo "Menu Procesos"
	case $opcion in
      	u) 
				consultar_procesos
				read fin_proceso
			;;	
	
			d) 
				gestionar_prioridad

				read fin_disco

			;;

			s) 
				informacion_final_salir
				read fin_salir		
				clear	
				
			;;
	
			*) 
				echo "Opción incorrecta"		
				read fin_incorrecto
				clear
			;;
			esac
done


}
consultar_procesos()
{    
    	
    echo "¿Quieres visualizar la informacion de los procesos?"
	ps -la
    echo "Asignale un numero al proceso"
	read PID
	kill -l
    echo " En base a lo visto en las opciones de kill que opcion quieres tu "
	read opcion1
if [ $opcion1 -gt 65 ]
then
	echo Solo hay 64 opciones
	exit 1
fi
      kill $opcion1 $PID  | ps -la
	    
}
gestionar_prioridad()
{
	echo "listado de procesos"
	ps -la
	echo "dime el PID"
	read proceso_id

	echo "elegir prioridad"
	read prioridad

	echo "cambio de prioridad"
	renice $prioridad $proceso_id

	if [ $? -eq 0 ]
	then
		echo "has cambiado la prioridad"
		ps -ao stat,pcpu,pid,user,fname,nice

	else
		echo echo "no has cambiado la prioridad"
	fi
}
