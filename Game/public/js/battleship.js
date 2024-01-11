const width = 10;
const destroyer = shipsName('destroyer');
const submarine = shipsName('submarine');
const cruiser = shipsName('cruiser');
const battleship = shipsName('battleship');
const carrier = shipsName('carrier');
const displayGrid = document.querySelector('.matrix-display');
const ships = document.querySelectorAll('.ship');
const rotateButton = document.querySelector('#rotate');
const turnDisplay = document.querySelector('#turn');
const messageDisplay = document.querySelector('#message');
const endOfBattle = document.querySelector('#eob');
const winner =document.querySelector('#end');
let isHorizontal = true;

//go on top
window.addEventListener('beforeunload', function () {
    // Scroll to the top of the page
    window.scrollTo(0, 0);
});

// Create an Audio object with the specified MP3 file
var audio2 = new Audio("../../music/Game_of_Thrones.mp3");
// Event handler to play the audio when it can play through
audio2.oncanplaythrough = function(){
audio2.play();
}
// Set the audio to loop continuously
audio2.loop = true;
// Event handler to restart the audio when it ends
audio2.onended = function(){
audio2.play();
};

// Create Ships (Destroyer, Submarine, Cruiser, Battleship, Carrier).
function shipsName(name) {
  let selectShip;
  let X;
  let Y;
// Determine the type of ship based on the provided 'name'
  if (name === 'destroyer') {
    selectShip = document.querySelector('.destroyer-repo');
    X = [0, 1];
    Y = [0, width];
  } else if (name === 'submarine') {
    selectShip = document.querySelector('.submarine-repo');
    X = [0, 1, 2];
    Y = [0, width, width * 2];
  } else if (name === 'cruiser') {
    selectShip = document.querySelector('.cruiser-repo');
    X = [0, 1, 2];
    Y = [0, width, width * 2];
  } else if (name === 'battleship') {
    selectShip = document.querySelector('.battleship-repo');
    X = [0, 1, 2, 3];
    Y = [0, width, width * 2, width * 3];
  } else if (name === 'carrier') {
    selectShip = document.querySelector('.carrier-repo');
    X = [0, 1, 2, 3, 4];
    Y = [0, width, width * 2, width * 3, width * 4];
  }
// Methods of the ship object
function getName() {
    return name;
  }
  function getElement() {
    return selectShip;
  }
  function getDirections() {
    return [X, Y];
  }
// Return an object with methods
  return { getName, getElement, getDirections };
};

// Creating Game Board.
function createBoards(matrix, squares) {
  // Loop through each cell on the board
  for (let i = 0; i < width ** 2; i++) {
    // Create a div element for the square
    const square = document.createElement('div');
    // Set a unique identifier for the square using dataset
    square.dataset.id = i;
    // Append the square to the matrix
    matrix.appendChild(square);
    // Add the square to the squares array
    squares.push(square);
  }
};

const manSquares = [];
const robotSquares = [];
const manGrid = document.querySelector('.matrix-man');
const robotGrid = document.querySelector('.matrix-robot');
// Calling createBoards to initialize the game boards
createBoards(manGrid, manSquares);
createBoards(robotGrid, robotSquares);
// At this point, manSquares and robotSquares arrays contain the individual square elements
// manGrid and robotGrid have been populated with these squares

//All Ships:
const shipArray = [
  shipsName('destroyer'),
  shipsName('submarine'),
  shipsName('cruiser'),
  shipsName('battleship'),
  shipsName('carrier'),
  ].map(function(ship) {
    return {
      name: ship.getName(),
      directions: ship.getDirections(),
    };
  });

