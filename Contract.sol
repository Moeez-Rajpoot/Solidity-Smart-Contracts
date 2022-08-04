// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.15;

contract Mycontract {
    uint public Uint_var;
    string public Mystring;
    address public Address;


    struct MyStruct {
        uint Suint;
        string Sstring;
    }

    MyStruct public Obj;

    function setstruct() public{

    Obj.Suint=1;
    Obj.Sstring="MRX";
    }



    function String(string memory value) public{
        Mystring=value;
    }

    function Number(uint value) public{
        Uint_var=value;
        
    }
    
    function SetAddress(address value) public{
       Address=value;
    }

    function GetAddress() public view returns (uint) {
         return Address.balance;
    }

    function getvalue() public pure returns (uint)   //pure functions means it doesnt modify or read from state variable
    {
        uint value;
        return value;
    }
 
}
