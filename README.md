# Haskell Snake
## CPSC 312 - Haskell Project
Implementation of the classic game Snake in Haskell


GUI done with [gloss](https://hackage.haskell.org/package/gloss)

### How to Run:
```console
cabal install
ghci snake.hs
make
```
### What did we learn from this?
Developing a game within a language that is not object oriented presents some challenges, 
but the unique simplicity of functional programming makes the higher level design of games 
such as snake easier to grasp. However, we did have some trouble because of the fact that 
Haskell is a strongly-typed language. Specifically, we started by making the base game 
before creating a GUI, and had set most of our data types to work with Ints. However, 
certain builtin functions that we used required floats, while others required ints, 
thus we had to do a lot of "casting" in order to make things work. 

We also struggled 
with making the random number generator to create new food locations for the food as a 
result of this. Our first version of the generator only created Coords that had a positive 
x,y, so we had to change it to use randomRIO to generate negative coordinates. This 
resulted in a lot of refactoring of our program to support this.
