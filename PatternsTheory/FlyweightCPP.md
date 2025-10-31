# Tree Pattern
Sending complete objects to process is some that takes too much processing time, so we break our trees between common components and specific components from each tree. 

The Flyweight pattern is purely about efficiency.

Example:

``` cpp
// This here is the full tree, sending this completly thousand of times takes too much time and processegin capacity
class Tree {
    private:
        Mesh mesh_;
        Texture bark_;
        Texture leaves_;
        Vector position_;
        double height_;
        double thickness_;
        Color barkTint_;
        Color leafTint_;
}
```

``` cpp
// Common atributes for every tree
class TreeModel {
    private: 
        Mesh mesh_;
        Texture bark_;
        Texture leaves_;
}

// Specefic atributes for each tree + the common ones
class Tree {
    private:
        TreeModel* model_; // It stores a pointer to the model
        
        Vector position_;
        double height_;
        double thickness_;
        Color barkTint_;
        Color leafTint_;
}
```

This minimizes the amount of data we have to push to the GPU, since we can send the shared data (TreeModel) just once. This significantly reduces the amount of time and processing required to render all the trees of our game.

Flyweight, comes into play when you have objects that need to be more lightweight, generally because you have *too many of them*. 

The pattern solves that by separating out an object’s data into two kinds. The first kind of data is the stuff that’s not specific to a single instance of that object and can be shared across all of them. The Gang of Four calls this the intrinsic state, Nystrom calls it the “context-free” stuff, I like to call them "general-stuff". In the example here, this is the geometry and textures for the tree.

The rest of the data is the extrinsic state, the stuff that is unique to that instance - "specific-stuff". In this case, that is each tree’s position, scale, and color. Just like in the chunk of sample code up there, this pattern saves memory by sharing one copy of the intrinsic state across every place where an object appears.

```cpp 
enum Terrain {
    TERRAIN_GRASS;
    TERRAIN_HILL;
    TERRAIN_RIVER
    // ...
}

class World {
    private:
        Terrain tiles_[WIDTH][HEIGHT];
    
    public:
        int getMovementCost(int x, int y) {
            switch (tiles_[x][y]) {
                case TERRAIN_GRASS: return 1;
                case TERRAIN_HILL: return 2; 
                case TERRAIN_RIVER: return 3;
                // ...
            }
        }

        bool isWater(int x, int y) {
            switch (tiles_[x][y]) {
                case TERRAIN_GRASS: return false;
                case TERRAIN_HILL:  return false;
                case TERRAIN_RIVER: return true;
                // ...
            }
        }
}
```

This is not cool, the way it's working, `World` will manage all kinds of analyisis of terrain, every information about the terrain will have to pass through it. So the best option is to make terrain an class itself.

```cpp
class Texture {
    // Texture definition ... 
}

class Terrain {

    private:
        int movementCost_;
        bool isWater_;
        Texture texture_;

    public:
        Terrain(int movementCost, bool isWater, Texture texture): movementCost_(movementCost), isWater_(isWater), texture_(texture) {}

        int getMovementCost() const { return movementCost_; }
        bool isWater() const { return isWater_; }
        const Texture& getTexture() const { return texture_; } 
}

class World {
    private:
        Terrain* tiles_[WIDTH][HEIGHT]

        // We save the terrains here because we won't need to track the life cycle of each type of terrain
        // When the game world is over, the terrains are terminated. This is easier to track than analysing 
        // Each part of the game that needs terrains is over or not.
        Terrain grassTerrain_; 
        Terrain hillTerrain_;
        Terrain riverTerrain_;  
    
    public: 
        const Terrain& getTitle(int x, int y) {
            return *tiles_[x][y]
        }
    // ...
}
```


No you can see that `World` don't need to be responsible for so much information about terrains, it only holds the terrains the world has. Also for the matrix `tiles_`, if it was holding the objects itself for each position like `Terrain tiles_[WIDTH][HEIGTH]`, it would be too costly, it's lighter to have a matrix of pointers, because this way we only need have 3 objects of type terrain in our game.

In the tile example, we just eagerly created an instance for each terrain type and stored it in World. 


``` cpp
int movementCost = world.getTile(2, 3).getMovementCost();
```