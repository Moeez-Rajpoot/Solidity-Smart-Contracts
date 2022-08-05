// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.4;

contract Owner {
    address owner;
    
    constructor() {
        owner=msg.sender;
    }

    modifier CheckOwner {
        require(owner==msg.sender,"You are Not Owner");
        _;
    }
}
contract SecertVault {

    string secert;
    address OwnerAddress;
    string date;

    constructor(string memory A,string memory C)
    {
            secert=A;
            OwnerAddress=msg.sender;
            date=C;

    }

    function getdata() public view returns (string memory,address,string memory) {
        return(secert,OwnerAddress,date);
    }
}


contract MultiContract is Owner {
    address obj;

    constructor(string memory Secret, string memory Date)
    {
        super;
        SecertVault _vault = new SecertVault(Secret,Date);
        obj=address(_vault);
    }

    function Get_Secrets() public  view CheckOwner  returns (string memory,address,string memory) {
         return SecertVault(obj).getdata();
    }


   
}

