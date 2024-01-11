<?php

class BattleshipGame
{
    private $player1Board;
    private $player2Board;

    public function __construct()
    {
        $this->player1Board = $this->initializeBoard('cap1');
        $this->player2Board = $this->initializeBoard('cap2');
    }

    private function initializeBoard($player)
    {
        $board = array();

        
        $sql = "SELECT map, ship FROM boards WHERE player = ?";
       

        return $board;
    }

    public function makeMove($player, $target)
    {
        $opponentBoard = ($player == 'cap1') ? $this->player2Board : $this->player1Board;

        // Check if the move is a hit or miss
        $status = $opponentBoard[$target]['status'];
        if ($status == 'ship') {
            // It's a hit
            $opponentBoard[$target]['status'] = 'strike';
            return 'hit';
        } elseif ($status == 'clear') {
            // It's a miss
            $opponentBoard[$target]['status'] = 'miss';
            return 'miss';
        } else {
            // The target has already been hit or missed
            return 'already_taken';
        }
    }

    public function getGameStatus()
    {
        // Check if all ships are sunk for both players
        if ($this->allShipsSunk('cap1')) {
            return 'Player cap2 wins!';
        } elseif ($this->allShipsSunk('cap2')) {
            return 'Player cap1 wins!';
        } else {
            return 'Game in progress';
        }
    }

    private function allShipsSunk($player)
    {
        $board = ($player == 'cap1') ? $this->player1Board : $this->player2Board;

        foreach ($board as $cell) {
            if ($cell['status'] == 'ship') {
                return false; // At least one ship is still afloat
            }
        }

        return true; // All ships are sunk
    }
}


$game = new BattleshipGame();


$moveResult = $game->makeMove('cap1', 'I1');

// Check the game status
$gameStatus = $game->getGameStatus();

// Return the result and status to the player interface
$resultAndStatus = array('result' => $moveResult, 'status' => $gameStatus);

// Convert to JSON and send to the player interface
echo json_encode($resultAndStatus);
?>
