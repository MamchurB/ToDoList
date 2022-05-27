
// -- Pie Chart Example
var bcLabels = $("#bcLabels").val();
console.log(bcLabels);
bcLabels = bcLabels.replace("[","")
    .replace("]","")
    .split(",");

var bcPercents = $("#bcPercents").val().trim();

console.log(bcPercents);
bcPercents = bcPercents.replace("[","")
    .replace("]","")
    .split(",");

var ctx2 = document.getElementById("myPieChart");

var firstColor = getComputedStyle(document.documentElement).getPropertyValue('--darker');
var secondColor = getComputedStyle(document.documentElement).getPropertyValue('--color-4');

var myPieChart = new Chart(ctx2, {
  type: 'pie',
  data: {
    labels: bcLabels,
    datasets: [{
      data: bcPercents,
      backgroundColor: [firstColor, secondColor],
    }],
  },options: {
    events: []
  }
});

let themeButton = document.querySelector('.theme');
var firstColor = getComputedStyle(document.documentElement).getPropertyValue('--darker');
var secondColor = getComputedStyle(document.documentElement).getPropertyValue('--color-4');
themeButton.onclick = function () {

  let theme = document.getElementById('theme');

  if (theme.getAttribute("href") == "/todolist/css/theme-1.css") {
    theme.href = "/todolist/css/theme-2.css";
  }
  else if (theme.getAttribute("href") == "/todolist/css/theme-2.css") {
    theme.href = "/todolist/css/theme-3.css";
  }
  else if (theme.getAttribute("href") == "/todolist/css/theme-3.css") {
    theme.href = "/todolist/css/theme-4.css";
  }
  else if (theme.getAttribute("href") == "/todolist/css/theme-4.css") {
    theme.href = "/todolist/css/theme-5.css";
  }
  else {
    theme.href = "/todolist/css/theme-1.css";
  }
  setTimeout(() => {
    firstColor = getComputedStyle(document.documentElement).getPropertyValue('--darker');
    secondColor = getComputedStyle(document.documentElement).getPropertyValue('--color-4');
    var myPieChart = new Chart(ctx2, {
      type: 'pie',
      data: {
        labels: bcLabels,
        datasets: [{
          data: bcPercents,
          backgroundColor: [firstColor, secondColor],
        }],
      },
      options: {
        events: []
      }
    });
  }, 100);

}