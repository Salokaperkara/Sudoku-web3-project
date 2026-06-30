// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SudokuNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    mapping(address => bool) public hasAchievement;

    constructor(address initialOwner)
        ERC721("Sudoku Achievement", "SDKNFT")
        Ownable(initialOwner)
    {}

    function awardAchievement(address player)
        external
        onlyOwner
    {
        require(!hasAchievement[player], "Achievement already awarded");

        uint256 tokenId = ++_nextTokenId;

        hasAchievement[player] = true;

        _safeMint(player, tokenId);
    }
}
