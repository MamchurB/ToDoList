let element__add = document.querySelectorAll('.element__add');
for (let add of element__add) {
   add.onclick = function () {
      creator.classList.add('active');
      back.classList.add('locked');
   }
}