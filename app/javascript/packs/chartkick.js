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
  colors: ["#E94E1B", "#10355F", "#FAB520", "#C8D400", "#B2B2B2", "#F4F4F4", "#3D6084", "#FEDA9B"]

}

