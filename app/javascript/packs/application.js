require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

// edit profile

// const description = document.querySelector(".edit-profile");


if (description) {
  description.addEventListener("click", (e) => {
    const descriptionForm = document.querySelector('.description-form');
    descriptionForm.classList.toggle("invisible-form")
  })
}

// header

/* When the user scrolls down, hide the navbar. When the user scrolls up, show the navbar */
var prevScrollpos = window.pageYOffset + 50;
window.onscroll = function() {
  if (window.pageYOffset > 10) {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      document.getElementById("myHeader").style.top = "0";
    } else {
      document.getElementById("myHeader").style.top = "-54px";
    }
    prevScrollpos = currentScrollPos;

  }
}

// api call
const url = "https://api.predicthq.com/v1/events/?q=concert";
const options = {
  mode: 'cors',
  headers: {
    'Authorization': 'Bearer fp8j4_bwRRRWgxLZNMJPIqt_9P6mh3fUIvGTLhEf',
    // 'Access-Control-Allow-Origin': true
  }
}

fetch(url, options)
  .then((response) => {
  console.log(response.json().then(e => {
    console.log(e);
  }));
})