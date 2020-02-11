import flatpickr from "flatpickr";
// Date Filter

const dateFilter = () => {
  const dateTab = document.getElementById("date-filter");

  dateTab.addEventListener("click", e => {
    flatpickr("#date-filter");
    console.log("ayo", dateTab);
  });
};
export { dateFilter };

const entityFilter = () => {
 const entityFilter = document.getElementById("entity-filter");
  entityFilter.addEventListener("click", (event) => {
    event.currentTarget.innerText = 'Hold still...';
  });
};
export {entityFilter};

const compliancyFilter = () => {
 const compliancyFilter = document.getElementById("compliancy-filter");
  compliancyFilter.addEventListener("click", (event) => {
    event.currentTarget.innerText = 'Hold still...';
  });
};
export {compliancyFilter};

const serviceFilter = () => {
 const serviceFilter = document.getElementById("service-filter");
  serviceFilter.addEventListener("click", (event) => {
    event.currentTarget.innerText = 'Hold still...';
  });
};
export {serviceFilter};



