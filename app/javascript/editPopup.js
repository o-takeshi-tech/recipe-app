function editPopup(){
  if (document.getElementById("edit") == null ){
    return null;
  }
const save = document.getElementById("edit");
save.addEventListener('click', (e) => {
  const XHR = new XMLHttpRequest();
  const formDate = new FormData(getElementById("form"));
  XHR.open("GET", edit_recipe_path, true);
  XHR.send(formDate);
  XHR.onload = () =>{
    if (XHR.status != 200 ){
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
  };
  e.preventDefault();
});
}

window.addEventListener('load', editPopup);