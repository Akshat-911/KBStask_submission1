pragma solidity ^0.8.0;

contract Mycontract {
    uint256 constant min_USD = 50; // only for this example

    address[] public adrs;
    mapping(address => uint256) public address_amount_funded; //map to store the value funded by each funder
    
    function fund() public payable {
        require(msg.value.getConversionRate() >= min_USD, "More etherium required for funding");
        //snippet for (a) part of the task
        if(check(msg.sender) == 0) {
            adrs.push(msg.sender);
        }
         address_amount_funded[msg.sender] += msg.value; // Increment the funding amount for the sender irrespective of the uniqueness.

    }
    
    function check(address _addr) internal view returns (uint256) { //function to check if a address is added.
        for (uint256 i = 0; i < adrs.length; i++) {
            if (adrs[i] == _addr) {
                return 1;
                break;
            }
        }
        return 0;
    }
    //snippet for the b part of the task.
    constructor()
    {
        c_owner=msg.sender //sets the current deployer of the contract as the intial owner.
    }
    modifier check_owner()
    {
        if(msg.sender!=c_owner)
        {
            revert("Only the owner can transer the ownership"); //undo any changes did by this function
        }
    }
    function Transfer_Ownership(address New_Owner) public check_owner {
        c_owner = New_Owner;
    }
    }
    
    
    
}

