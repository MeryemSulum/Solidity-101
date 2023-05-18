# Solidity-101
---------------------
## Solidity Learning
```
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
## Functions
In Solidity, functions are a way to encapsulate and execute a set of instructions. Functions in Solidity can be used to modify the state of the contract, return values, emit events, and more.


* Function Name: The name  of the function, which must be unique within the contract.

* Input Parameters: Zero or more input parameters, which are used to pass data to the function.

* Output Parameters: Zero or more output parameters, which are used to return the data from the function.

* Function Visibility: The visibility of the function, which determines whether the function can be called from the outside the contract. The four visibility modifiers in Solidity are public, private, internal and external.

* Function Type: The type of the function, which determines whether the function can modify the state of the contract. There are two types of functions in Solidity: view functions, which do not modify (read only) the state of the contract, and pure functions, which do not read from or modify the state of the contract.

* Function Body: The set of instructions that are executed when the functions is called.

```
function functionName( inputParameterType, inputParameterName, ...) visibilityFunctionType returnType {
      function body
 }
 ```
* returnType: The data type of the output value of the function.

* visibilityFunctionType:  The visibility and the state-modifying properties of the function, which determines whether the function can be called from outside the contract and whether it can modify the state of the contract. The four visibility modifiers in Solidity are public, private, external, internal, while the state-modifying property is specified by the keywords view or pure.

### View Functions
A view function is a function that does not modify the state of the contract.

A view functions are read-only functions that can be called without any gas cost, since they do not change the state of the blockchain.

The purpose of a view function is to provide read-only access to the state of the contract. For example, a view function might return the balance of an account or the value of a specific state variable.

```
contract Mycontract {
    uint256 public myStateVariable;
    
    function getMyStateVariable() public view returns (uint256) {
        return myStateVariable;
    }
  }
  ```
  ### Pure Functions
  A pure function is a function that does not read from or modify the state of the contract.
  
  Pure functions are used to perform calculations or transformations on data, and do not interact with the blockcahin in any way.
  
  Pure functions are similar to view functions, but are even more restricted in terms of what they can do.
  
  ```
  function add(uint256 a, uint256 b) public pure returns(uint256) {
    return a + b;
  }
  ```
  ### Getter Functions
  In Solidity, when a state variable is defined as public, the compiler automatically generates a corresponding getter function with the same name as the variable.
  
  The generated function has external visibility and  can be used to retrieve the current value of the variable from external clients.
  
  By automatically generating the getter function for public state variables, Solidity simplifies the process of providing external access to the state of a contract. This allows external clients to easily retrieve the current value of a public state variable, without having to define and call their own getter functions.
  
  ```
  contract MyContract{
    uint256 public myPublicVariable;
    
    function setValue(uint256 newValue) public{
        myPublicVariable = newValue; 
    }
  }
```
  