// Generate random location of robot's ships:
function generate(ship) {
 // Generate a random direction for the ship
  let randomDirection = Math.floor(Math.random() * ship.directions.length);//0 or 1
  let whereTo = ship.directions[randomDirection];
  let step;//step variable represents the step size or increment
  if (randomDirection === 0) step = 1;//horizontally
  if (randomDirection === 1) step = width;//vertically
// Generate a random starting position for the ship
  let randomStart = Math.abs(
    Math.floor(Math.random() * robotSquares.length - ship.directions[0].length * step)//considering the length of the ship and the step size (direction) to avoid placing the ship beyond the board boundaries
  );
  // Check if the intended location is taken or at the board edges
  const isTaken = whereTo.some(function(index) {
    return robotSquares[randomStart + index].classList.contains('taken');
  });
  const isAtRightEdge = whereTo.some(function(index) {
    return (randomStart + index) % width === width - 1;
  });
  const isAtLeftEdge = whereTo.some(function(index) {
    return (randomStart + index) % width === 0;
  });
 // If the location is available, place the ship; otherwise, try again
  if (!isTaken && !isAtLeftEdge && !isAtRightEdge) {
      whereTo.forEach(function(element) {
          robotSquares[randomStart + element].classList.add('taken', ship.name);
      });
  } else {
// Retry generating a location if the current one is not suitable
      generate(ship);
}
};

// Generate ships for the robot's side
generate(shipArray[0]);
generate(shipArray[1]);
generate(shipArray[2]);
generate(shipArray[3]);
generate(shipArray[4]);

// Rotate Your Ships:
function rotate() {
	  const ships = [destroyer, submarine, cruiser, battleship, carrier];
	  for (const ship of ships) {
		  // Toggle vertical classes for each ship element
	    ship.getElement().classList.toggle(`${ship.getName()}-repo-vertical`);
	  }
      // Toggle horizontal class on the displayGrid
	  displayGrid.classList.toggle('isHorizontal');
	  // Update the orientation variable
	  isHorizontal = !isHorizontal;
};
// Attach the rotate function to the click event of rotateButton
rotateButton.addEventListener('click', rotate);

// Drag & Drop Your Ships into Board:
//Event Listeners for Drag-and-Drop
ships.forEach(function(element) {
  element.addEventListener('dragstart', dragStart);
});
manSquares.forEach(function(square) {
  square.addEventListener('dragstart', dragStart);
  square.addEventListener('dragover', dragOver);
  square.addEventListener('dragenter', dragEnter);
  square.addEventListener('dragleave', dragLeave);
  square.addEventListener('drop', dragDrop);
  square.addEventListener('dragend', dragEnd);
});
let chosenShip;//Stores the id of the ship that is currently selected
ships.forEach(function(element) {
  element.addEventListener('mousedown', function(e) {
    chosenShip = e.target.id;
  });
});
let draggedShip;//Represents the ship being dragged
let draggedShipLength;//Stores the length of the dragged ship
//Drag Start Function (dragStart)
function dragStart(e) {
  draggedShip = this;//Sets the draggedShip variable to the current ship being dragged
  //Removes any text nodes within the dragged ship element
  for (let i = 0; i < draggedShip.childNodes.length; i++) {
    if (draggedShip.childNodes[i].nodeType === 3) {
      draggedShip.childNodes[i].parentNode.removeChild(draggedShip.childNodes[i]);
    }
  }
  //Logs the last child's id of the dragged ship
  console.log(draggedShip.lastChild.id);
  draggedShipLength = draggedShip.childNodes.length;
}
//Drag Over, Drag Enter, DragLeave Functions (dragOver, dragEnter, dragLeave)
//These functions prevent the default behavior of the drag events
function dragOver(e) {
  e.preventDefault();
}
function dragEnter(e) {
  e.preventDefault();
}
function dragLeave() {
  console.log('dragleave');
}
function dragDrop() {
  let lastId = draggedShip.lastChild.id;
  let shipClass = lastId.slice(0, -2);
  let shipIndex = parseInt(lastId.substr(-1));
  let shipLastId = shipIndex + parseInt(this.dataset.id);
  let chooseShip = parseInt(chosenShip.substr(-1));
  shipLastId = shipLastId - chooseShip;
  // Check if any square the ship will cover is already taken
  const isTaken = draggedShipLength > 1 && manSquares[shipLastId].classList.contains('taken');
  if (isTaken) return;
  // Horizontal Forbidden Positions
  const forbiddenHorizontal = [
    9, 19, 29, 39, 49, 59, 69, 79, 89, 99,
    0, 10, 20, 30, 40, 50, 60, 70, 80, 90
  ];

  // Vertical Forbidden Positions
  const forbiddenVertical = [
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9
];
  let forForbiddenHorizontal = forbiddenHorizontal.splice(0, 10 * shipIndex);
  let forForbiddenVertical = forbiddenVertical.splice(0, 10 * shipIndex);
  if (isHorizontal && !forForbiddenHorizontal.includes(shipLastId)) {
    for (let i = 0; i < draggedShipLength; i++) {
      // Check if the square is already taken
      const isSquareTaken = manSquares[shipLastId + i].classList.contains('taken');
      if (isSquareTaken) return;
      manSquares[shipLastId - chooseShip + i].classList.add('taken', shipClass);
    }
  } else if (!isHorizontal && !forForbiddenVertical.includes(shipLastId)) {
    for (let i = 0; i < draggedShipLength; i++) {
      // Check if the square is already taken
      const isSquareTaken = manSquares[shipLastId + width * i].classList.contains('taken');
      if (isSquareTaken) return;
      manSquares[shipLastId - chooseShip + width * i].classList.add('taken', shipClass);
    }
  } else {
    return;
  }
  //Removes the dragged ship from the display grid once placed
  displayGrid.removeChild(draggedShip);
  if (displayGrid.childNodes.length === 6) {
    displayGrid.remove();
    document.querySelector('.hidden_mess').remove();
    playGame();
  } else {
    turnDisplay.innerHTML = 'Place your ships!';
  }
}
//Logs 'drag end' to the console when the drag operation ends
function dragEnd() {
  console.log('dragend');
}

