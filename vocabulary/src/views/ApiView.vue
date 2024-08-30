<template>
  <div>
    <h1>API Data</h1>
    <div v-if="loading">Loading...</div>
    <div v-if="error">Error: {{ error }}</div>
    <div v-if="data">
      <pre>{{ data }}</pre>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: null,
      loading: false,
      error: null,
    };
  },
  methods: {
    fetchData() {
      this.loading = true;
      fetch(import.meta.env.VITE_API_URL, {
        method: 'GET',
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
          }
          return response.json();
        })
        .then(data => {
          this.data = data;
          this.loading = false;
        })
        .catch(error => {
          this.error = error.toString();
          this.loading = false;
        });
    },
  },
  created() {
    this.fetchData();
  },
};
</script>
