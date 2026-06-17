// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title GlasanjeEkskurzija
 * @notice Pametni ugovor za glasanje o destinaciji ekskurzije.
 */
contract GlasanjeEkskurzija {

    address public owner;

    string[4] public destinacije;
    uint256[4] public rezultati;

    // Evidencija ko je već glasao
    mapping(address => bool) public jeGlasao;

    event GlasZabelezen(address birac, uint8 destinacijaID); 

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Samo vlasnik ugovora moze izvrsiti ovu akciju."
        );
        _;
    }

    constructor() {
        owner = msg.sender;

        destinacije[0] = "Prag";
        destinacije[1] = "Pariz";
        destinacije[2] = "Atina";
        destinacije[3] = "Rim";
    }

    /**
     * @dev Glasanje za destinaciju.
     * ID destinacija:
     * 0 - Prag
     * 1 - Pariz
     * 2 - Atina
     * 3 - Rim
     */
    function glasaj(uint8 destinacijaID) public {
        require(destinacijaID < 4, "Nevazeci ID destinacije.");
        require(
            !jeGlasao[msg.sender],
            "Vec ste iskoristili svoje pravo glasa."
        );

        rezultati[destinacijaID]++;
        jeGlasao[msg.sender] = true;

        emit GlasZabelezen(msg.sender, destinacijaID);
    }

    /**
     * @dev Vraća broj glasova za sve destinacije.
     */
    function dobijRezultate()
        public
        view
        returns (uint256[4] memory)
    {
        return rezultati;
    }

    /**
     * @dev Vraća sve destinacije.
     */
    function dobijDestinacije()
        public
        view
        returns (string[4] memory)
    {
        return destinacije;
    }

    /**
     * @dev Resetuje rezultate glasanja.
     * Napomena: informacije o tome ko je glasao ostaju sačuvane,
     * mapiranje se ne brise.
     */
    function resetujGlasanje() public onlyOwner {
        for (uint8 i = 0; i < 4; i++) {
            rezultati[i] = 0;
        }
    }
}
