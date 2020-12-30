if (location.pathname.match("/recipes/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const buttonDelete = document.getElementById("button_delete");
  
  buttonDelete.addEventListener("click", () => {
    const form = document.querySelectorAll(".nested-fields");
    const formNumber = form.length - 1;
    if (formNumber == 0){
      return null 
    } else {
      form[formNumber].remove();
    };
  })
  })
};
