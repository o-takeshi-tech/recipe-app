function destroy (){
  const buttonDelete = document.getElementById("button_delete");
  
  buttonDelete.addEventListener("click", () => {
    const form = document.querySelectorAll(".ingredients");
    const formNumber = form.length - 1;
    if (formNumber == 0){
      return null 
    } else {
      form[formNumber].remove();
    };
  })
};

window.addEventListener("load", destroy );