Algoritmo CotizacionesEmpresas
	
	//Por Sebastián Mosquera
	
    Dimension  numeroEmpresas[5], cotizaciones[5] 
    Definir suma, minCotizacion, maxCotizacion, presupuesto como Real
    Definir minIndex, maxIndex, cotizacionesOptimas, mejorAjusteIndex como Entero
    Definir promedio, mejorAjuste como Real
    Definir i como Entero // Variable de control de bucle
	

    // Validar el presupuesto
    Mientras (presupuesto < 500000 o presupuesto > 1500000) Hacer
        Escribir "Ingrese el presupuesto disponible (entre 500000 y 1500000): " 
        Leer presupuesto
		
        Si (presupuesto < 500000 o presupuesto > 1500000) Entonces
            Escribir "Presupuesto fuera de rango"
        Fin Si
	FinMientras
	


			// Pedir las cotizaciones y asignar números de empresa
			Escribir "Ingrese las cotizaciones de las 5 empresas (cada una entre 500000 y 1500000):"
			Para i = 1 Hasta 5 Con Paso 1 Hacer
				
				Escribir "Ingrese la cotizacion de la empresa ", i, " :"
				Leer cotizaciones[i]
				
				Si (cotizaciones[i] < 500000 o cotizaciones[i] > 1500000) Entonces
					Escribir "Cotizacion de la empresa ", i, " Fuera de rango" 
				Fin Si
					suma = suma + cotizaciones[i]
					numeroEmpresas[i] = i + 1
				
				
			 Fin Para
					
					// Encontrar la cotización más baja y más alta
					minCotizacion = cotizaciones[1]
					maxCotizacion = cotizaciones[1]
					minIndex = 0
					maxIndex = 0
					
					Para i = 1 Hasta 5
						Si (cotizaciones[i] < minCotizacion) Entonces
							minCotizacion = cotizaciones[i]
							minIndex = i
						Fin Si
						
						Si (cotizaciones[i] > maxCotizacion) Entonces
							maxCotizacion = cotizaciones[i]
							maxIndex = i
						Fin Si
					Fin Para
					
					
					Escribir "Cotización más baja eliminada:"
					Escribir "Empresa ", numeroEmpresas[minIndex], ": ", minCotizacion
					Escribir "Cotización más alta eliminada:"
					Escribir "Empresa ", numeroEmpresas[maxIndex], ": ", maxCotizacion
					
					
					promedio = suma / 5
					Escribir "Promedio de todas las cotizaciones: ", promedio
					
					
					Escribir "Cotizaciones restantes más óptimas:"
					
					
					cotizacionesOptimas = 0
					Para i = 1 Hasta 5
						Si (i <> minIndex y i <> maxIndex y cotizaciones[i] <> promedio) Entonces
							Si (Abs(cotizaciones[i] - presupuesto) = Abs(minCotizacion - presupuesto)) Entonces
								Escribir "Empresa ", numeroEmpresas[i], ": ", cotizaciones[i]
								cotizacionesOptimas = cotizacionesOptimas + 1
							Fin Si
						Fin Si
					Fin Para
					
					
					Si (cotizacionesOptimas = 0) Entonces
						mejorAjuste = cotizaciones[1]
						mejorAjusteIndex = 1
						
						Para i = 1 Hasta 5
							Si (i <> minIndex y i <> maxIndex) Entonces
								Si (Abs(cotizaciones[i] - presupuesto) < Abs(mejorAjuste - presupuesto)) Entonces
									mejorAjuste = cotizaciones[i]
									mejorAjusteIndex = i
								Fin Si
							Fin Si
						Fin Para
						
						Escribir "Empresa ", numeroEmpresas[mejorAjusteIndex], ": ", mejorAjuste
						
					Sino
						Escribir "Cotizaciones iguales al presupuesto más óptimo:"
						Para i = 1 Hasta 5
							Si (i <> minIndex y i <> maxIndex y cotizaciones[i] <> promedio) Entonces
								Si (Abs(cotizaciones[i] - presupuesto) = Abs(minCotizacion - presupuesto)) Entonces
									Escribir "Empresa ", numeroEmpresas[i], ": ", cotizaciones[i]
								Fin Si
							Fin Si
						Fin Para
					Fin Si

Fin Algoritmo
