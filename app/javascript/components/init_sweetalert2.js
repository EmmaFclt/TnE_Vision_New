import Swal from 'sweetalert2'


const initSweetAlert = () => {
  $('.graph-mail-modal').on('hidden.bs.modal', function (e) {
    Swal.fire({
      title: 'Bravo!',
      text: 'Votre mail a été envoyé avec succès.',
      icon: 'success',
    })
  })
}

export default initSweetAlert
