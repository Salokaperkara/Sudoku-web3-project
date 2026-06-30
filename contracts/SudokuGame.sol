// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SudokuGame {
    struct Score {
        uint256 completionTime;
        uint256 timestamp;
    }

    mapping(address => Score[]) private playerScores;

    event ScoreSubmitted(
        address indexed player,
        uint256 completionTime,
        uint256 timestamp
    );

    function submitScore(uint256 completionTime) external {
        require(completionTime > 0, "Invalid completion time");

        playerScores[msg.sender].push(
            Score({
                completionTime: completionTime,
                timestamp: block.timestamp
            })
        );

        emit ScoreSubmitted(
            msg.sender,
            completionTime,
            block.timestamp
        );
    }

    function getScores(address player)
        external
        view
        returns (Score[] memory)
    {
        return playerScores[player];
    }

    function getLatestScore(address player)
        external
        view
        returns (uint256 completionTime, uint256 timestamp)
    {
        require(playerScores[player].length > 0, "No scores found");

        Score memory latest =
            playerScores[player][playerScores[player].length - 1];

        return (
            latest.completionTime,
            latest.timestamp
        );
    }
}
