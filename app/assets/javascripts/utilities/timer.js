document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) { startTimer(timer) }
})

function startTimer(timer) {
  var timeLimit = timer.dataset.startValue;
  showTimer(timeLimit, timer)
  var timerId = setInterval(function() {
    timeLimit--
    showTimer(timeLimit, timer)
    if (timeLimit <= 0) {
      clearInterval(timerId)
      location.reload(true);
    }
  }, 1000)
}

function showTimer(seconds, timer) {
  timer.textContent = parseInt(seconds / 3600) + 'h' + parseInt(seconds / 60 % 60) + 'm' + (seconds % 60) + 's'
}
