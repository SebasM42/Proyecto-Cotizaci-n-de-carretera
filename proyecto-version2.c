#include <stdio.h>
#include <conio.h>
#include <time.h>

//Por Juan Diego Ospina

int main() {
    float cotizaciones [5];
    float sumaCotizaciones = 0.0;
    float cotizacionMinima, cotizacionMaxima;
    float promedio;
    float presupuestoTotal;
    int i;
    do {
        printf("Ingrese el presupuesto total : $");
        scanf("%f", &presupuestoTotal);

        if (presupuestoTotal < 50000) {
            printf("Error: El presupuesto total debe ser mayor o igual a 50000. Intente nuevamente.\n");
        }
    } while (presupuestoTotal < 50000);

    printf("\nIngrese el monto de las 5 cotizaciones:\n");
    for (i = 0; i < 5; i++) {
        do {
            printf("Empresa %d: $", i + 1);
            scanf("%f", &cotizaciones[i]);

            if (cotizaciones[i] <= 0) {
                printf("Error: El monto debe ser mayor a cero. Intente nuevamente.\n");
            } else if (cotizaciones[i] <= 1000) {
                printf("Error: El monto debe ser mayor a 1000. Intente nuevamente.\n");
            }
        } while (cotizaciones[i] <= 0 || cotizaciones[i] <= 1000);

        sumaCotizaciones += cotizaciones[i];
    }
    cotizacionMinima = cotizaciones[0];
    cotizacionMaxima = cotizaciones[0];
    for (i = 1; i < 5; i++) {
        if (cotizaciones[i] < cotizacionMinima) {
            cotizacionMinima = cotizaciones[i];

        } else if (cotizaciones[i] > cotizacionMaxima) {
            cotizacionMaxima = cotizaciones[i];
        }
    }
    promedio = (sumaCotizaciones - cotizacionMinima - cotizacionMaxima) / 3;
    printf("\nCotizaciones eliminadas:\n");
    printf("Mas barata: $%.2f\n", cotizacionMinima);
    printf("Mas cara: $%.2f\n", cotizacionMaxima);
    printf("\nPresupuesto total ingresado: $%.2f\n", presupuestoTotal);
    printf("Promedio de las cotizaciones restantes: $%.2f\n", promedio);

    getch();
    return 0;
}