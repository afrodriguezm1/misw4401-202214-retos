atget id id

data p "hola" id id
send p

loop
read mens
rdata mens tipo valor1 valor2

if(tipo == "critico")
	cprint "Nodo descargado en: longitud" valor1 ", latitud: " valor2
	data p "stop"	
	send p
	wait 1000
	stop
end

if(tipo == "stop")
	cprint "1000 mensajes enviados"
	data p "stop"	
	send p
	wait 1000
	stop
end

wait 100