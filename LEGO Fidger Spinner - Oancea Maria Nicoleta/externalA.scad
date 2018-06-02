//Oancea Maria-Nicoleta

include <values.scad>

module externalA(radius, thickness, height){
   union(){
       difference(){
           cylinder( h = height / 2, r = radius + thickness, $fn = cylinderFaces );
           translate( [0, 0, - tolerance] ) cylinder( h = height, r = radius - thickness, $fn = cylinderFaces );
       }
       
       difference(){
           translate( [0, 0, height / 2] ) cylinder( h = height, r = radius, $fn = cylinderFaces );
           translate( [0, 0, height / 2 - tolerance] ) cylinder( h = height + 2 * tolerance, r = radius - thickness, $fn = cylinderFaces );
       }
       
       difference(){
           translate( [0, 0,  - height / 1.5] )cylinder( h = height / 1.5, r = radius - thickness, $fn = cylinderFaces );
           translate( [0, 0,  - height / 8] )cylinder( h = height / 1.5, r = radius - 1.5 * thickness, $fn = cylinderFaces );
       }
       
       translate( [0, 0,  - height / 8] )cylinder( h = height / 1.3, r = radius - 2 * thickness, $fn = cylinderFaces );
   } 
}

color( [1, 0.65, 0, 0.8] ) externalA(radius = radiusExternalA, thickness = thicknessExternalA, height = heightExternalA);
