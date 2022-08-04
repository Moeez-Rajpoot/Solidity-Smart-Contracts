// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.4;
contract Maps {

   //simple mapping setter and getter
    mapping (uint => string) public oneBooks;     //declare and getter function

    function onesetbooks(uint id,string memory Booknam) public{

        oneBooks[id] = Booknam;
        
    }

    mapping (address => mapping (uint => string)) public oneBook_Collections;  //dec and getter function

    function oneset_Col(uint id,string memory Booknam) public {
        oneBook_Collections[msg.sender][id] = Booknam;
    }

    struct Details {
        string name;
        string author;
        string release;
    }

        mapping (uint => Details) public Books;     //declare and getter function

    function setbooks(uint id,string memory name,string memory author,string memory release) public{

        Books[id] = Details(name,author,release);
        
    }

    mapping (address => mapping (uint => Details)) public Book_Collections;  //dec and getter function

    function set_Col(uint id,string memory name,string memory author,string memory release) public {
        Book_Collections[msg.sender][id] = Details(name,author,release);
    }








}