<template>
  <div class="login">
    <button class="service-button grow" @click="login">Login with Cognito</button>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .login {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
.service-button {
    display: inline-block;
    width: 100%;
    padding: 15px 20px;
    font-size: 1rem;
    color: white;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
}
.service-button.grow {
    background-color: #337ab7;
}
/* Hover Effect: Grow */
.service-button.grow:hover {
    transform: scale(1.1);
}
</style>

<script>
export default {
  methods: {
    login() {
      const domain = import.meta.env.VITE_AWS_COGNITO_DOMAIN;
      const clientId = import.meta.env.VITE_AWS_COGNITO_CLIENTID;
      const redirectUri = import.meta.env.VITE_AWS_COGNITO_REDIRECTURI;
      const responseType = import.meta.env.VITE_AWS_COGNITO_RESPONSETYPE;

      const cognitoUrl = `https://${domain}/login?response_type=${responseType}&client_id=${clientId}&redirect_uri=${redirectUri}`;

      window.location.href = cognitoUrl;
    }
  }
}
</script>