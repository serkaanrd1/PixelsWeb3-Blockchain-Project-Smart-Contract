<template>
  <div class="icerik">
    <Navbar />

    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div>
            <button>Page 1</button>
          </div>
          <br />
          <Home />
        </div>
        <div class="col-md-4">
          <div>
            <button>Page 2</button>
          </div>
          <br />
          <Home />
        </div>
        <div class="col-md-4">
          <Contract />
          <br />
          <Metamask />
        </div>
      </div>
    </div>

    <Footer />
  </div>
</template>

<script>
import Contract from "../components/Contract.vue";
import Metamask from "../components/etamask.vue";
import SignupForm from "../components/SignupForm.vue";
import LoginForm from "../components/LoginForm.vue";
import Navbar from "../components/Navbar.vue";
import Home from "../components/Home.vue";
import Footer from "../components/Footer.vue";
import { ref } from "vue";
import { useRouter } from "vue-router";
export default {
  components: {
    SignupForm,
    LoginForm,
    Navbar,
    Home,
    Footer,
    Contract,
    Metamask,
  },

  setup() {
    const showLogin = ref(true);
    const router = useRouter();

    const enterHome = () => {
      router.push({ name: "homeview" });
    };
    return { showLogin, enterHome };
  },
  methods: {
    callContractFunction() {
      this.$refs.contract.callContractFunction();
    },
  },
};
</script>

<style>
.icerik {
  overflow-x: hidden; /* Yatay kaydırmayı engeller */
  overflow-y: auto; /* Dikey kaydırmayı gerektiği zaman aktive eder */
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  padding: 20px;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.row {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.col-md-4 {
  flex-basis: 33.33%;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin: 10px;
  position: relative;
}

.col-md-4:hover {
  background-color: #f0f0f0;
  cursor: pointer;
  z-index: 1;
}
</style>
