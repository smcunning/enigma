# Enigma
<img src="https://i.ibb.co/wdn4yRv/encrypting.gif" alt="encrypting">

## Table of Contents
- [Overview](#overview)
- [Design Strategy](#design-strategy)
  - [Enigma](#enigma-class)
  - [Encryptor](#encryptor-class)
  - [Decryptor](#decryptor-class)
  - [Shiftable](#shiftable-module)
  - [CLI](#cli)
- [Self-Assessment](#self-assessment)
  - [Functionality](#functionality)
  - [Object Oriented Programming](#object-oriented-programming)
  - [Ruby Conventions and Mechanics](#ruby-conventions-and-mechanics)
  - [Test Driven Development](#test-driven-development)
  - [Version Control](#version-control)

***
## Overview
Enigma is inspired by Alan Turing, the mathematician who cracked the Enigma code. Enigma was a type of enciphering machine used by the German armed forces to send secure messages. While this project's scope is much smaller, it is capable of encrypting a text message by reading in the `message.txt` file and writing the encrypted message into the `encrypted.txt` file. This progam also decrypts the same `encrypted.txt` file and writes to a `decrypted.txt` file through the command interface. *Unfortunately, no Nazis were harmed in the making of Enigma.*

***
## Design Strategy
The design strategy of Engima was to fully encapsulate each piece of functionality of the progam and use a module for the shift generation functionality, including key generation and today's date generation. The program uses this structure:
<img src="https://i.ibb.co/wycyYsH/Enigma.png" alt="Enigma">

### Enigma Class
The Enigma Class is responsible for creating the Encryptor and Decryptor objects, which process the actual encryption and decryption of the message and ciphertext. This Class holds the message, key (generated, or provided) and date (today's date, or provided) as attributes, which it passes into the encryptor/decryptor objects. This is the Class utilized in the runner files for encrypt and decrypt.

### Encryptor Class
The Encryptor Class takes the data passed on from the Enigma Class and is responsible for the specific methods which actually encrypt the message. It utilizes the methods from the Shiftable Module to generate the shifts based on the key and date provided through the Enigma Class.

### Decryptor Class
The Decryptor Class is similar to the Encryptor Class. It takes the data passed on from the Enigma Class and is responsible for the specific methods which decrypt the cipher text the Encryptor generates. It utilizes the methods from the Shiftable Module to generate the shifts based on the key and date provided through the Enigma Class.

### Shiftable Module
Shiftable contains all of the necessary methods which utilize the key and date to set the key shifts, offset shifts and total shifts. This module is used as a mixin in Enigma, Encryptor and Decryptor.

### CLI
The command line interface works through the `encrypt.rb` and `decrypt.rb ` files. The files handle reading in the message, or encrypted files, respectfully, and writing the encrypted or decrypted text into a new file. It also outputs a message to the screen.

***
## Self-Assessment
### Functionality
For my project, the Enigma Class includes encrypt and decrypt methods and perform as expected. The encrypt/decrypt CLIs are both outputting to the screen as expected as well. Unfortunately, didn't make it to the cracking method! My assessment here would be a **3**

### Object Oriented Programming
The structure of the classes in my project are all encapsulated and have a single responsiblity. The Enigma class specifically handles creating the encryptor/decryptor objects to run the encrypt/decrypt methods on. The Encrypt/Decryptor class manage actually transcribing the messages. Finally the Shiftable module manages the shift generation methods. Overall I'm happy with the organization of the code. I considered further breaking out the shift, key and offets into their own classes, but since they are so entertwined in what they do, felt Shiftable works for this purpose. I would assess this piece as a **4**

### Ruby Conventions and Mechanics
My program does have conventional syntax and naming structures. I would say that the majority of the enumerables utilized are the most efficient for what I'm using them for. I've utilized several hashes in letter shifting. I do have one or two methods over 10 lines. My assessment for conventions/mechanics is a **3.5**

### Test Driven Development
I fully adhered to TDD throughout the project. It actually helped a ton when I was stuck with something! I've used mocks and stubs for random generated pieces of code and for generating todays date. I've tested every line of code and have 100% coverage. My assessment is **4**

### Version Control
My version control for this program was pretty strong! I have over 130 commits and over 12 pull requests. Going back through my git history, the commit messages are well documented and include specific pieces of functionality. My assessment for this vector is **4**.

<img src="https://i.ibb.co/V0y6yTb/catkey.gif" alt="catkey">
