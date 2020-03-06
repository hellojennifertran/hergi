require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

// edit profile

// const description = document.querySelector(".edit-profile");

// description.addEventListener("click", (e) => {
//   const descriptionForm = document.querySelector('.description-form');
//   descriptionForm.classList.toggle("invisible-form")
// })

// api call
const url = "https://api.predicthq.com/v1/events/";
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
    console.log(JSON.stringify(e.results));
  }));
})

