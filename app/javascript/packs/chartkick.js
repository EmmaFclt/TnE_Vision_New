require("chartkick")
require("chart.js")


window.Chartkick = Chartkick
Chartkick.addAdapter(Chart)
Chartkick.options = {
  library: {
    animation: {
      easing: 'easeOutQuart',
      duration: 3000
    }
  },
}
