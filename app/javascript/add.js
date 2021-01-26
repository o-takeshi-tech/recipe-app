function add(){
  const buttonPlus = document.getElementById("button_plus");
  
  buttonPlus.addEventListener("click", () => {
    const form = document.querySelectorAll(".ingredient-form");
    const formNumber = form.length - 1;
    form[formNumber].insertAdjacentHTML("afterend", ingredient);
  });

};

window.addEventListener("load", add)