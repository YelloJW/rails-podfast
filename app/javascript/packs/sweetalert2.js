import Swal from 'sweetalert2';

const form = document.getElementById('like-form');
if (form) {
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to use this feature',
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

const button = document.getElementById('playlist-form');
if (button) {
  button.addEventListener('click', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to use this feature',
      icon: 'warning',
      confirmButtonText: 'Login',
      showCancelButton: true
    }).then((result) => {
      if (result.value) {
        event.target.closest('form').submit();
      }
    })
  });
}

const bookmark = document.getElementById('playlist-homepage-form');
if (bookmark) {
  bookmark.addEventListener('click', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to use this feature',
      icon: 'warning',
      confirmButtonText: 'Login',
      showCancelButton: true
    }).then((result) => {
      if (result.value) {
        event.target.closest('form').submit();
      }
    })
  });
}

const bookmark2 = document.getElementById('playlist-search-form');
if (bookmark2) {
  bookmark2.addEventListener('click', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to use this feature',
      icon: 'warning',
      confirmButtonText: 'Login',
      showCancelButton: true
    }).then((result) => {
      if (result.value) {
        event.target.closest('form').submit();
      }
    })
  });
}

const follows = document.getElementById('follows-icon');
if (follows) {
  follows.addEventListener('click', (event) => {
    event.preventDefault();
    Swal.fire({
      title: '',
      text: 'Please login to use this feature',
      icon: 'warning',
      confirmButtonText: 'Login',
      showCancelButton: true
    }).then((result) => {
      if (result.value) {
        event.target.closest('form').submit();
      }
    })
  });
}
