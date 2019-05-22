
var profileNav = document.querySelectorAll(".profile-li");
var myDetails = document.querySelectorAll(".my-details");
var myBikes = document.querySelectorAll(".my-bikes");
var bookings = document.querySelectorAll(".bookings-made");
var editBtn = document.querySelector(".edit-btn");

profileNav.forEach(function(li) {
  li.addEventListener("click", function() {
    profileNav.forEach(function() {
      li.classList.remove("profile-active");
    });
    li.classList.add("profile-active");
  });
});

profileNav[0].addEventListener("click", function() {
  removeDetails();
  myDetails.forEach(function(detail) {
    detail.style.display = "block";
  });
  editBtn.style.display = "block";
});

profileNav[1].addEventListener("click", function() {
  removeDetails();
  myBikes.forEach(function(detail) {
    detail.style.display = "block";
  });
});

profileNav[2].addEventListener("click", function() {
  removeDetails();
  bookings.forEach(function(detail) {
    detail.style.display = "block";
  });
});

var removeDetails = function() {
  myDetails.forEach(function(detail) {
    detail.style.display = "none";
  });
  myBikes.forEach(function(detail) {
    detail.style.display = "none";
  });
  bookings.forEach(function(detail) {
    detail.style.display = "none";
  });
  editBtn.style.display = "none";
};
