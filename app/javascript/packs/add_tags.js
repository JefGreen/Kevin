const addTag = document.getElementById("trigger_like")
const revealedInput = document.getElementById("like_input")
   addTag.addEventListener("click", function() {
   	revealedInput.classList.toggle("w-0")
   	revealedInput.classList.toggle("w-100")
   })

const addedTag = document.getElementById("trigger_dislike")
const revealedInputed = document.getElementById("dislike_input")
   addedTag.addEventListener("click", function() {
    revealedInputed.classList.toggle("w-0")
    revealedInputed.classList.toggle("w-100")
   })
