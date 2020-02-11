const popUpFilter = () => {
 const dateFilter = document.getElementById("date-filter");
  dateFilter.addEventListener("click", (event) => {
    event.currentTarget.innerText = 'Hold still...';
  });
};

export {popUpFilter};
