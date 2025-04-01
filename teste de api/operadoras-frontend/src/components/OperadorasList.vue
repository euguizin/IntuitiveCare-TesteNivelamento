<template>
  <div class="operadoras-list">
    <h2>Resultados da Busca</h2>
    
    <table>
      <thead>
        <tr>
          <th>Razão Social</th>
          <th>CNPJ</th>
          <th>Modalidade</th>
          <th>Registro ANS</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="operadora in operadoras" :key="operadora.Registro_ANS">
          <td>{{ operadora.Razao_Social }}</td>
          <td>{{ operadora.CNPJ }}</td>
          <td>{{ operadora.Modalidade }}</td>
          <td>{{ operadora.Registro_ANS }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'OperadorasList',
  props: {
    operadoras: {
      type: Array,
      required: true
    }
  }
}
</script>

<style scoped>
.operadoras-list {
  margin-top: 30px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

th, td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}

th {
  background-color: #42b983;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #e9e9e9;
}
</style>