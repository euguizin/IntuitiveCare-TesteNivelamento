import requests
from bs4 import BeautifulSoup
import os

linkSite = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

requisicao = requests.get(linkSite)
soup = BeautifulSoup(requisicao.text, "html.parser")

os.makedirs("pdfs", exist_ok=True)

arquivos_desejados = ["Anexo I", "Anexo II"]

for link in soup.find_all("a", href=True):
    pdf_link = link["href"]
    link_text = link.get_text(strip=True)

    if any(nome in link_text for nome in arquivos_desejados) and pdf_link.lower().endswith(".pdf"):
        if not pdf_link.startswith("http"):
            pdf_link = linkSite + "/" + pdf_link.lstrip("/") 
        
        pdf_response = requests.get(pdf_link)

        filename = os.path.join("pdfs", f"{link_text}.pdf")

        with open(filename, "wb") as file:
            file.write(pdf_response.content)
        
        print(f"Baixado: {filename}")

