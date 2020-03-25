const quiz = () => {

    const yesButton = document.querySelector("#yes-button");
    const noButton = document.querySelector("#no-button");
    const hiddenAnswerField = document.querySelector("#answer_answer");
    // attach event listeners to each button to listen a click



      yesButton.addEventListener("click", () => {
        // change the style of the yes button
        yesButton.classList.add("selected"); // <div id="yes-button" class="yes selected"></div>
        noButton.classList.remove("selected");
        // select the hidden input field and change the value to "true"
        hiddenAnswerField.value = "true";
      });


    // same thing for no button


      noButton.addEventListener("click", () => {
        // change the style of the yes button
        noButton.classList.add("selected"); // <div id="yes-button" class="yes selected"></div>
        yesButton.classList.remove("selected");
        // select the hidden input field and change the value to "false"
        hiddenAnswerField.value = "false";
      });


}


export {quiz};


// const submitButton = document.GetElementById // .......
// ​
// // in event listener
// submitButton.click();
// ​
// // or
// setTimeout(() => {
//   submitButton.click()
// }, 200)
