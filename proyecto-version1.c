#include <stdio.h>
#include <stdlib.h>  

//Por Sebastián Mosquera

int main() {
    float presupuesto;
    float cotizaciones[5];
    int numeroEmpresas[5];  
    float suma = 0;

    // Validar el presupuesto
    do {
        printf("Ingrese el presupuesto disponible (entre 500000 y 1500000): ");
        scanf("%f", &presupuesto);

        if (presupuesto < 500000 || presupuesto > 1500000) {
            printf("El presupuesto esta fuera de rango\n");
        }
    } while (presupuesto < 500000 || presupuesto > 1500000);

    // Pedir las cotizaciones y asignar números de empresa
    printf("\nIngrese las cotizaciones de las 5 empresas (cada una entre 500000 y 1500000):\n");
    for (int i = 0; i < 5; ++i) {
        do {
            printf("Empresa %d: ", i + 1);
            scanf("%f", &cotizaciones[i]);

            if (cotizaciones[i] < 500000 || cotizaciones[i] > 1500000) {
                printf("Cotización de la Empresa %d Esta fuera de rango\n", i + 1);
            }
        } while (cotizaciones[i] < 500000 || cotizaciones[i] > 1500000);

        suma += cotizaciones[i];

        // Asignar número de empresa
        numeroEmpresas[i] = i + 1;
    }

    // Encontrar la cotización más baja y más alta
    float minCotizacion = cotizaciones[0];
    float maxCotizacion = cotizaciones[0];
    int minIndex = 0, maxIndex = 0;

    for (int i = 1; i < 5; ++i) {
        if (cotizaciones[i] < minCotizacion) {
            minCotizacion = cotizaciones[i];
            minIndex = i;
        }
        if (cotizaciones[i] > maxCotizacion) {
            maxCotizacion = cotizaciones[i];
            maxIndex = i;
        }
    }

    // Mostrar cotizaciones eliminadas 
    printf("\nCotización más baja eliminada:\nEmpresa %d: %.2f\n", numeroEmpresas[minIndex], minCotizacion);
    printf("Cotización más alta eliminada:\nEmpresa %d: %.2f\n", numeroEmpresas[maxIndex], maxCotizacion);

    // Mostrar el promedio de las cotizaciones restantes
    float promedio = suma / 5;
    printf("\nPromedio de todas las cotizaciones: %.2f\n", promedio);

    // Mostrar empresa con las cotizaciones restantes
    printf("\nCotizaciones restantes más óptimas:\n");

    // Buscar cotizaciones óptimas iguales
    int cotizacionesOptimas = 0;
    for (int i = 0; i < 5; ++i) {
        if (i != minIndex && i != maxIndex && cotizaciones[i] != promedio) {
            if (abs(cotizaciones[i] - presupuesto) == abs(minCotizacion - presupuesto)) {
                printf("Empresa %d: %.2f\n", numeroEmpresas[i], cotizaciones[i]);
                cotizacionesOptimas++;
            }
        }
    }

    // Si no hay cotizaciones óptimas iguales, imprimir la mejor
    if (cotizacionesOptimas == 0) {
        float mejorAjuste = cotizaciones[0];
        int mejorAjusteIndex = 0;

        for (int i = 0; i < 5; ++i) {
            if (i != minIndex && i != maxIndex) {
                if (abs(cotizaciones[i] - presupuesto) < abs(mejorAjuste - presupuesto)) {
                    mejorAjuste = cotizaciones[i];
                    mejorAjusteIndex = i;
                }
            }
        }

        printf("Empresa %d: %.2f\n", numeroEmpresas[mejorAjusteIndex], mejorAjuste);
    } else {
        // Imprimir cotizaciones óptimas iguales
        printf("\nCotizaciones iguales al presupuesto más óptimo:\n");
        for (int i = 0; i < 5; ++i) {
            if (i != minIndex && i != maxIndex && cotizaciones[i] != promedio) {
                if (abs(cotizaciones[i] - presupuesto) == abs(minCotizacion - presupuesto)) {
                    printf("Empresa %d: %.2f\n", numeroEmpresas[i], cotizaciones[i]);
                    printf("Empresa %d: %.2f\n", numeroEmpresas[i], cotizaciones[i]);
                }
            }
        }
    }

    return 0;
}