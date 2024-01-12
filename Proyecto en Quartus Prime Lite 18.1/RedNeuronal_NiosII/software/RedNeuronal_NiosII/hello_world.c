#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define INPUT_SIZE 2
#define LEARNING_RATE 0.1
#define EPOCHS 15

// Estructura del perceptrón
typedef struct {
    float weights[INPUT_SIZE];
    float bias;
} Perceptron;

// Función de activación (step function)
int activate(float sum) {
    return (sum >= 0) ? 1 : 0;
}

// Función para entrenar el perceptrón
void train(Perceptron *perceptron, float inputs[][INPUT_SIZE], int *targets, int num_samples) {
    for (int epoch = 0; epoch < EPOCHS; ++epoch) {
        for (int i = 0; i < num_samples; ++i) {
        	float sum = perceptron->bias;
            for (int j = 0; j < INPUT_SIZE; ++j) {
                sum += inputs[i][j] * perceptron->weights[j];
            }

            int output = activate(sum);

            // Actualizar pesos y sesgo
            for (int j = 0; j < INPUT_SIZE; ++j) {
                perceptron->weights[j] += LEARNING_RATE * (targets[i] - output) * inputs[i][j];
            }
            perceptron->bias += LEARNING_RATE * (targets[i] - output);
        }
    }
}

// Función para evaluar el perceptrón
int predict(Perceptron *perceptron, float inputs[]) {
	float sum = perceptron->bias;
    for (int j = 0; j < INPUT_SIZE; ++j) {
        sum += inputs[j] * perceptron->weights[j];
    }
    return activate(sum);
}

int main() {
	srand(time(NULL));
    // Datos de entrada
	float inputs[][INPUT_SIZE] =
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
    float inputs2[][INPUT_SIZE] = {{160,60}};

    // Inicializar perceptrón
    Perceptron perceptron;
    for (int i = 0; i < INPUT_SIZE; ++i) {
        perceptron.weights[i] = ((float)rand() / RAND_MAX) * 2 - 1; // Inicializar pesos aleatorios
    }
    perceptron.bias = ((float)rand() / RAND_MAX) * 2 - 1; // Inicializar sesgo aleatorio

    // Entrenar perceptrón
    train(&perceptron, inputs, targets, 9);
    int prediction = predict(&perceptron, inputs2[0]);
    printf("%d\n", prediction);
    return 0;
}
