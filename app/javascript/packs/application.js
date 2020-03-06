require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import Chart from 'chart.js';


// edit profile

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
        labels: ['Health done', 'Health unfinished', 'Exploration done', 'Exploration unfinished', 'Relationship done', 'Relationship unfinished'],
        datasets: [{
            label: '# of Votes',
            data: [chart.dataset.healthDone, chart.dataset.healthTobedone, chart.dataset.explorationDone, chart.dataset.explorationTobedone, chart.dataset.relationshipDone, chart.dataset.relationshipTobedone],
            backgroundColor: [
                '#FF008A',
                '#FFFFFF',
                '#040083',
                '#FFFFFF',
                '#27CA00',
                '#FFFFFF'
            ],
            borderColor: [
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6',
                '#D6D6D6'
            ],
            borderWidth: 1
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
              text: 'Chart.js Doughnut Chart'
            },
            animation: {
              animateScale: true,
              animateRotate: true
            }
          }
});