let currentPlayer = 'man';
// Play Game Function:
function playGame() {
  if (currentPlayer === 'man') {
    turnDisplay.innerHTML = "Your Captain's Turn";
    robotSquares.forEach(function(square) {
      square.addEventListener('click', function() {
        revealSquare(square);
      });
    });
  } else if (currentPlayer === 'robot') {
    turnDisplay.innerHTML = "Enemy's Turn";
    setTimeout(robotGo, 300);
  }
}
let destroyerCount = 0;
let submarineCount = 0;
let cruiserCount = 0;
let battleshipCount = 0;
let carrierCount = 0;
function revealSquare(square) {
	// Checking if the Square is Not Struck
  if (!square.classList.contains('strike')) {
	// Incrementing Counts Based on Ship Classes
    if (square.classList.contains('destroyer')) destroyerCount++;
    if (square.classList.contains('submarine')) submarineCount++;
    if (square.classList.contains('cruiser')) cruiserCount++;
    if (square.classList.contains('battleship')) battleshipCount++;
    if (square.classList.contains('carrier')) carrierCount++;
    // After updating counts, check for a win condition
    checkForWin();
  }
  //Handling Struck or Missed Squares
  if (square.classList.contains('strike') || square.classList.contains('miss')) {
    return;
  } else {
	 //Visualizing the Result on the Board
    if (square.classList.contains('taken')) {
      const fondo = document.createElement('i');
      fondo.classList.add('fas', 'fa-circle');
      square.appendChild(fondo);
      square.classList.add('strike');
    } else {
      const fondo = document.createElement('i');
      fondo.classList.add('fas', 'fa-circle');
      square.appendChild(fondo);
      square.classList.add('miss');
    }
  }
  //Switching to Robot's Turn
  currentPlayer = 'robot';
  playGame();
}
let roboDestroyerCount = 0;
let roboSubmarineCount = 0;
let roboCruiserCount = 0;
let roboBattleshipCount = 0;
let roboCarrierCount = 0;
function robotGo() {
	//Random Square Selection
  let random = Math.floor(Math.random() * manSquares.length);
   //Checking if the Selected Square is not Struck
  if (!manSquares[random].classList.contains('strike')) {
	//Incrementing Counts and Checking for Win
    if (manSquares[random].classList.contains('destroyer')) roboDestroyerCount++;
    if (manSquares[random].classList.contains('submarine')) roboSubmarineCount++;
    if (manSquares[random].classList.contains('cruiser')) roboCruiserCount++;
    if (manSquares[random].classList.contains('battleship')) roboBattleshipCount++;
    if (manSquares[random].classList.contains('carrier')) roboCarrierCount++;
    checkForWin();
  }
  //Handling Struck or Missed Squares
  if (manSquares[random].classList.contains('strike') || manSquares[random].classList.contains('miss')) {
    robotGo();
  } else {
    if (manSquares[random].classList.contains('taken')) {
      const fondo = document.createElement('i');
      fondo.classList.add('fas', 'fa-circle');
      manSquares[random].appendChild(fondo);
      manSquares[random].classList.add('strike');
    } else {
      const fondo = document.createElement('i');
      fondo.classList.add('fas', 'fa-circle');
      manSquares[random].appendChild(fondo);
      manSquares[random].classList.add('miss');
    }
  }
  currentPlayer = 'man';
  turnDisplay.innerHTML = 'Your Captain\'s Turn';
}

