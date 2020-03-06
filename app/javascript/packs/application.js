require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import Chart from 'chart.js';

const description = document.querySelector(".edit-profile");
if (description != null){
description.addEventListener("click", (e) => {
  const descriptionForm = document.querySelector('.description-form');
  descriptionForm.classList.toggle("invisible-form")
})
}

// dashboard graph
const chart = document.getElementById('myChart');
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Health done', "Health To-do", 'Exploration done', "Exploration To-do", 'Relationship done', "Relationship  To-do"],
        datasets: [{
            label: '# of Votes',
            data: [chart.dataset.healthDone, chart.dataset.healthTobedone, chart.dataset.explorationDone, chart.dataset.explorationTobedone, chart.dataset.relationshipDone, chart.dataset.relationshipTobedone],
            backgroundColor: [
                '#ff0101',
                '#ec9999',
                '#167ffb',
                '#8ebbf0',
                '#1edd88',
                '#91d3b6'
            ],
            borderColor: [
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6'
            ],
            borderWidth: 0
        }]
    },
    options: {
            rotation: 1 * Math.PI,
            circumference: 1 * Math.PI,
            responsive: true,
            legend: {
              position: 'top',
            },
            title: {
              display: true,
              text: 'Monthly Goals'
            },
            animation: {
              animateScale: true,
              animateRotate: true
            }
          }
});

const editProfile = document.querySelector(".edit-profile");


editProfil.addEventListener("click", (e) => {
  const descriptionForm = document.querySelector('.description-form');
  descriptionForm.classList.toggle("invisible-form")
})

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
