// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint indexed tokenId);
    mapping(uint256 => address) private _tokenOwner;

    mapping(address => uint256) private _OwnedTokensCount;

    function balanceOf(address _owner) external view returns (uint256){
        require(_owner != address(0));   
        return _OwnedTokensCount[_owner];
    }

    function owenerOf(uint256 _tokenId) external view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0));
        return owner;
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual{
        //require address is not 0
        require(to != address(0), "ERC721 minting to a zero address");

        //requires that the token does not already exist
        require(!_exists(tokenId), 'ERC721 is already exist');

        _tokenOwner[tokenId] = to;
        _OwnedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}
