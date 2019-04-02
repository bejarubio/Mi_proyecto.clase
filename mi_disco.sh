#!/bin/bash

#
#  Archivo con el código asociado a la gestión de Disco
#

menu_secundario_disco(){
	clear
	echo "-----------------MENU SECUNDARIO DISCOS-----------------------------------------------"    
	echo "----------------------------------------------------------------" 	
   echo -e " \n \p Ha seleccionado la opción HACER PARTICIONES"
   echo -e " \n \r Ha seleccionado la opción MONTAR UN RAID 5"
   echo -e " \n \b Ha seleccionado la opción BORRADO DE LAS PARTICIONES Y SUS PUNTOS DE MONTAJE"
   echo -e " \n \f Ha seleccionado la opción VOLVER AL MENU PRINCIPAL"
   echo "----------------------------------------------------------------" 	 
   echo "----------------------------------------------------------------"
while !([ "$opcion" = 'f' ])
do	
	echo "seleccionar una opcion"	
	 read opcion 
	echo "Menu Procesos"
	case $opcion in
      	p) 
				gestionar_particiones
				read fin_proceso
			;;	
	
			r) 
				gestionar_prioridad

				read fin_disco

			;;
			
			b)
			
			
			;;
			
			f) 
				echo f	
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


gestionar_particiones()
{   

size=`fdisk -l | grep sd$ | cut -d ' ' -f  3-4` 
if [ $size -le 5 ]; then
   echo El disco debe ser mayor que 5
   exit 3
fi
    echo "Se va a montar dos particiones del disco que hemos insertado"
fdisk /dev/sdb <<EOF
n
p
1

+5GB
w
EOF

fdisk /dev/sdb <<EOF
n
p
2


w
EOF
 	
	echo "Se estan montando los puntos de montaje"
mkdir /mnt/respaldo_3 2> /dev/null ; mkdir /mnt/respaldo_2 2> /dev/null
mkfs.ext4 /dev/sdb1 
mount -t ext4 /dev/sdb1 /mnt/respaldo_2 > /dev/null
mkfs.ext4 /dev/sdb2
mount -t ext4 /dev/sdb2 /mnt/respaldo_3 > /dev/null

	echo " Modifico el archivo fstab para hacer permanente el montaje de las particiones "
cp /home/david/Escritorio/fstab_original /etc/fstab
cat /etc/fstab > /mnt/seguridad/seguridad.txt 2> /dev/null
echo "/dev/sdb1 /respaldo_2 ext4 defaults 2 1" >> /etc/fstab
echo "/dev/sdb2 /respaldo_3 ext4 defaults 2 1" >> /etc/fstab


}


eliminar_parti()
{
	echo " Ha elegido sabiamente al desmontar las particiones joven padawan"
if [ $usuario != "root" ]; 
then
   echo El script tiene que ejecutarse con usuario root
   exit 1 
fi

umount /dev/sdb1
umount /dev/sdb1
umount /dev/sdb2
umount /dev/sdb2
rm /mnt/seguridad/seguridad.txt
rm -r /mnt/respaldo_2
rm -r /mnt/respaldo_3
fdisk /dev/sdb <<EOF
d
1
d
w
EOF
}

montaje_raid()
{
cat /proc/mdstat
sudo mknod /dev/md0 b 9 0
fdisk -l | grep /dev/md0
ls -la | grep /dev/md0
ls /dev | grep /md0
sudo mdadm --create /dev/md0 --level=raid5 --raid-devices=3 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 --spare-devices=1 /dev/sdg1
sudo mdadm --create /dev/md0 --level=raid5 --raid-devices=4 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 --spare-devices=1 /dev/sdg1
cat /proc/mdstat
sudo mdadm --detail /dev/md0
fdisk -l
sudo fdisk -l
sudo mkdir /media/mi_raid_5
sudo mkfs.ext4 /dev/md0
sudo mount -t ext4 /dev/md0 /media/mi_raid_5
sudo nautilus
exit
mkdir mierde
sudo mkdir mierde
sudo mdadm --detail--scan
sudo mdadm --detail --scan
history
sudo umount /dev/md0
$?
sudo umount /dev/md0
df -h
sudo umount /dev/md0
df -h
nano fstap
ls etc
ls /etc
nano /etc/fstab 
sudo nano /etc/fstab 
mount /dev/md0
sudo mount /dev/md0
sudo nano /etc/fstab 
sudo mount /dev/md0
sudo nano /etc/mdadm/mdadm.conf
vim /etc/fstab
cat /etc/fstab
df -h
mount /dev/md127
sudo nano /etc/mdadm/mdadm.conf
EXIT
exit
cat /etc/fstab
nano /etc/fstab
sudo nano /etc/fstab
sudo nano /etc/mdadm/mdadm.conf

}
