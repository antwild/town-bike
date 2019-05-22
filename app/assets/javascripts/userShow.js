
var profileNav = document.querySelectorAll(".profile-li");
var myDetails = document.querySelectorAll(".my-details");
var myBikes = document.querySelectorAll(".my-bikes");
var bookings = document.querySelectorAll(".bookings-made");
var editBtn = document.querySelector(".edit-btn");

profileNav.forEach(li => {
  li.addEventListener("click", () => {
    profileNav.forEach(li => {
      li.classList.remove("profile-active");
    });
    li.classList.add("profile-active");
  });
});

profileNav[0].addEventListener("click", () => {
  removeDetails();
  myDetails.forEach(detail => {
    detail.style.display = "block";
  });
  editBtn.style.display = "block";
});

profileNav[1].addEventListener("click", () => {
  removeDetails();
  myBikes.forEach(detail => {
    detail.style.display = "block";
  });
});

profileNav[2].addEventListener("click", () => {
  removeDetails();
  bookings.forEach(detail => {
    detail.style.display = "block";
  });
});

var removeDetails = () => {
  myDetails.forEach(detail => {
    detail.style.display = "none";
  });
  myBikes.forEach(detail => {
    detail.style.display = "none";
  });
  bookings.forEach(detail => {
    detail.style.display = "none";
  });
  editBtn.style.display = "none";
};
