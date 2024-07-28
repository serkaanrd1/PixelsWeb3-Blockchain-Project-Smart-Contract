<template>
  <div class="login-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <input
        type="email"
        required
        placeholder="E-Mail"
        v-model="email"
        class="login-input"
      />
      <input
        type="password"
        required
        placeholder="Password"
        v-model="password"
        class="login-input"
      />
      <div v-if="error" class="error">{{ error }}</div>
      <button class="login-button">Login</button>
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import useLogin from "../composables/useLogin";

export default {
  setup(props, context) {
    const email = ref("");
    const password = ref("");
    const { error, login } = useLogin();
    const handleSubmit = async () => {
      await login(email.value, password.value);
      if (!error.value) {
        context.emit("login");
      }
    };
    return { email, password, handleSubmit, error };
  },
};
</script>

<style>
.login-form {
  width: 100%;
  max-width: 400px;
  text-align: center;
}

.login-input {
  width: 100%;
  padding: 0.8rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.login-button {
  width: 100%;
  padding: 0.8rem;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 20px;
  cursor: pointer;
}

.login-button:hover {
  background-color: #42b983;
}

.error {
  color: #42b983;
  margin-bottom: 1rem;
}
</style>
