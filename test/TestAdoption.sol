pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // An user can adopt a pet
    function testUserCanAdopt () public {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    // The adopter changes upon adoption
    function testGetAdopterAddressByPetId () public {
        address adopter = adoption.adopters(8);
        address expected = this;

        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    // The adopters array get updated upon adoption
    function testGetAdopterAddressByPetIdInArray () public {
        address[16] memory adopters = adoption.getAdopters();
        address expected = this;

        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }
}
