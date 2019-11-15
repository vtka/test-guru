document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if(progressBar) {
    var questionNumber = progressBar.dataset.questionNumber
    var questionSize = progressBar.dataset.questionSize

    var progressPercent = ((100 * questionNumber) / questionSize) + '%'

    progressBar.style.width = progressPercent
  }
})
