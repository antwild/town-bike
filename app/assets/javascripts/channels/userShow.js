const profileNav = document.querySelectorAll(".profile-li");
const myDetails = document.querySelectorAll(".my-details");
const h4 = document.querySelectorAll("h4");
const editBtn = document.querySelector(".edit-btn");

profileNav.forEach(li => {
  li.addEventListener("click", () => {
    profileNav.forEach(li => {
      li.classList.remove("profile-active");
    });
    li.classList.add("profile-active");
  });
});

profileNav[0].addEventListener("click", () => {
  h4.forEach(detail => {
    detail.style.display = "none";
  });
  myDetails.forEach(detail => {
    detail.style.display = "block";
  });
  editBtn.style.display = "block";
});

profileNav[1].addEventListener("click", () => {
  removeDetails();
  h4.forEach(detail => {
    detail.style.display = "block";
  });
  editBtn.style.display = "none";
});

profileNav[2].addEventListener("click", () => {
  removeDetails();
  h4.forEach(detail => {
    detail.style.display = "block";
  });
  editBtn.style.display = "none";
});

const removeDetails = () => {
  myDetails.forEach(detail => {
    detail.style.display = "none";
  });
  editBtn.style.display = "none";
};
