<template>
  <div>
    <button @click="connectMetamask">Metamask</button>
  </div>
</template>

<script>
import Web3 from "web3";

export default {
  data() {
    return {
      web3: null,
      account: null,
    };
  },
  methods: {
    async connectMetamask() {
      if (window.ethereum) {
        this.web3 = new Web3(window.ethereum);
        const accounts = await this.web3.eth.getAccounts();
        this.account = accounts[0];
        console.log("Metamask cüzdanı bağlandı:", this.account);
      } else {
        console.log("Metamask cüzdanı bulunamadı");
      }
    },
  },
};
</script>
