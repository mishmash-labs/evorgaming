importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyAz36JmPyGzveC-R-4fdv_CWqgUitmR13o",
    authDomain: "evorgaming-98bef.firebaseapp.com",
    databaseURL: "https://evorgaming-98bef.firebaseio.com",
    projectId: "evorgaming-98bef",
    storageBucket: "evorgaming-98bef.appspot.com",
    messagingSenderId: "468704633228",
    appId: "1:468704633228:web:513a85f1b0faa1769c36a9",
    measurementId: "G-BETE72Q68V"
});

const messaging = firebase.messaging();
