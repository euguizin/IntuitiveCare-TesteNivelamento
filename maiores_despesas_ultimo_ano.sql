USE teste_intuitive_care

SELECT 
    o.Razao_Social,
    d.REG_ANS,
    (d.VL_SALDO_INICIAL - d.VL_SALDO_FINAL) AS Total_Despesa
FROM tb_demonstracoes_contabeis AS d
JOIN tb_operadoras_plano_de_saude AS o ON d.REG_ANS = o.Registro_ANS
WHERE 
    d.Descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR %'
    AND d.Data_Evento BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY Total_Despesa DESC
LIMIT 10; 