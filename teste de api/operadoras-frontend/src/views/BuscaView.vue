<template>
    <div class="busca">
      <h1>Buscar Operadoras</h1>
      
      <div class="search-box">
        <input 
          type="text" 
          v-model="termoBusca" 
          placeholder="Digite o termo de busca..."
          @keyup.enter="buscarOperadoras"
        >
        <button @click="buscarOperadoras">Buscar</button>
      </div>
      
      <div v-if="carregando" class="loading">Carregando...</div>
      
      <div v-if="erro" class="error">{{ erro }}</div>
      
      <OperadorasList 
        v-if="operadoras.length > 0" 
        :operadoras="operadoras" 
      />
      
      <div v-if="nenhumResultado" class="no-results">
        Nenhuma operadora encontrada com o termo "{{ termoBusca }}"
      </div>
    </div>
  </template>
  
  <script>
  import OperadorasList from '@/components/OperadorasList.vue'
  import axios from 'axios'
  
  export default {
    name: 'BuscaView',
    components: {
      OperadorasList
    },
    data() {
      return {
        termoBusca: '',
        operadoras: [],
        carregando: false,
        erro: '',
        nenhumResultado: false
      }
    },
    methods: {
      async buscarOperadoras() {
        if (!this.termoBusca.trim()) {
          this.erro = 'Por favor, digite um termo para buscar.'
          return
        }
        
        this.carregando = true
        this.erro = ''
        this.nenhumResultado = false
        
        try {
          const response = await axios.get('http://localhost:5000/api/buscar', {
            params: {
              termo: this.termoBusca
            }
          })
          
          this.operadoras = response.data
          this.nenhumResultado = this.operadoras.length === 0
        } catch (error) {
          console.error('Erro ao buscar operadoras:', error)
          this.erro = 'Ocorreu um erro ao buscar operadoras. Por favor, tente novamente.'
          if (error.response) {
            this.erro = error.response.data.erro || this.erro
          }
        } finally {
          this.carregando = false
        }
      }
    }
  }
  </script>
  
  <style scoped>
  .search-box {
    margin: 20px 0;
  }
  
  .search-box input {
    padding: 10px;
    width: 300px;
    margin-right: 10px;
  }
  
  .search-box button {
    padding: 10px 20px;
    background-color: #42b983;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  .search-box button:hover {
    background-color: #3aa876;
  }
  
  .loading, .error, .no-results {
    margin: 20px 0;
    padding: 10px;
    border-radius: 4px;
  }
  
  .loading {
    background-color: #f8f9fa;
    color: #6c757d;
  }
  
  .error {
    background-color: #f8d7da;
    color: #721c24;
  }
  
  .no-results {
    background-color: #e2e3e5;
    color: #383d41;
  }
  </style>