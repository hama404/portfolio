# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
  ctx = document.getElementById(id)
  myChart = new Chart(ctx, {
    type: 'line',
    data: {
      datasets: [{
        data: data,
        backgroundColor: 'rgba(71, 186, 193, 0.2)',
        borderColor: 'rgba(71, 186, 193, 1)',
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      legend: {
         display: false
      },
      scales: {
        xAxes: [{
          type: 'category',
          labels: labels
        }],
        yAxes: [{
          ticks: {
            autoSkip: true,
            beginAtZero: true,
            suggestedMax: 120,
            stepSize: 20
          }
        }]
      }
    }
  })
