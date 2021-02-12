function savePopup(){
  if (document.getElementById("save") == null ){
    return null;
  }
const save = document.getElementById("save");
save.addEventListener('click', (e) => {
  const XHR = new XMLHttpRequest();
  const formData = new FormData(getElementById("form"));
  XHR.open("POST", content_recipes_path, true);
  XHR.send(formData);
  XHR.onload = () =>{
    if (XHR.status != 200 ){
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
  };
  e.preventDefault();
});
}

window.addEventListener('load', savePopup);