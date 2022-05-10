let checkbox = document.querySelectorAll('.checkbox');
for (let check of checkbox) {
   let checkboxParent = check.parentElement;
   let checkboxParentOfParent = checkboxParent.parentElement;
   if (check.checked == true) checkboxParentOfParent.classList.toggle('line-through');
   check.addEventListener('change', (event) => {
      let checkClosest = check.closest('.element');
      if (checkClosest != null) {
         checkClosest.classList.toggle('line-through');
      }
   })

}