const slideSidebar = () => {
  const btnSidebar = document.getElementById("close-sidebar");
  const sidebar = document.getElementById("sidebar");


  btnSidebar.addEventListener("click", (event) => {
    sidebar.classList.toggle("toggled");
  });


};

export {slideSidebar};
