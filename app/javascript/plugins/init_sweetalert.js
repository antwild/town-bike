import swal from 'sweetalert';

const form = document.getElementById("new_payment");
form.addEventListener("submit", (event) => {
  event.preventDefault();
});

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };
