from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app, resources={
    r"/api/*": {
        "origins": ["http://localhost:8080"],
        "methods": ["GET", "OPTIONS"],
        "allow_headers": ["Authorization", "Content-Type"]
    }
})

arquivo_csv = 'Relatorio_cadop.csv'  
df = pd.read_csv(arquivo_csv, sep=';', encoding='utf-8')

@app.route('/api/buscar', methods=['GET'])
def buscar_operadoras():
    termo = request.args.get('termo', '').strip()
    
    if not termo:
        return jsonify({"erro": "Termo de busca não fornecido."}), 400

    resultados = df[df['Registro_ANS'].astype(str).str.contains(termo, case=False, na=False)]

    operadoras = resultados[['Razao_Social', 'CNPJ', 'Modalidade', 'Registro_ANS']].to_dict(orient='records')

    return jsonify(operadoras)

if __name__ == '__main__':
    app.run(debug=True)

print('Servidor Flask rodando em http://127.0.0.1:5000')
app.run(debug=True, host='127.0.0.1', port=5000)