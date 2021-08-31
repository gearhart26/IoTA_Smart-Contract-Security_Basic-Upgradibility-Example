pragma solidity 0.5.1;

import "./Storage.sol";

    //functional contract that contains all of the functionality we want in our system
    //where our proxy contract directs traffic to and can be replaced for updates as needed
        
    //set and store number of dogs on the storage contract and check number of dogs stored on storage contract
contract Dogs is Storage {

        //check number of dogs stored on storage contract
    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }

        //set number of dogs and store number on the storage contract
    function setNumberOfDogs(uint256 toSet) public {
        Storage.setNumber(toSet);
    }
}
