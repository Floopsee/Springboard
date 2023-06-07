const gameContainer = document.getElementById("game");
let cardsToCompare = [];
let cardCount = 0;

const COLORS = [
  "red",
  "blue",
  "green",
  "teal",
  "purple",
  "yellow",
  "red",
  "blue",
  "green",
  "teal",
  "purple",
  "yellow"
];

function shuffle(array) {
  let counter = array.length;
  while (counter > 0) {
    let index = Math.floor(Math.random() * counter);
    counter--;
    let temp = array[counter];
    array[counter] = array[index];
    array[index] = temp;
  }
  return array;
}

let shuffledColors = shuffle(COLORS);

function createDivsForColors(colorArray) {
  for (let color of colorArray) {
    const newDiv = document.createElement("div");
    newDiv.classList.add(color);
    newDiv.setAttribute("id", "colors")
    newDiv.addEventListener("click", handleCardClick);
    gameContainer.append(newDiv);
  }
}

function handleCardClick(event) {
  
  let clickedCard = event.target;
  clickedCard.style.backgroundColor = event.target.className;
  cardsToCompare.push(clickedCard) 
  cardCount++
  if (cardCount === 2) { 
    if (cardsToCompare[0].className === cardsToCompare[1].className){ 
      console.log("Thats a match!")
      cardCount = 0;
      cardsToCompare.splice(0, cardsToCompare.length);
    }
    else { 
      setTimeout(function() {
      cardsToCompare[0].style.backgroundColor = null;
      cardsToCompare[1].style.backgroundColor = null;
      cardCount = 0
      console.log("Not a match.")
      cardsToCompare.splice(0, cardsToCompare.length);
      }, 1000);
    } 
  }

return;  
}


createDivsForColors(shuffledColors);