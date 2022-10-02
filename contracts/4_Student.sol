// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Student_ {

    struct Student {
        bytes32 studentId;
        string name;
        uint256 age;
    }

    mapping(bytes32 => Student) public idToStudent;

    function createStudent(string memory _name, uint256 _age) public {
        Student memory student;
        bytes32 studentId = keccak256(
            abi.encodePacked(
                msg.sender,
                address(this),
                _name,
                _age
            )
        );
        student.studentId = studentId;
        student.name = _name;
        student.age = _age;
        idToStudent[studentId] = student;
    }

    function getStudent(bytes32 _studentId) public view returns (Student memory){
        //  get student
        Student storage student = idToStudent[_studentId];
        return student;
    }



}