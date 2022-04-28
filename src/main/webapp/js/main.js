let sliderElement = document.querySelector('.sider__element');
let sider = document.querySelector('.sider');

sliderElement.onclick = function () {
   sider.classList.toggle('active');
   sliderElement.classList.toggle('active');
}

let element__list = document.querySelectorAll('.element__list')
let elements__triangle = document.querySelectorAll('.element__triangle')

for (let item of element__list) {
   if (item.childElementCount >= 2) {
      item.classList.add('has-children');
   }
}
let parentOfTriangle;

for (let element__triangle of elements__triangle) {
   element__triangle.onclick = function () {
      element__triangle.classList.toggle('active');
      parentOfTriangle = element__triangle.parentElement.classList.toggle('active');
   }
}