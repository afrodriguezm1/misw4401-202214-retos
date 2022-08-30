set ant 999

atget id id
getpos2 lonSen latSen
set ite 0
battery set 100

loop
read mens
rdata mens tipo valor

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
   inc ite
   if (ite >= 1000)
      cprint "stop alerta " id " Cantidad mensajes: " ite
      data mens "stop"
      send mens
      stop
   end
end

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
   inc ite
   if (ite >= 1000)
      data mens "stop"
      send mens
      cprint "stop cantidad de mensajes - Sensor: " id " Cantidad mensajes: " ite
      stop
   end
end


if (tipo=="stop")
   data mens "stop"
   send mens
   cprint "Para sensor: " id " Cantidad mensajes: " ite
   wait 1000
   stop
end

battery bat
if(bat<5)
   cprint "Bateria critica sensor: " id " Cantidad mensajes: " ite
	data mens "critico" lonSen latSen
	send mens ant
end
delay 100