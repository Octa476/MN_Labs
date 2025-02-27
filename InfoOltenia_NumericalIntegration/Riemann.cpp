/**
* Solutie folosind metode numerice(Integrala Riemann)
* Autor: Tudosie Razvan
* Complexitate: O(numar intervale alese pentru calcul)
**/
#include <stdio.h>
//for function 
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <cmath>


//for random numbers
#include <time.h>
#include <random>
using namespace std;

double applyOperator(double a, double b, char op) {
    switch (op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/':
            if (b == 0) {
                fprintf(stderr, "Division by zero error.\n");
                exit(EXIT_FAILURE);
            }
            return a / b;
        case '^': return pow(a, b);
        default:
            fprintf(stderr, "Unsupported operator: %c\n", op);
            exit(EXIT_FAILURE);
    }
}

double applyFunction(const char *func, double value) {
    if (strcmp(func, "sin") == 0) return sin(value);
    if (strcmp(func, "cos") == 0) return cos(value);
    if (strcmp(func, "exp") == 0) return exp(value);
    if (strcmp(func, "ln") == 0) return log(value);
    fprintf(stderr, "Unsupported function: %s\n", func);
    exit(EXIT_FAILURE);
}

int precedence(char op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    if (op == '^') return 3; // Exponent has the highest precedence
    return 0;
}

void infixToPostfix(const char *infix, char *postfix) {
    char opStack[100][10];
    int opTop = -1, postfixIndex = 0;
    int i = 0;

    while (infix[i]) {
        if (isspace(infix[i])) {
            i++;
            continue;
        } else if (isdigit(infix[i]) || infix[i] == '.') {
            while (isdigit(infix[i]) || infix[i] == '.') {
                postfix[postfixIndex++] = infix[i++];
            }
            postfix[postfixIndex++] = ' ';
        } else if (isalpha(infix[i])) {
            char identifier[50];
            int idIndex = 0;
            while (isalpha(infix[i])) {
                identifier[idIndex++] = infix[i++];
            }
            identifier[idIndex] = '\0';

            if (strcmp(identifier, "x") == 0) {
                postfix[postfixIndex++] = 'x';
                postfix[postfixIndex++] = ' ';
            } else {
                strcpy(opStack[++opTop], identifier);
            }
        } else if (infix[i] == '(') {
            strcpy(opStack[++opTop], "(");
            i++;
        } else if (infix[i] == ')') {
            while (opTop >= 0 && strcmp(opStack[opTop], "(") != 0) {
                postfix[postfixIndex++] = ' ';
                strcpy(&postfix[postfixIndex], opStack[opTop--]);
                postfixIndex += strlen(&postfix[postfixIndex]);
                postfix[postfixIndex++] = ' ';
            }
            if (opTop < 0) {
                fprintf(stderr, "Mismatched parentheses.\n");
                exit(EXIT_FAILURE);
            }
            opTop--;
            if (opTop >= 0 && isalpha(opStack[opTop][0])) {
                postfix[postfixIndex++] = ' ';
                strcpy(&postfix[postfixIndex], opStack[opTop--]);
                postfixIndex += strlen(&postfix[postfixIndex]);
                postfix[postfixIndex++] = ' ';
            }
            i++;
        } else if (strchr("+-*/^", infix[i])) {
            char op[2] = {infix[i], '\0'};
            while (opTop >= 0 && precedence(opStack[opTop][0]) >= precedence(infix[i])) {
                postfix[postfixIndex++] = ' ';
                strcpy(&postfix[postfixIndex], opStack[opTop--]);
                postfixIndex += strlen(&postfix[postfixIndex]);
                postfix[postfixIndex++] = ' ';
            }
            strcpy(opStack[++opTop], op);
            i++;
        } else {
            fprintf(stderr, "Invalid character in expression: %c\n", infix[i]);
            exit(EXIT_FAILURE);
        }
    }

    while (opTop >= 0) {
        if (strcmp(opStack[opTop], "(") == 0) {
            fprintf(stderr, "Mismatched parentheses.\n");
            exit(EXIT_FAILURE);
        }
        postfix[postfixIndex++] = ' ';
        strcpy(&postfix[postfixIndex], opStack[opTop--]);
        postfixIndex += strlen(&postfix[postfixIndex]);
        postfix[postfixIndex++] = ' ';
    }
    postfix[postfixIndex] = '\0';
}

