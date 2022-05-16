// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;
    mapping(address=>uint) balances;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw(uint _amount) external {
        // require(msg.sender == owner, "caller is not owner");
        require(balances[msg.sender]>=_amount,"insufficient funds");
        balances[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
