//Oancea Maria-Nicoleta

include <values.scad>

module vertical1(greatRadius, smallRadius, thickness, height, heightBase, cut, cylinderFaces, notch, holeRadius, holeHeight){
    union(){
        difference(){
            union(){
                cylinder( h = height - notch, r = greatRadius, $fn = cylinderFaces );
                cylinder( h = height, r = greatRadius - notch, $fn = cylinderFaces );
            }
            rotate( [0, 0, 45] )translate( [smallRadius + 2 * holeRadius, 0, heightBase - holeHeight] )cylinder( h = 2 * holeHeight, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 135] )translate( [smallRadius + 2 * holeRadius, 0, heightBase - holeHeight] )cylinder( h = 2 * holeHeight, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 225] )translate( [smallRadius + 2 * holeRadius, 0, heightBase - holeHeight] )cylinder( h = 2 * holeHeight, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 315] )translate( [smallRadius + 2 * holeRadius, 0, heightBase - holeHeight] )cylinder( h = 2 * holeHeight, r = holeRadius, $fn = cylinderFaces );
            translate( [0, 0, heightBase] ) cylinder( h = height, r = (greatRadius - 2 * thickness), $fn = cylinderFaces );
            translate( [-(cut / 2), -(greatRadius + tolerance), heightBase] ) cube( [cut, (greatRadius + tolerance) * 2, height] );
            rotate( [0, 0, 90] ) translate( [-(cut / 2), -(greatRadius + tolerance), heightBase] ) cube( [cut, (greatRadius + tolerance) * 2, height] );           
        }
        
        difference(){
            cylinder( h = height, r = smallRadius, $fn = cylinderFaces );  
            translate( [0, 0, heightBase] ) cylinder( h = height, r = smallRadius - thickness, $fn = cylinderFaces );  
        }
    }
    
}

color( [1, 0.8, 0] ) vertical1(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, thickness = thicknessVertical, height = heightVertical, heightBase = heightBaseVertical, cut = cutVertical1, cylinderFaces = cylinderFaces, notch = notchVertical1, holeRadius = holeRadiusVertical, holeHeight = holeHeightVertical);

