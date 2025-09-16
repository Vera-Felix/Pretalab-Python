
# Módulo de utilidades para a aula (exemplo).
# Contém funções matemáticas simples (área e perímetro) e uma função de saudação.

# Calcula a área de um círculo (π * r²)
def area_circulo(r):
    return 3.1415 * (r ** 2)

# Calcula a área de um retângulo (largura * altura)
def area_retangulo(l, a):
    return l * a

# Calcula o perímetro de um retângulo (2 * (largura + altura))
def perimetro_retangulo(l, a):
    return 2 * (l + a)

# Calcula a circunferência de um círculo (2 * π * r)
def circunferencia(r):
    return 2 * 3.1415 * r

# Retorna uma mensagem de boas-vindas personalizada
def saudacao(nome):
    return f"Olá, {nome}! Bem-vinda à aula de módulos e pacotes."
