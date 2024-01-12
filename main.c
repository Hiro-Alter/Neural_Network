#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define INPUT_SIZE 2
#define LEARNING_RATE 0.1
#define EPOCHS 15

// Estructura del perceptrón
typedef struct {
    double weights[INPUT_SIZE];
    double bias;
} Perceptron;

// Función de activación (step function)
int activate(double sum) {
    return (sum >= 0) ? 1 : 0;
}

// Función para entrenar el perceptrón
void train(Perceptron *perceptron, double inputs[][INPUT_SIZE], int *targets, int num_samples) {
    for (int epoch = 0; epoch < EPOCHS; ++epoch) {
        for (int i = 0; i < num_samples; ++i) {
            double sum = perceptron->bias;
            for (int j = 0; j < INPUT_SIZE; ++j) {
                sum += inputs[i][j] * perceptron->weights[j];
            }

            int output = activate(sum);

            // Actualizar pesos y sesgo
            for (int j = 0; j < INPUT_SIZE; ++j) {
                perceptron->weights[j] += LEARNING_RATE * (targets[i] - output) * inputs[i][j];
                //printf("aprendizaje = %lf\n",  perceptron->weights[j]);
            }
            perceptron->bias += LEARNING_RATE * (targets[i] - output);
            //printf("aprendizaje 2 = %lf\n",  perceptron->bias);
        }
    }
}

// Función para evaluar el perceptrón
int predict(Perceptron *perceptron, double inputs[]) {
    double sum = perceptron->bias;
    for (int j = 0; j < INPUT_SIZE; ++j) {
        sum += inputs[j] * perceptron->weights[j];
    }
    return activate(sum);
}

int main() {
    srand(time(NULL));
    // Datos de entrada
    double inputs[][INPUT_SIZE] =
      {{170, 56},
      {172, 63},
      {160, 50},
      {170, 63},
      {174, 66},
      {158, 55},
      {183, 80},
      {182, 70},
      {165, 54}};
    int targets[] ={1, 0, 1, 0, 0, 1, 0, 0, 1};
    double inputs2[][INPUT_SIZE] = {{171,63}};

    // Inicializar perceptrón
    Perceptron perceptron;
    for (int i = 0; i < INPUT_SIZE; ++i) {
        perceptron.weights[i] = ((double)rand() / RAND_MAX) * 2 - 1; // Inicializar pesos aleatorios
    }

    printf("wo = %lf , w1 = %lf\n", perceptron.weights[0], perceptron.weights[1]);

    perceptron.bias = ((double)rand() / RAND_MAX) * 2 - 1; // Inicializar sesgo aleatorio

    // Entrenar perceptrón
    train(&perceptron, inputs, targets, 9);

    while(1){
      // Evaluar perceptrón
      printf("Altura: ");
      scanf("%lf", &inputs2[0][0]);
      printf("Peso: ");
      scanf("%lf", &inputs2[0][1]);
      int prediction = predict(&perceptron, inputs2[0]);
      switch (prediction)
      {
      case 0:
        printf("~ Hombre ~\n", (int)inputs2[0][0], (int)inputs2[0][1],prediction);
        break;
        case 1:
        printf("~ Mujer ~\n", (int)inputs2[0][0], (int)inputs2[0][1],prediction);
      default:
        break;
      }
      printf("wo = %lf , w1 = %lf\n", perceptron.weights[0], perceptron.weights[1]);
      printf("bias = %lf\n", perceptron.bias);
    }
    //int prediction = predict(&perceptron, inputs2[0]);
    //printf("%d\n",prediction);
    return 0;
}