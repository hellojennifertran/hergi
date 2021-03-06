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
                    '#ffffff',
                    '#64c194',
                    '#ffffff',
                    '#5763af',
                    '#ffffff'
                ],
                borderColor: [
                    '#f58226',
                    '#f58226',
                    '#64c194',
                    '#64c194',
                    '#5763af',
                    '#5763af'
                ],
                borderWidth: 2
            }]
        },
        options: {
                cutoutPercentage:70,
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
      beforeDraw: function(cht) {
        var width = cht.chart.width,
            height = cht.chart.height,
            ctx = cht.chart.ctx;

        ctx.restore();

        var fontSize = (height / 140).toFixed(2);

        ctx.font = fontSize + "em Montserrat";
        ctx.textBaseline = "middle";

        var text = chart.dataset.total,
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
  // api call
  // const discovers = document.getElementById("discovers-nav");
  // if (discovers) {
  //   const url = "https://www.eventbriteapi.com/v3";
  //   const options = {
  //     headers: {
  //       'Authorization':'Bearer 7EDIBA4OXL6DKUBIPNIC'
  //     }
  //   }
  //   fetch(url, options)
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //     })
  // }
  const menuButton = document.querySelector(".menu-trigger");
  const item0 = document.querySelector('.menu-0')
  const item1 = document.querySelector('.menu-1')
  const item2 = document.querySelector('.menu-2')
  const item3 = document.querySelector('.menu-3')
  const pageContent = document.querySelector('.page-content');
  
  menuButton.addEventListener('click', (e) => {
    item0.classList.toggle('item0-active');
    item1.classList.toggle('item1-active');
    item2.classList.toggle('item2-active');
    item3.classList.toggle('item3-active');
    pageContent.classList.toggle('dropup-active');
    // document.querySelectorAll(".move-left").forEach((item) => {
    //   item.classList.toggle('move-left');
    // });
  })
  pageContent.addEventListener('click', (e) => {
    item0.classList.remove('item0-active');
    item1.classList.remove('item1-active');
    item2.classList.remove('item2-active');
    item3.classList.remove('item3-active');
    pageContent.classList.remove('dropup-active');
    // document.querySelectorAll(".move-left").forEach((item) => {
    //   item.classList.toggle('move-left');
    // });
  })
});





