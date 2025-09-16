
# Importa o módulo math da biblioteca padrão do Python
# Ele contém funções e constantes matemáticas, como math.pi (valor de π).
import math

# Calcula a área de um retângulo (l * a)
def area_retangulo(l, a):
    return l * a

# Calcula o perímetro de um retângulo (2 * (l + a))
def perimetro_retangulo(l, a):
    return 2 * (l + a)

# Calcula a área de um círculo (π * r²)
def area_circulo(r):
    return math.pi * (r ** 2)

# Calcula a circunferência de um círculo (2 * π * r)
def circunferencia(r):
    return 2 * math.pi * r

# Calcula o volume de um cubo (lado³)
def volume_cubo(l):
    return l ** 3
