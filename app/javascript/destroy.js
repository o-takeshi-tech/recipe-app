function destroy (){
  if (document.getElementById("button_delete") == null ){
    return null;
  }
  const buttonDelete = document.getElementById("button_delete");
  
  buttonDelete.addEventListener("click", () => {
    const form = document.querySelectorAll(".ingredient-form");
    const formNumber = form.length - 1;
    if (formNumber == 0){
      return null 
    } else {
      form[formNumber].remove();
    };
  })
};

window.addEventListener("load", destroy );