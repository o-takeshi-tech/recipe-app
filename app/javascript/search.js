function search (){
  if (document.getElementById("keyword") == null ){
    return null;
  }
  const inputElement = document.getElementById("keyword");
  inputElement.addEventListener("keyup", () => {
    const keyword = document.getElementById("keyword").value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `recipes/match/?keyword=${keyword}`, true);
    XHR.responseType = "json";
    XHR.send();

    XHR.onload = () => {
      const searchResult = document.getElementById("search-result");
      searchResult.innerHTML = "";
      if (XHR.response){
        const ingredientName = XHR.response.keyword;
        ingredientName.forEach((ingredient) =>{
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", ingredient.id);
          childElement.innerHTML = ingredient.ingredient_name
          searchResult.appendChild(childElement);
          const clickElement = document.getElementById(ingredient.id);
          clickElement.addEventListener("click", () => {
            document.getElementById("keyword").value = clickElement.textContent;
            clickElement.remove();
          });
        });
      };
    }
  })
};

window.addEventListener("load", search)