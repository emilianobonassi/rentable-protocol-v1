pragma solidity ^0.8.11;

contract EmergencyImplementation {
    fallback () payable external {
        revert('Emergency in place');
    }
}