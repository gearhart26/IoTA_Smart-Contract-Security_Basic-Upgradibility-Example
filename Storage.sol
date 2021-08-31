    pragma solidity 0.5.1;

        //non-upgradable portion that serves as storage for the proxy and functional contracts
    contract Storage {
        uint256 number;

            //function to check number
        function getNumber() internal view returns (uint){
        return number;
        }

            //function to set number
        function setNumber(uint256 _number) internal{
        number = _number;
        }
    }
