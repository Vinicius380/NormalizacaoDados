import pandas as pd

#Carregar arquivo excel com a base de dados
data = pd.read_excel("dados_apartamentos.xlsx")

#Visualizar os tipos de dados de cada coluna
#data.info()

# Elimine as linhas onde pelo menos um elemento estiver faltando.
data = data.dropna()
#data.info()

#Percorre todas as colunas com o tipo "objeto" e define como valor numerico (int ou float).
#Caso tenham valores nao numericos na coluna, retorna a coluna e uma mensagem

for column in data.columns:
    if data[column].dtype == "object":
        try:
            data[column] = pd.to_numeric(data[column], errors='raise')
        except ValueError:
            print(f"Coluna '{column}' não pode ser convertida para numérica.")
            
#Percorre as colunas e substitui os valores não numericos para NaN e o tipo da coluna para float - se você calcular a média de uma coluna com valores NaN, eles serão ignorados no cálculo
#Nesse caso as colunas precisam conter apenas numeros Float, não numéricos sãos descartávies
colunasFloat = ["valor_total", "unit", "area_util", "condominio"]
data[colunasFloat] = data[colunasFloat].apply(pd.to_numeric, errors="coerce").astype("float") # errors="coerce", os valores não numéricos nas colunas especificadas serão substituídos por NaN

#Percorre as colunas e substitui os valores não numericos para NaN e o tipo da coluna para int
colunasInt = ["id", "banheiros", "academia"]
data[colunasInt] = data[colunasInt].apply(pd.to_numeric, errors="coerce").astype("Int64")

data.info()

#Cria o arquivo limpo
#data.to_excel("dados_apartamentos_limpos.xlsx", index=False)