//Oancea Maria-Nicoleta

include <values.scad>

module insideEdges(length, widthUp, rightWidth, thicknessUp, thicknessRight, thickness, height, radius){
    union(){
        difference(){
            cube( [length, widthUp, thicknessUp] );
            translate( [thicknessRight, thicknessRight, -tolerance] ) cube( [length - 2 * thicknessRight, widthUp - 2 * thicknessRight, height + 2 * tolerance] );
            translate( [thicknessRight + 0.9 * radius, thicknessRight + 1.6 * radius, height] ) cylinder( h = height + 2 * tolerance, r = radius * 0.7, $fn = cylinderFaces );
            translate( [length - thicknessRight  - 0.9 * radius, thicknessRight + 1.6 * radius, height] ) cylinder( h = height + 2 * tolerance, r = radius * 0.7, $fn = cylinderFaces );
        }
        
        difference(){
            translate( [length  / 2, thicknessRight + 1.4 * radius, 0] ) cylinder( h = height , r = radius * 0.45, $fn = cylinderFaces );
            translate( [length  / 2, thicknessRight + 1.4 * radius, -tolerance] ) cylinder( h = height, r = radius * 0.18, $fn = cylinderFaces );
        }
        
        translate( [(length - radius * 0.4) / 2 + (length - radius * 0.4) / 4, 0, 0] ) cube( [radius * 0.4, 1.7 * thicknessRight, thicknessUp] );
        translate( [(length - radius * 0.4) / 2, 0, 0] ) cube( [radius * 0.4, 1.7 * thicknessRight, thicknessUp] );
        translate( [(length - radius * 0.4) / 4, 0, 0] ) cube( [radius * 0.4, 1.7 * thicknessRight, thicknessUp] );
        
        difference(){
            translate( [thicknessRight + 0.9 * radius, thicknessRight + 1.6 * radius, thicknessUp] ) cylinder( h = height, r = radius, $fn = cylinderFaces );
            translate( [thicknessRight + 0.9 * radius, thicknessRight + 1.6 * radius, height] ) cylinder( h = height, r = radius * 0.7, $fn = cylinderFaces );  
            translate( [thicknessRight + 0.9 * radius, thicknessRight + 1.6 * radius, thicknessUp + height - 2 * tolerance] ) cylinder( h = height, r = radius * 0.4, $fn = cylinderFaces );
        }
        
        difference(){
             translate( [length - thicknessRight  - 0.9 * radius, thicknessRight + 1.6 * radius, thicknessUp] ) cylinder( h = height, r = radius, $fn = cylinderFaces );
            translate( [length - thicknessRight  - 0.9 * radius, thicknessRight + 1.6 * radius, height] ) cylinder( h = height, r = radius * 0.7, $fn = cylinderFaces );
        }
        
        translate( [-2 * tolerance, 0, -1.4 * thicknessUp] ) cube( [length + 4 * tolerance, thicknessRight, rightWidth] );
        
        difference(){
            translate( [length - thicknessRight  - radius, 0, -0.2 * radius] )rotate( [90, 0, 0] ) cylinder( h = height, r = radius, $fn = cylinderFaces );
            translate( [length - thicknessRight  - radius, -tolerance, -0.2 * radius] )rotate( [90, 0, 0] ) cylinder( h = height, r = radius * 0.7, $fn = cylinderFaces );
        }
        
        difference(){
            translate( [thicknessRight + radius, 0, -0.2 * radius] )rotate( [90, 0, 0] ) cylinder( h = height, r = radius, $fn = cylinderFaces );
            translate( [thicknessRight + radius, -tolerance, -0.2 * radius] )rotate( [90, 0, 0] ) cylinder( h = height, r = radius * 0.7, $fn = cylinderFaces );
        }            
    }  
}


color( [0.4, 0.4, 0.4] ) insideEdges(length = lengthInsideEdges, widthUp = widthUpInsideEdges, rightWidth = rightWidthInsideEdges, thicknessUp = thicknessUpInsideEdges, thicknessRight = thicknessRightInsideEdges, thickness = thicknessInsideEdges, height = heightInsideEdges, radius = radiusInsideEdges);

