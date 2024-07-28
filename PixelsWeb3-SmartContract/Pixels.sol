// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC721/extensions/ERC721Burnable.sol";

/// @custom:security-contact sekocan1903@icloud.com
contract Pixels is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Pausable, Ownable, ERC721Burnable {
    uint256 private _nextTokenId;

    uint256 public constant MAX_SUPPLY = 1000000; // Toplam piksel sayısı
    uint256 public constant PRICE = 0.01 ether; // Her pikselin fiyatı

    mapping(uint256 => address) public pixelOwners;
    mapping(uint256 => string) public pixelContent;
    mapping(uint256 => bool) public isPixelForSale;
    mapping(uint256 => uint256) public pixelPrices;

    event PixelContentUpdated(uint256 indexed tokenId, string newContent);
    event PixelForSale(uint256 indexed tokenId, uint256 price);
    event PixelSold(uint256 indexed tokenId, address from, address to, uint256 price);

    constructor(address initialOwner)
        ERC721("Pixels", "PXL")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://clayed.online/";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mintPixel() public payable {
        require(msg.value >= PRICE, "Insufficient payment");
        require(_nextTokenId < MAX_SUPPLY, "Max supply reached");
        
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        pixelOwners[tokenId] = msg.sender;
    }

    function updatePixelContent(uint256 tokenId, string memory newContent) public {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        pixelContent[tokenId] = newContent;
        emit PixelContentUpdated(tokenId, newContent);
    }

    function setPixelForSale(uint256 tokenId, uint256 price) public {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        isPixelForSale[tokenId] = true;
        pixelPrices[tokenId] = price;
        emit PixelForSale(tokenId, price);
    }

    function buyPixel(uint256 tokenId) public payable {
        require(isPixelForSale[tokenId], "Pixel not for sale");
        require(msg.value >= pixelPrices[tokenId], "Insufficient payment");
        
        address seller = ownerOf(tokenId);
        _transfer(seller, msg.sender, tokenId);
        pixelOwners[tokenId] = msg.sender;
        isPixelForSale[tokenId] = false;
        
        payable(seller).transfer(msg.value);
        emit PixelSold(tokenId, seller, msg.sender, msg.value);
    }

    function withdrawBalance() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}