//checks what has been sunk, announces it and the winner
function checkForWin() {
  // your captain's sunk announcements
  if (destroyerCount === 2) {
    updateMessageDisplay("You sunk enemy's Destroyer");
    destroyerCount = -1;
  } else if (submarineCount === 3) {
    updateMessageDisplay("You sunk enemy's Submarine");
    submarineCount = -1;
  } else if (cruiserCount === 3) {
    updateMessageDisplay("You sunk enemy's Cruiser");
    cruiserCount = -1;
  } else if (battleshipCount === 4) {
    updateMessageDisplay("You sunk enemy's Battleship");
    battleshipCount = -1;
  } else if (carrierCount === 5) {
    updateMessageDisplay("You sunk enemy's Carrier");
    carrierCount = -1;
  }
//robot's sunk announcements
 if (roboDestroyerCount === 2) {
  updateMessageDisplay('The enemy sunk your Destroyer');
  roboDestroyerCount = -1;
} else if (roboSubmarineCount === 3) {
  updateMessageDisplay('The enemy sunk your Submarine');
  roboSubmarineCount = -1;
} else if (roboCruiserCount === 3) {
  updateMessageDisplay('The enemy sunk your Cruiser');
  roboCruiserCount = -1;
} else if (roboBattleshipCount === 4) {
  updateMessageDisplay('The enemy sunk your Battleship');
  roboBattleshipCount = -1;
} else if (roboCarrierCount === 5) {
  updateMessageDisplay('The enemy sunk your Carrier');
  roboCarrierCount = -1;
}
function updateMessageDisplay(message) {
  messageDisplay.innerHTML = message;
  setTimeout(function() {
    messageDisplay.innerHTML = '';
  }, 1500);
}
  // Check if all ships are sunk for the captain
  let captainWins = true;
  if (destroyerCount !== -1 || submarineCount !== -1 || cruiserCount !== -1 || battleshipCount !== -1 || carrierCount !== -1) {
    captainWins = false;
  }

  // Check if all ships are sunk for the enemy
  let roboWins = true;
  if (roboDestroyerCount !== -1 || roboSubmarineCount !== -1 || roboCruiserCount !== -1 || roboBattleshipCount !== -1 || roboCarrierCount !== -1) {
    roboWins = false;
  }
  //announcement of the winner
  if (captainWins) {
    endGame('Your Captain Wins!');
  } else if (roboWins) {
    endGame('Enemy Wins!');
  }
}
function endGame(message) {
  turnDisplay.remove();
  messageDisplay.innerHTML = '';
  endOfBattle.classList.remove('conceal');
  endOfBattle.classList.add('whoWon');
  winner.innerText = message;
}






