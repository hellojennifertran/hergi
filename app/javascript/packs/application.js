require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap";
import Chart from 'chart.js';

document.addEventListener('turbolinks:load', () => {
  const editProfile = document.querySelector(".edit-profile");
  if (editProfile) {
    editProfile.addEventListener("click", (e) => {
      const descriptionForm = document.querySelector('.user-note');
      descriptionForm.classList.toggle("invisible-form");
      const checkBoxes = document.querySelectorAll('.goal-privatize');
      checkBoxes.forEach((checkbox) => {
        checkbox.classList.toggle('invisible-form');
      })
      const updateBtn = document.querySelector('.profile-edit-btn');
      updateBtn.classList.toggle('invisible-form');
    })
  }
  const userDashboard = document.getElementById("myChart");
  if (userDashboard) {
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
  }
  // // api call
  // const discovers = document.getElementById("discovers-index");
  // if (discovers) {
  //   const url = "https://api.predicthq.com/v1/events/?q=concert";
  //   const options = {
  //     mode: 'cors',
  //     headers: {
  //       'Authorization':'Bearer fp8j4_bwRRRWgxLZNMJPIqt_9P6mh3fUIvGTLhEf'
  //     }
  //   }
  //   fetch(url, options)
  //     .then(response => response.json())
  //     .then((data) => {
  //       data.results.forEach((res) => {
  //         // interpolate .insertadjacetnhtml
  //         // const discoverBody = 
  //         // const html = 
  //       })
  //     })
  // }
})