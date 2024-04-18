document.addEventListener("DOMContentLoaded", function () {
  var flashMessage = document.getElementById("flashMessage");

  // Function to hide flash message after 5 seconds
  function hideFlashMessage() {
      flashMessage.classList.add("hidden");
  }

  // Hide flash message after 5 seconds
  setTimeout(hideFlashMessage, 10000);
});