<template>
  <div class="signup-container">
    <form @submit.prevent="handleSubmit" class="signup-form">
      <input
        type="text"
        required
        placeholder="Username"
        v-model="displayName"
        class="signup-input"
      />
      <input
        type="email"
        required
        placeholder="E-Mail"
        v-model="email"
        class="signup-input"
      />
      <input
        type="password"
        required
        placeholder="Password"
        v-model="password"
        class="signup-input"
      />
      <div v-if="error" class="error">{{ error }}</div>
      <button class="signup-button">Signup</button>
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import useSignup from "../composables/useSignup";

export default {
  setup(props, context) {
    const { error, signup } = useSignup();
    const displayName = ref("");
    const email = ref("");
    const password = ref("");
    const handleSubmit = async () => {
      await signup(email.value, password.value, displayName.value);
      if (!error.value) {
        context.emit("signup");
      }
    };
    return { displayName, email, password, handleSubmit, error };
  },
};
</script>

<style>
.signup-form {
  width: 100%;
  max-width: 400px;
  text-align: center;
}

.signup-input {
  width: 100%;
  padding: 0.8rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.signup-button {
  width: 100%;
  padding: 0.8rem;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 20px;
  cursor: pointer;
}
.signup-button:hover {
  background-color: #42b983;
}

.error {
  color: #42b983;
  margin-bottom: 1rem;
}
</style>
