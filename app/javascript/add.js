if (location.pathname.match("recipes/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const buttonPlus = document.getElementById("button_plus");
  
  buttonPlus.addEventListener("click", () => {
    const form = document.querySelectorAll(".nested-fields");
    const formNumber = form.length - 1;
    form[formNumber].insertAdjacentHTML("afterend", ingredient);
  });
  })
};