double evaluatePostfix(const char *postfix, double xValue) {
    double valueStack[100];
    int valueTop = -1;
    int i = 0;

    while (postfix[i]) {
        if (isspace(postfix[i])) {
            i++;
            continue;
        } else if (isdigit(postfix[i]) || postfix[i] == '.') {
            char number[50];
            int numIndex = 0;
            while (isdigit(postfix[i]) || postfix[i] == '.') {
                number[numIndex++] = postfix[i++];
            }
            number[numIndex] = '\0';
            valueStack[++valueTop] = atof(number);
        } else if (postfix[i] == 'x') {
            valueStack[++valueTop] = xValue;
            i++;
        } else if (isalpha(postfix[i])) {
            char func[50];
            int funcIndex = 0;
            while (isalpha(postfix[i])) {
                func[funcIndex++] = postfix[i++];
            }
            func[funcIndex] = '\0';

            if (valueTop < 0) {
                fprintf(stderr, "Invalid postfix expression.\n");
                exit(EXIT_FAILURE);
            }
            double operand = valueStack[valueTop--];
            double result = applyFunction(func, operand);
            valueStack[++valueTop] = result;
        } else if (strchr("+-*/^", postfix[i])) {
            if (valueTop < 1) {
                fprintf(stderr, "Invalid postfix expression.\n");
                exit(EXIT_FAILURE);
            }
            double b = valueStack[valueTop--];
            double a = valueStack[valueTop--];
            double result = applyOperator(a, b, postfix[i]);
            valueStack[++valueTop] = result;
            i++;
        } else {
            fprintf(stderr, "Invalid character in postfix expression: %c\n", postfix[i]);
            exit(EXIT_FAILURE);
        }
    }

    if (valueTop != 0) {
        fprintf(stderr, "Invalid postfix expression.\n");
        exit(EXIT_FAILURE);
    }
    return valueStack[valueTop];
}

double evaluateLatexFunction(const char *latex, double xValue) {
    char postfix[1000] = {0};
    infixToPostfix(latex, postfix);
    return evaluatePostfix(postfix, xValue);
}
double getRandomNumber(double min, double max) {
    //srand(time(NULL)) inainte de a apela functia asta pentru a avea numere noi la fiecare rulare;
    return min + (max - min) * ((double)rand() / RAND_MAX);
}



int xStart, yStart, xFinal, yFinal;
int nrFasii;

char functie[300];
FILE *fin,*fout;


void calculateIntegralRiemann(long long int numIntervals) {
    int xStartRiemann = min(xStart,xFinal);
    int xFinalRiemann = max(xStart,xFinal);
    int yStartRiemann = min(yStart,yFinal);
    int yFinalRiemann = max(yStart,yFinal);

    double dx = 1.0 * (xFinalRiemann - xStartRiemann) / numIntervals; // Latimea fiecarui dreptunghi
    double totalAreaMare = 0.0;                  // Aria sub grafic (mare)
    double totalRectangleArea = 1.0 * (xFinalRiemann - xStartRiemann) * (yFinalRiemann - yStartRiemann); // Aria dreptunghiului complet
    if(totalRectangleArea < 0){
        totalRectangleArea *= -1;
    }
    int amRaportMareUscat = 0; 

    for (int i = 0; i < numIntervals - 1; i++) {
        double xLeft = xStartRiemann + i * dx;   // Marginea stanga a intervalului curent
        double xRight = xLeft + dx;      // Marginea dreapta a intervalului curent
        double yValueLeft = evaluateLatexFunction(functie, xLeft);
        double yValueRight = evaluateLatexFunction(functie, xRight);

        if ((yValueLeft >= yStartRiemann && yValueLeft<yFinalRiemann) || (yValueRight >= yStartRiemann && yValueRight <yFinalRiemann)) {
            amRaportMareUscat = 1; 
        }

        
        double clippedYLeft = fmin(fmax(yValueLeft, yStartRiemann), yFinalRiemann);
        double clippedYRight = fmin(fmax(yValueRight, yStartRiemann), yFinalRiemann);

        double calc = (clippedYLeft-yStartRiemann + clippedYRight-yStartRiemann);
        if (yValueLeft < yStartRiemann || yValueRight < yStartRiemann){
            calc = 0;
        }
        if (calc < 0){
            calc = -calc;
        }

        // Aria trapezului din acest interval
        double stripAreaMare = dx * calc / 2.0;
        totalAreaMare += stripAreaMare;
        
    }
    // Aria uscatului este restul din aria dreptunghiului
    double totalAreaUscat = totalRectangleArea - totalAreaMare;
    if (amRaportMareUscat == 0) {
        fprintf(fout, "0.0\n");
        return;
    }
    double raport = totalAreaUscat/totalAreaMare;

    fprintf(fout, "%lf\n", totalAreaUscat/totalAreaMare);
    
}

int main() {

    fin=fopen("faleza.in","r");
    fout=fopen("faleza.out","w");

    fgets(functie, 300,fin);
    fscanf(fin,"%d %d %d %d\n",&xStart,&yStart,&xFinal,&yFinal);
    
    calculateIntegralRiemann(10000);
    return 0;
}