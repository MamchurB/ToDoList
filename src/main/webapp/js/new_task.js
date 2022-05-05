let task__add = document.querySelector('.task__add_inner');
let creator = document.querySelector('.creator__wrapper');
let creator__button = document.querySelector('.creator__button');
let creators__close = document.querySelectorAll('.creator__close');

// let changer__button = document.querySelector('.changer__button');
// let changer = document.querySelector('.changer__wrapper');
// let elements__gear = document.querySelectorAll('.element__gear');

// for (let element__gear of elements__gear) {
//    element__gear.onclick = function () {
//       changer.classList.add('active');
//       back.classList.add('locked');
//       if (changer__select.value == "waiting-for") {
//          console.log(1);
//          changer__owner.classList.remove('creator__input_owner');
//          changer__owner_text.classList.remove('creator__input_owner');
//          for (let changer__date of changer__dates) {
//             changer__date.classList.remove('creator__input_dates');
//          }
//       }
//       else {
//          console.log(0);
//          changer__owner.classList.add('creator__input_owner');
//          changer__owner_text.classList.add('creator__input_owner');
//          for (let changer__date of changer__dates) {
//             changer__date.classList.add('creator__input_dates');
//          }
//       }
//    }
// }

// changer__button.onclick = function () {
//    changer.classList.remove('active');
//    back.classList.remove('locked');
// }


task__add.onclick = function () {
   creator.classList.add('active');
   back.classList.add('locked');
}
creator__button.onclick = function () {
   creator.classList.remove('active');
   back.classList.remove('locked');
}

for (let creator__close of creators__close) {
   creator__close.onclick = function () {
      creator.classList.remove('active');
      // changer.classList.remove('active');
   }
}


let creator__select = document.getElementById('creator__select');
let input__owner = document.getElementById('input__owner');
let input__owner_text = document.getElementById('input__owner_text');
let input__dates = document.querySelectorAll('.dates__invisible');
creator__select.onchange = function () {
   if (creator__select.value == "waiting-for") {
      input__owner.classList.remove('creator__input_owner');
      input__owner_text.classList.remove('creator__input_owner');
      for (let input__date of input__dates) {
         input__date.classList.remove('creator__input_dates');
      }
   }
   else {
      input__owner.classList.add('creator__input_owner');
      input__owner_text.classList.add('creator__input_owner');
      for (let input__date of input__dates) {
         input__date.classList.add('creator__input_dates');
      }
   }
}


// let changer__select = document.getElementById('changer__select');
// let changer__owner = document.getElementById('changer__owner');
// let changer__owner_text = document.getElementById('changer__owner_text');
// let changer__dates = document.querySelectorAll('.dates__invisible_changer');
// changer__select.onchange = changer__select.onload= function () {
//    if (changer__select.value == "waiting-for") {
//       changer__owner.classList.remove('creator__input_owner');
//       changer__owner_text.classList.remove('creator__input_owner');
//       for (let changer__date of changer__dates) {
//          changer__date.classList.remove('creator__input_dates');
//       }
//    }
//    else {
//       changer__owner.classList.add('creator__input_owner');
//       changer__owner_text.classList.add('creator__input_owner');
//       for (let changer__date of changer__dates) {
//          changer__date.classList.add('creator__input_dates');
//       }
//    }
//}