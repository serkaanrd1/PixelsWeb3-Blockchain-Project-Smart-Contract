<template>
  <nav v-if="user" class="navbar">
    <div class="navbar-left">
      <img src="../assets/logo.png" alt="Logo" class="logo" />
    </div>
    <div class="navbar-center">
      <ul class="nav-links">
        <li><a href="#">Home </a></li>
        <li><a href="#">Pixels</a></li>
        <li><a href="#">Account</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <button class="pointer logout-button" @click="handleClick">Logout</button>
  </nav>
</template>

<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
import useLogout from "../composables/useLogout";
import getUser from "../composables/getUser";

export default {
  setup() {
    const { logout, error } = useLogout();
    const { user } = getUser();
    const router = useRouter();

    const handleClick = async () => {
      await logout();
      router.push({ name: "welcome" });
    };

    return { handleClick, user };
  },
};
</script>

<style>
.navbar {
  padding: 10px 20px;
  border-bottom: 1px solid #42b983;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #42b983;
  color: #ffffff;
  position: relative;
}

.navbar-left {
  display: flex;
  align-items: center;
}
.navbar-left img {
  width: 50px;
}

.navbar-center {
  flex-grow: 1;
  display: flex;
  justify-content: center;
}

.nav-links {
  display: flex;
  justify-content: center;
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-links li {
  margin: 0 10px;
}

.nav-links a {
  text-decoration: none;
  color: #ffffff;
  font-size: 14px;
}

.nav-links a:hover {
  color: #3d3a3a;
}

.pointer {
  cursor: pointer;
}

.logout-button {
  background-color: #ffffff;
  color: #42b983;
  border: 1px solid #42b983;
  padding: 5px 15px;
  border-radius: 20px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.logout-button:hover {
  background-color: #3d3a3a;
  color: #ffffff;
}

.merhaba {
  font-size: smaller;
}

.email {
  font-size: smaller;
  color: #dddddd;
}

@media (max-width: 768px) {
  .navbar {
    flex-wrap: wrap;
    padding: 10px;
  }

  .navbar-left {
    width: 100%;
    justify-content: center;
    margin-bottom: 10px;
  }

  .navbar-center {
    width: 100%;
    justify-content: center;
  }

  .nav-links {
    flex-wrap: wrap;
    justify-content: center;
  }

  .nav-links li {
    margin: 5px 10px;
  }

  .logout-button {
    width: 100%;
    padding: 10px 0;
    text-align: center;
    margin-top: 10px;
  }
}
</style>
