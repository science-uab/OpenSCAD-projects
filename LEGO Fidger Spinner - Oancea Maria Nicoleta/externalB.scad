//Oancea Maria-Nicoleta

include <values.scad>

module externalB(side, height, thickness, heightHole, radius, heightHook, thicknessHook){
    union(){
        difference(){
            cube( [side, side, height], center = true);
            translate( [0, 0, heightHole / 1.5 + tolerance] ) cube( [side - 2 * thickness, side - 2 * thickness, heightHole], center = true );
            translate( [(side - 1.3 * radius) / 2, (side - 1.3 *radius) / 2,  - 1.5 * thickness  ] )cylinder( h = 2 * tolerance, r = radius / 2, $fn = cylinderFaces );
            rotate( [0, 0, 180] ) translate( [(side - 1.3 * radius) / 2, (side - 1.3 *radius) / 2,  - 1.5 * thickness  ] )cylinder( h = 2 * tolerance, r = radius / 2, $fn = cylinderFaces );
        }
        
        intersection(){
            rotate( [-90, 0, 0] ) difference(){
               translate( [-side / 2, thicknessHook / 2, -heightHook / 3] ) cube( [side, heightHook, thicknessHook]); 
                cylinder( h = thicknessHook + 2 * tolerance , r = radius / 2, $fn = cylinderFaces );
                translate( [0, 2 * thickness + radius, -heightHook / 3 - tolerance] ) cylinder( h = thicknessHook + 2 * tolerance , r = radius, $fn = cylinderFaces );
                   translate( [0, side / 1.3 , -2 * tolerance] )cube( [1.8 * radius, heightHook, thicknessHook + 2 * tolerance], center = true); 
            }
            translate( [0, side / 2, -heightHook / 2] ) rotate( [90, 0 , 0] ) cylinder( h = side, r = side / 1.85, $fn = cylinderFaces );
        }
    }
}

color( [0.6, 0.15, 0] ) externalB(side = sideExternalB, height = heightExternalB, thickness = thicknessExternalB, heightHole = heightHoleExternalB, radius = radiusExternalB, heightHook = heightHookExternalB, thicknessHook = thicknessHookExternalB);

