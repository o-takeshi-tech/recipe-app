function popup(){
  if (document.getElementById("ingredient-index") == null ){
    return null;
  }

  const lists = document.getElementById("ingredient-index");
  const close = document.getElementById("close");
  const popup = document.getElementById("popup");
  const layer = document.getElementById("layer");

  lists.addEventListener("click", () => {
    layer.style.display = "block";
    popup.style.display = "block";
  });
  
  close.addEventListener("click", () => {
    layer.style.display = "none";
    popup.style.display = "none";
  })

}

window.addEventListener("load", popup);
