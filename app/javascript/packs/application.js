require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap";
import Chart from 'chart.js';

document.addEventListener('turbolinks:load', () => {
  const editImg = document.querySelector('.form-group.file.optional.user_photo');
  if (editImg) {
    editImg.classList.add('invisible-form');
  }
  const editProfile = document.querySelector(".edit-profile");
  if (editProfile) {
    editProfile.addEventListener("click", (e) => {
      // user description
      const descriptionForm = document.querySelector('.user-note');
      const profileNote = document.querySelector('.profile-note');
      descriptionForm.classList.toggle("invisible-form");
      profileNote.classList.toggle("invisible-form");
      // edit image
      // const profileImg = document.querySelector('.profile-img');
      editImg.classList.toggle("invisible-form");
      // profileImg.classList.toggle("invisible-form");
      // document.querySelector('.edit-img').disabled = !document.querySelector('.edit-img').disabled
      // privatize
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
            labels: ['Health', 'Health goal', 'Exploration', 'Exploration goal', 'Relationship', 'Relationship goal'],
            datasets: [{
                label: '# of Votes',
                data: [chart.dataset.healthDone, chart.dataset.healthTobedone, chart.dataset.explorationDone, chart.dataset.explorationTobedone, chart.dataset.relationshipDone, chart.dataset.relationshipTobedone],
                backgroundColor: [
                    '#f58226',
                    '#f5a872',
                    '#64c194',
                    '#c0dfd0',
                    '#5763af',
                    '#adc5e4'
                ],
                borderColor: [
                    '#ffffff',
                    '#ffffff',
                    '#ffffff',
                    '#ffffff',
                    '#ffffff',
                    '#ffffff'
                ],
                borderWidth: 0
            }]
        },
        options: {
                rotation: 1 * Math.PI,
                circumference: 1 * Math.PI,
                responsive: true,
                legend: {
                  position: 'top'
                },
                title: {
                  display: false,
                  text: 'Monthly Goal'
                },
                animation: {
                  animateScale: true,
                  animateRotate: true
                },
                legend: {
                  labels: {
                      filter: function(item, chart) {
                          // Logic to remove a particular legend item goes here
                          return item.text == 'Health' || item.text == 'Exploration' || item.text == 'Relationship';
                      }
                  }
                }
      }
    });

    Chart.pluginService.register({
      beforeDraw: function(chart) {
        var width = chart.chart.width,
            height = chart.chart.height,
            ctx = chart.chart.ctx;

        ctx.restore();
        var fontSize = (height / 114).toFixed(2);
        ctx.font = fontSize + "em sans-serif";
        ctx.textBaseline = "middle";

        var text = "79%",
            textX = Math.round((width - ctx.measureText(text).width) / 2),
            textY = height / 1.2;

        ctx.fillText(text, textX, textY);
        ctx.save();
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
