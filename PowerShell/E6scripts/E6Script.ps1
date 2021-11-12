# Edwin Soto Arregoitia, Adrian Alejandro Treviño Bautista, Sofia Flores Cisneros
#Este script amigable te ayudara en caso de no saber la hora fecha, el calendario
#O buscar doc. de una fecha especifica
#Fuentes de consulta https://crisroblesti.wordpress.com/2018/02/13/funciones-en-powershell/
import-module -name Seteolvidolahora 
clear-host 
function get-menu{
$Menu= Read-Host "Elige una opcion: 
1:¿Deseas ver el calendario?
2:¿Desea ver la hora o la fecha?                                               
3:¿Deseas ver archivos de una fecha en concreto?
4:Salida                                                                         
Opción"
clear-host
Switch($Menu){
  1{Show-Calendar -ErrorAction SilentlyContinue} 
  2{Hora-fecha}
  #Si los datos no se colocan bien marcara error
  3{Archivos-fecha}
  4{Exit}
  Default {Write-Host "Opción no valida" -ErrorAction SilentlyContinue}
}} 

do{
  ""
  get-menu
  }while($true)