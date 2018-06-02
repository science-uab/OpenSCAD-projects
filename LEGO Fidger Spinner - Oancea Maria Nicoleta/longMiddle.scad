//Oancea Maria-Nicoleta

include <values.scad>

module longMiddle(height, width, length){
    union(){
        translate( [-(width / 2), -(length / 2), 0] ) cube( [width, length, height] );
        translate( [-(length / 2), -(width / 2), 0] ) cube( [length, width, height] );
    }
}

color( [0, 0, 0] ) longMiddle(heightLongMiddle, widthLongMiddle, lengthLongMiddle);