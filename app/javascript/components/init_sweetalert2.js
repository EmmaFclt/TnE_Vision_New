import Swal from 'sweetalert2'


const initSweetAlert = () => {
  // const graphForms = document.querySelectorAll(".simple_form.mail")
  // graphForms.forEach(form => {
  //   form.addEventListener('submit', (event) => {
  //     console.log("test")
  //     event.preventDefault()
  //     Swal.fire({
  //       title: 'Bravo!',
  //       text: 'Votre mail a été envoyé avec succès.',
  //       icon: 'success',
  //       confirmButtonText: 'Cool'
  //     })
  //   })
  // })
  $('.graph-mail-modal').on('hidden.bs.modal', function (e) {
    Swal.fire({
      title: 'Bravo!',
      text: 'Votre mail a été envoyé avec succès.',
      icon: 'success',
      confirmButtonText: 'Cool'
    })
  })
}

export default initSweetAlert
