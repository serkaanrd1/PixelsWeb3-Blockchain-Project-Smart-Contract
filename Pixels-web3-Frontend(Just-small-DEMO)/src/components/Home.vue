<template>
  <div class="grid">
    <div
      v-for="(pixel, index) in pixels"
      :key="index"
      class="pixel"
      @mouseover="enlargePixel(pixel)"
      @mouseout="shrinkPixel(pixel)"
      @click="showMenu(pixel)"
    >
      <img v-if="pixel.image" :src="pixel.image" alt="Pixel Image" />
      <div v-else>{{ index }}</div>
    </div>
    <div v-if="selectedPixel" class="popup">
      <div class="popup-header">
        <span class="popup-close" @click="closePopup">&times;</span>
      </div>
      <div class="menu">
        <button v-if="!selectedPixel.owner" @click="buyPixel(selectedPixel)">
          Satın Al
        </button>
        <button v-if="selectedPixel.owner" @click="sellPixel(selectedPixel)">
          Sat
        </button>
        <button
          v-if="selectedPixel.owner"
          @click="customizePixel(selectedPixel)"
        >
          Özelleştir
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pixels: Array(455)
        .fill()
        .map(() => ({
          showMenu: false,
          owner: false,
          image: null,
          enlarged: false,
        })),
      selectedPixel: null,
    };
  },
  methods: {
    showMenu(pixel) {
      this.selectedPixel = pixel;
    },
    buyPixel(pixel) {
      console.log("Satın alındı!");
      pixel.owner = true;
    },
    sellPixel(pixel) {
      console.log("Satıldı!");
      pixel.owner = false;
    },
    customizePixel(pixel) {
      console.log("Özelleştirildi!");
      // Özelleştirme işlemini gerçekleştir
      // Örneğin, resim eklemek için:
      pixel.image = "https://example.com/image.jpg";
    },
    enlargePixel(pixel) {
      pixel.enlarged = true;
    },
    shrinkPixel(pixel) {
      pixel.enlarged = false;
    },
    closePopup() {
      this.selectedPixel = null;
    },
  },
};
</script>

<style>
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(40px, 1fr));
  grid-gap: 1px;
}

.pixel {
  width: 100%;
  height: 40px;
  background-color: #42b983;
  border: 1px solid #ddd;
  cursor: pointer;
  position: relative;
  transition: transform 0.5s;
}

.pixel.enlarged {
  transform: scale(2);
  z-index: 1;
}

.pixel:hover {
  background-color: #42b983;
}

.popup {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  border: 1px solid #ddd;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.popup-header {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 10px;
}

.popup-close {
  cursor: pointer;
  font-size: 24px;
  font-weight: bold;
}

.menu {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.menu button {
  margin-bottom: 10px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #42b983;
  color: #fff;
  cursor: pointer;
}

.menu button:hover {
  background-color: #42b983;
}

.pixel img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.pixel img:hover {
  transform: scale(2);
  transition: transform 0.5s;
}
</style>
