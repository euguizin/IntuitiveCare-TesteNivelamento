import tabula
import pandas as pd

listaTabelas = tabula.read_pdf(r"webscraping\pdfs\Anexo I..pdf", pages="3-181", multiple_tables=True, lattice=True)

tb_processadas = []  
   
for tabela in listaTabelas:
    tb_processadas.append(tabela)
    
tb_final = pd.concat(tb_processadas)
tb_final = tb_final.rename(columns={"OD": "Seg. Odontológica", "AMB": "Seg. Ambulatorial"})
tb_final = tb_final.iloc[:, :13]

tb_final.to_csv("Teste_GuilhermeTeixeiraAndrade.csv", encoding="utf-8", sep=";", index=False)

print("Processamento concluído!")
