//Oancea Maria-Nicoleta

include <values.scad>

module middleEdges(length, width, thickness2, thickness1, height, radius){
    union(){
        difference(){
            cube( [length, width, thickness2] );
            translate( [thickness1, thickness1, height-tolerance] ) cube( [length - 2 * thickness1, width - 2 * thickness1, height + 2 * tolerance] );
        }
        
        difference(){          
            translate( [ 3 * tolerance, 3 * tolerance, 0] ) cube( [length - 6 * tolerance, width - 6 * tolerance, thickness2 +  3 * tolerance] );
            translate( [thickness1, thickness1, height-tolerance] ) cube( [length - 2 * thickness1, width - 2 * thickness1, height + 2 * tolerance] );
        }
        
        difference(){
            translate( [length  / 2, width / 2, 0] ) cylinder( h = thickness2 , r = radius * 0.45, $fn = cylinderFaces );
            translate( [length  / 2, width / 2, tolerance] ) cylinder( h = thickness2, r = radius * 0.18, $fn = cylinderFaces );
        }
        
        difference(){
            translate( [length  / 2, width / 2, -height] ) cylinder( h = height , r = radius , $fn = cylinderFaces );
            translate( [length  / 2, width / 2, -height - tolerance] ) cylinder( h = height, r = radius - thickness1 / 2, $fn = cylinderFaces );
        }
    }
}

color( [0.6, 0.15, 0] ) middleEdges(length = lengthMiddleEdges, width = widthMiddleEdges, thickness2 = thickness2MiddleEdges, thickness1  = thickness1MiddleEdges, height = heightMiddleEdges, radius = radiusMiddleEdges);
