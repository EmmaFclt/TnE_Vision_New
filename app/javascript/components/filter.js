const popUpFilter = () => {
  filterClick = document.getElementByClass("filter");
  filterClick.addEventListener("click", (event) => {
    event.currentTarget.innerText = 'Hold still...';
  });
};

export {popUpFilter};
