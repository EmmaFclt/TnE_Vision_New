require("chartkick")
require("chart.js")

// require("@rails/ujs").start()
// require("@rails/activestorage").start()
import "bootstrap";
import {slideSidebar} from "../components/sidebar";
//import {initDownloadModal} from "../components/modal_download";
// import {dateFilter, entityFilter, compliancyFilter, serviceFilter} from "../components/filter";
// require("channels")
// import { maFonction } from 'monFichier'

// $(".sidebar-dropdown > a").click(function() {

//   $(".sidebar-submenu").slideUp(200);

//   if ( $(this).parent().hasClass("active") ) {
//     $(".sidebar-dropdown").removeClass("active");
//     $(this).parent().removeClass("active");
//   } else {
//     $(".sidebar-dropdown").removeClass("active");
//     $(this).next(".sidebar-submenu").slideDown(200);
//     $(this).parent().addClass("active");
//   }
// });

// $("#close-sidebar").click(function() {
//   $(".page-wrapper").removeClass("toggled");
// });

// $("#show-sidebar").click(function() {
//   $(".page-wrapper").addClass("toggled");
// });
// Chartkick.options[:content_for] = :charts_js
slideSidebar();
//initDownloadModal();
// // dateFilter();
// entityFilter();
// compliancyFilter();
// serviceFilter();


if (document.querySelector(".alert-test")) {

  if (document.querySelector(".alert-test").innerHTML.length > 0) {
    document.querySelector(".fa-bell").classList.add('text-danger');
    if (document.getElementById("update-budget")) document.querySelector("#pages-budget .fa-bell").click();
  };

  if (document.querySelector(".alert-test").innerHTML.length === 0) {
    document.querySelector(".link_alert").innerHTML='';
  };

};
