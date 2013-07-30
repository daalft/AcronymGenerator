# AcronymGenerator

## Summary
Just the other day, I was looking for an acronym generator. While what I found on the internet seemed promising, none
of the tools did exactly what I wanted. So I wrote my own little script.  
This code takes a list of words (technically speaking an array of arrays of strings) and generates all possible acronyms
according to the following rules:
* Take only the first **n** letters of each word
* Only retain acronyms with a total number of letters not exceeding **threshold**

The generated acronyms are not necessarily (in fact in most cases) not real, existing words. The acronyms might already
be in use by someone else, so check before setting on an acronym.

## Use
Require the ruby class in the executing class with <code>require 'AcroGen'</code> or `require './AcroGen'`.  
Create a new AcronymGenerator by calling i.e. `g = Acronyms::AcronymGenerator.new(arguments)`

The arguments are:
* An array (i.e. **[["Joyce","James", "Lucky"], ["New", "Wonderful"], ["Fashion", "Mode"]]**)
* The number of letters to use (n, i.e. 3)  

The number of letters to use is optional and defaults to _4_

The above example means: generate all possible acronyms starting with **up to** the first 3 letters of either _Joyce, James_ 
or _Lucky_ (J, Jo, Joy, Ja, Jam, L, Lu, Luc) <sub>Note: Please note that only unique letter combinations are used. Even though the letter _J_ would be generated twice,
once from _Joyce_ and once from _James_, only one _J_ is retained.</sub>,  
followed by **up to** the first 3 letters of _New_ or _Wonderful_ (New, Ne, N, Won, Wo, W),  
followed by **up to** the first 3 letters of _Fashion_ or _Mode_ (Fas, Fa, F, Mod, Mo, M)  


After the generator has been initialized, call `g.combine(arguments)`
The arguments are:
* Threshold: Retain only acronyms with less than or equal to this number of letters
* Name of output file  

Threshold is optional and defaults to _99_  

Name of output file is optional and defaults to _combination.txt_  
  
A file containing all acronyms is written. The name of the file is equal to the specified filename or the default value if 
no filename was specified.

## Words of caution
The generator generates _all_ possible combinations if no threshold is set. This _can_ be slow and resource-intensive.
You have been warned. 

## Notes
Use nouns and verbs and leave out prepositions and particles.

## Full usage example
If you don't know the Ruby programming language at all or are not sure how to use this program, here's a full example.  
* Download and install [Ruby](http://www.ruby-lang.org/en/) if you don't already have it
* (Make sure Ruby works from the command line. The following should work: ruby -v)
* Open a text editor (such as Notepad, Notepad++, anything really).  
* Enter the following: require './AcroGen'
* Save the file as **main.rb** (without any other extension! Set the extension to "all" before saving)
* Download the file **AcroGen** from the source folder in this repository or copy paste it into an empty file and save it as AcroGen.rb
* Go back to your main.rb file.
* Add the following (for example):
* `g = Acronyms::AcronymGenerator.new([["Germany", "France", "Belgium"],["Conference", "Meeting"],["Computational"],`
`["Linguistics"]], 3)` 
* `g.combine(8, "output.txt")`
* Save all files
* Open the command line
* Enter: ruby main.rb
* This should generate a file named "output.txt"
* Open this file with any text editor and marvel at the results
* Play with the parameters for different results
