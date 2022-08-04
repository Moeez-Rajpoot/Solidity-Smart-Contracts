// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.4;
contract RoomReservation {

    //events
    //modifiers
    //functions
    //payment transfer
    

    enum Status {Occupied,Vacant}
    Status public CurrentStatus;
    event Occupy(address Occupant,uint value);
    address payable Owner;


    constructor() {
        Owner=msg.sender;
        CurrentStatus=Status.Vacant;
    }

    function CheckOwner() public view returns (bool) {

        if (Owner==msg.sender)
            return true;
        else
            return false;
    }
    modifier statuses {
      require(CurrentStatus == Status.Vacant,"ROOM OOCUPIED");
      _;
    }
    modifier PriceCheck(uint _value) {
        require(msg.value >=_value,"No enough payment");
            _;
    }


    function BookRoom ()public payable statuses PriceCheck(2 ether){
        CurrentStatus=Status.Occupied;
        (bool sent, bytes memory _data)= Owner.call{value: msg.value}("Hi");
        require(sent);
        emit Occupy(msg.sender,msg.value);
    }


}