// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract Chelpis is ERC721Connector{

    string[] public chelpisX;

    mapping(string => bool) _chelpisExists;

    function mint(string memory _chelpis)  public {
        
        require(!_chelpisExists[_chelpis]);
        chelpisX.push(_chelpis);
        uint _id = chelpisX.length - 1;   
        _mint(msg.sender, _id);
        _chelpisExists[_chelpis] = true;
    }

    constructor() ERC721Connector('Chelpis', 'CHELPIS'){
       
    }
}