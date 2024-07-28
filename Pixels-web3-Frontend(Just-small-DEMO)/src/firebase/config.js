import firebase from "firebase/app";
import "firebase/firestore";
import "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyBY-fodh5Nl-Xz4aNnIMfaL2y6sRefwCIw",
  authDomain: "kestir-db.firebaseapp.com",
  databaseURL: "https://kestir-db-default-rtdb.firebaseio.com",
  projectId: "kestir-db",
  storageBucket: "kestir-db.appspot.com",
  messagingSenderId: "646068774003",
  appId: "1:646068774003:web:79921b2e55fab623233606",
  measurementId: "G-8LNKF9NMD1",
};

firebase.initializeApp(firebaseConfig);

const projectAuth = firebase.auth();
const projectFirestore = firebase.firestore();
const timestamp = firebase.firestore.FieldValue.serverTimestamp;

export { projectAuth, projectFirestore, timestamp };
