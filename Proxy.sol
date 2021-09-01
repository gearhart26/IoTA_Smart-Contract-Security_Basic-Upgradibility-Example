pragma solidity 0.5.1;

import "./Storage.sol";

    //Proxy contract that users interact with. Contract can never be replaced or updated without losing data that has been stored.
contract ProxyDog is Storage {

    address public currentAddress;

        //set functional contract address during contract creation
    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

        //redirecting proxy contract to a new updated version of the functional contract with a different address
    function upgrade(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

        //fowarding user request to functional contract to be executed, since the functions dont actually reside within the proxy contract
    function getNumberOfDogs() public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfDogs()"))));
        return (res, data);
    }
        
        //fowarding user input to functional contract to be set by the actual function
    function setNumberOfDogs(uint256 _number) public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfDogs(uint256)")), _number));
        return (res, data);
    }
}
