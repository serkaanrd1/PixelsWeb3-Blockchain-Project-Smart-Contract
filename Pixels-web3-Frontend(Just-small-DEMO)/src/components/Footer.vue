<template>
  <footer v-if="user" class="footer">
    <div class="footer-content">
      <div class="footer-left">
        <img src="../assets/logo.png" alt="Logo" class="footer-logo" />
      </div>
      <div class="footer-center">
        <ul class="footer-links">
          <li><a href="#">What is pixel? </a></li>
          <li><a href="#">About</a></li>

          <li><a href="#">Contact</a></li>
          <li><a href="#">User Agreement</a></li>
          <li><a href="#">Privacy Policy </a></li>
        </ul>
      </div>
      <div class="footer-right">
        <ul class="footer-links">
          <li><a href="#">Help</a></li>
          <li><a href="#">FAQ</a></li>
        </ul>
      </div>
    </div>
    <p class="footer-copy">
      Copyright &copy; 2024 All Rights Reserved. | pixels.com.tr
    </p>
  </footer>
</template>

<script>
import { ref } from "vue";
import useLogout from "../composables/useLogout";
import getUser from "../composables/getUser";

export default {
  setup() {
    const { logout, error } = useLogout();
    const { user } = getUser();

    const handleClick = async () => {
      await logout();
    };

    return { handleClick, user };
  },
};
</script>
<style>
.footer {
  padding: 20px;
  background-color: #42b983;
  color: #ffffff;
  border-top: 1px solid #42b983;
  width: 100%;
  overflow: hidden; /* İçerik sızmasını önlemek için */
  z-index: 1000;
}

.footer-content {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between; /* İçerikleri sağa ve sola yaslamak için */
}

.footer-left {
  flex: 1;
}

.footer-center,
.footer-right {
  flex: 1;
  display: flex;
  justify-content: center;
  padding: 0 20px; /* Menüleri birbirinden ayırmak için */
}

.footer-logo {
  width: 50px;
  margin-right: 15px; /* Logo ve menüler arasında boşluk */
}

.footer-links {
  list-style: none;
  padding: 0;
  margin: 0;
  justify-content: center;
  display: flex; /* Menüleri yatay yapmak için */
  flex-wrap: wrap; /* Ekran küçükse alt alta sıralama */
}

.footer-links li {
  margin: 0 10px; /* Menü öğeleri arasında boşluk */
}

.footer-links a {
  text-decoration: none;
  color: #ffffff;
  font-size: 14px;
}

.footer-links a:hover {
  color: #3d3a3a;
}

.footer-copy {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex; /* Menüleri yatay yapmak için */
  flex-wrap: wrap; /* Ekran küçükse alt alta sıralama */
  justify-content: center;
  font-size: small;
}

/* Media Queries */
@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
  }

  .footer-center,
  .footer-right {
    justify-content: center;
  }

  .footer-links {
    justify-content: center;
    margin-top: 10px;
  }

  .footer-links li {
    margin: 5px;
  }
}

@media (max-width: 480px) {
  .footer-logo {
    margin: 0 auto 10px;
  }

  .footer-links {
    flex-direction: column;
  }

  .footer-links li {
    margin: 3px 0;
  }
}
</style>
