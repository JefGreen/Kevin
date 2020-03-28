const addTag = document.getElementById("trigger_like")
const revealedInput = document.getElementById("like_input")
   addTag.addEventListener("click", function() {
   	revealedInput.classList.remove("d-none")
   })
