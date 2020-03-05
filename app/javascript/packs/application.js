require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

// edit profile

const description = document.querySelector(".edit-profile");

description.addEventListener("click", (e) => {
  const descriptionForm = document.querySelector('.description-form');
  descriptionForm.classList.toggle("invisible-form")
})
