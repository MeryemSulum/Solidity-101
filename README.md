# Solidity-101
Solidity Learning
```sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.18.18;

contract ProposalContract{
    //Data

        //Owner 
    address owner;
    
        //Teklif yapımız
    struct Proposal{
        string description;
        uint256 approve; //pozitip tamsayı-unsigned integer sayı kapasitesi için açılan hafıza yeri 256 bit pozitif tamsayı
                //unsigned integer = uint. Normalde sign yani işaret için 1 bit feda ediyorduk, 
                //işaretsiz yani pozitif olduğunu belirtince 1 bit kazanmış olduk. O 1 bit de kapasitemizi 2'ye katlıyor.
        uint256 reject;
        uint256 pass;
        uint256 total_vote_to_end;
        bool current_state;//  geçti mi kaldı mı onaylandı mı onaylanmadı mı
        bool is_active; //projenin işi bitti mi yoksa active hala üstünde çalışılan proje mi
    }

    //mapping  ---> proposal historysini tutmak için
    mapping (uint256 => Proposal) proposal_history;
           // (1.prosal--description:...)gibi
    //array, oy verenleri tutmak için---- herkesin bir oy hakkı var oy verenleri tutmak için 
    address[] private voted_addresses;

    constructor(){
        owner = msg.sender; //contractı oluşturan kişiyi belirtir. owner ile yapan aynı dedik burada
        voted_addresses.push(msg.sender); //oylamayı açan oy veremesin
    }

    modifier onlyOwner(){
        require(msg.sender == owner); //zorunluluk şartları
        ...; //fonksiyona devam et
    }

    //Execute Functions

    function setOwner(address new_owner) external onlyOwner{
        owner = new_owner;
    }

    

    //Query Functions 


}
```
