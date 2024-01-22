Algoritmo sin_titulo
	
	//Por Juan Diego Ospina
	
	Definir cotizaciones Como Real
	Definir sumaCotizaciones, cotizacionMinima, cotizacionMaxima, promedio, presupuestoTotal Como Real
	Definir i Como Entero
	Repetir
		Escribir "Ingrese el presupuesto total (debe ser mayor o igual a 50000): "
		Leer presupuestoTotal
		
		Si presupuestoTotal < 50000 Entonces
			Escribir "Error: El presupuesto total debe ser mayor o igual a 50000. Intente nuevamente."
		Fin Si
	Hasta Que presupuestoTotal >= 50000
	sumaCotizaciones <- 0.0
	cotizacionMinima <- 0.0
	cotizacionMaxima <- 0.0
	Escribir "\nIngrese el monto de las 5 cotizaciones:"
	Para i <- 1 Hasta 5 Con Paso 1 Hacer
		Repetir
			Escribir "Empresa ", i, ": $"
			Leer cotizaciones
			
			Si cotizaciones <= 0 Entonces
				Escribir "Error: El monto debe ser mayor a cero. Intente nuevamente."
			Sino 
				Si cotizaciones <= 1000 Entonces
					Escribir "Error: El monto debe ser mayor a 1000. Intente nuevamente."
				Fin Si
			Fin Si
		Hasta Que cotizaciones > 0 Y cotizaciones > 1000
		sumaCotizaciones <- sumaCotizaciones + cotizaciones
		Si i = 1 Entonces
			cotizacionMinima <- cotizaciones
			cotizacionMaxima <- cotizaciones
		Sino
			Si cotizaciones < cotizacionMinima Entonces
				cotizacionMinima <- cotizaciones
			Sino 
				Si cotizaciones > cotizacionMaxima Entonces
					cotizacionMaxima <- cotizaciones
				Fin Si
			Fin Si
		Fin Si
	Fin Para
	promedio <- (sumaCotizaciones - cotizacionMinima - cotizacionMaxima) / 3
	Escribir "\nCotizaciones eliminadas:"
	Escribir "Mas barata: $", cotizacionMinima
	Escribir "Mas cara: $", cotizacionMaxima
	Escribir "\nPresupuesto total ingresado: $", presupuestoTotal
	Escribir "Promedio de las cotizaciones restantes: $", promedio
	
FinAlgoritmo

