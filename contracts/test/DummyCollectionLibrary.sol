// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.11;

import "../collectionlibs/ICollectionLibrary.sol";
import "./EternalStorage.sol";

contract DummyCollectionLibrary is ICollectionLibrary {

    address internal immutable _eternalStorage;

    bytes32 constant public TOKEN_ADDRESS = 'tokenAddress';
    bytes32 constant public TOKEN_ID = 'tokenId';
    bytes32 constant public USER = 'user';
    bytes32 constant public MAX_TIME_DURATION = 'maxTimeDuration';
    bytes32 constant public DURATION = 'duration';
    bytes32 constant public PRICE_PER_BLOCK = 'pricePerBlock';
    bytes32 constant public FROM = 'from';
    bytes32 constant public TO = 'to';
    bytes32 constant public LEASE_ID = 'leaseId';
    bytes32 constant public RENTED = 'rented';


    constructor(address eternalStorage){
        _eternalStorage = eternalStorage;
    }

    function postDeposit(address tokenAddress, uint256 tokenId, address user) external {
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setAddressValue(USER, user);
    }

    function postList(address tokenAddress, uint256 tokenId, address user, uint256 maxTimeDuration, uint256 pricePerBlock) external {
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setAddressValue(USER, user);
        EternalStorage(_eternalStorage).setUIntValue(MAX_TIME_DURATION, maxTimeDuration);
        EternalStorage(_eternalStorage).setUIntValue(PRICE_PER_BLOCK, pricePerBlock);
    }

    function postCreateRent(uint256 leaseId, address tokenAddress, uint256 tokenId, uint256 duration, address from, address to) external payable {
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(LEASE_ID, leaseId);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setUIntValue(DURATION, duration);
        EternalStorage(_eternalStorage).setAddressValue(FROM, from);
        EternalStorage(_eternalStorage).setAddressValue(TO, to);
    }
    function postExpireRent(uint256 leaseId, address tokenAddress, uint256 tokenId, address from, address to) external {
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(LEASE_ID, leaseId);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setAddressValue(FROM, from);
        EternalStorage(_eternalStorage).setAddressValue(TO, to);
    }
    function postWTokenTransfer(address tokenAddress, uint256 tokenId, address from, address to) external{
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setAddressValue(FROM, from);
        EternalStorage(_eternalStorage).setAddressValue(TO, to);
    }
    function postOTokenTransfer(address tokenAddress, uint256 tokenId, address from, address to, bool rented) external{
        EternalStorage(_eternalStorage).setAddressValue(TOKEN_ADDRESS, tokenAddress);
        EternalStorage(_eternalStorage).setUIntValue(TOKEN_ID, tokenId);
        EternalStorage(_eternalStorage).setAddressValue(FROM, from);
        EternalStorage(_eternalStorage).setAddressValue(TO, to);   
        EternalStorage(_eternalStorage).setBooleanValue(RENTED, rented);
    }
}