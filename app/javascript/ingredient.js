function add(){
  const buttonPlus = document.getElementById("button_plus");
  const buttonDelete = document.getElementById("button_delete");
  
  buttonPlus.addEventListener("click", () => {
    const form = document.getElementById("ingredients");
    form.insertAdjacentHTML("afterend", ingredient);
  });

  buttonDelete.addEventListener("click", () => {
    const form = document.getElementById("ingredients");
    form.remove();
  })
};

window.addEventListener("load", add)