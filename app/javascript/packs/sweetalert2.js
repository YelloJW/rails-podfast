import Swal from 'sweetalert2';

const form = document.getElementById('like-form');
if (form) {
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to continue',
      icon: 'warning',
      confirmButtonText: 'Login',
      showCancelButton: true
    }).then((result) => {
      if (result.value) {
        event.target.submit();
      }
    })
  });
}