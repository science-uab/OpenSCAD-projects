//Oancea Maria-Nicoleta

include <values.scad>

module vertical2(greatRadius, smallRadius, height, heightBase, cylinderFaces, holeRadius, heightHole, width, length, heightMiddle, space, side, thickness, heightHoleDown, radiusDown, radiusUp, heightUp, tolerance){
    union(){
        difference(){
            translate( [greatRadius - radiusUp + tolerance / 20, 0, -heightUp] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            translate( [greatRadius - tolerance / 20, -tolerance / 2, -heightUp - tolerance / 2] ) cube ( [tolerance, tolerance, heightUp + tolerance] );
        }
        
        difference(){
            rotate( [0, 0, 90] ) translate( [greatRadius - radiusUp + tolerance / 20, 0, -heightUp] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            rotate( [0, 0, 90] ) translate( [greatRadius - tolerance / 20, -tolerance / 2, -heightUp - tolerance / 2] ) cube ( [tolerance, tolerance, heightUp + tolerance] );
        } 
        difference(){
            rotate( [0, 0, 180] ) translate( [greatRadius - radiusUp + tolerance / 20, 0, -heightUp] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            rotate( [0, 0, 180] ) translate( [greatRadius - tolerance / 20, -tolerance / 2, -heightUp - tolerance / 2] ) cube ( [tolerance, tolerance, heightUp + tolerance] );
        } 
        difference(){
            rotate( [0, 0, 270] ) translate( [greatRadius - radiusUp + tolerance / 20, 0, -heightUp] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            rotate( [0, 0, 270] ) translate( [greatRadius - tolerance / 20, -tolerance / 2, -heightUp - tolerance / 2] ) cube ( [tolerance, tolerance, heightUp + tolerance] );
        }
        
        difference(){
            cylinder( h = height, r = greatRadius, $fn = cylinderFaces );
            rotate( [0, 0, 45] ) translate( [-(side / 2), -(side / 2), heightBase] ) cube( [side, side, side] );
            rotate( [0, 0, 45] ) translate( [smallRadius + 2 * holeRadius, 0, heightBase - heightHole] )cylinder( h = 2 * heightHole, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 135] ) translate( [smallRadius + 2 * holeRadius, 0, heightBase - heightHole] )cylinder( h = 2 * heightHole, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 225] ) translate( [smallRadius + 2 * holeRadius, 0, heightBase - heightHole] )cylinder( h = 2 * heightHole, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 315] ) translate( [smallRadius + 2 * holeRadius, 0, heightBase - heightHole] ) cylinder( h = 2 * heightHole, r = holeRadius, $fn = cylinderFaces );
            rotate( [0, 0, 45] ) translate( [-( (width + space) / 2), -((length + space) / 2), -(heightMiddle / 2)] ) cube( [(width + space), (length + space), heightMiddle] );
            rotate( [0, 0, 45] ) translate( [-((length + space) / 2), -((width + space) / 2), -(heightMiddle / 2)] ) cube( [(length + space), (width + space), heightMiddle] ); 
            translate( [smallRadius + 2 * radiusDown , 0 , heightBase - heightHoleDown + space] ) cylinder( h = heightHoleDown, r = radiusDown, $fn = cylinderFaces );
            rotate( [0, 0, 90] ) translate( [smallRadius + 2 * radiusDown , 0 , heightBase - heightHoleDown + space] ) cylinder( h = heightHoleDown, r = radiusDown, $fn = cylinderFaces );
            rotate( [0, 0, 180] ) translate( [smallRadius + 2 * radiusDown , 0 , heightBase - heightHoleDown + space] ) cylinder( h = heightHoleDown, r = radiusDown, $fn = cylinderFaces );
            rotate( [0, 0, 270] ) translate( [smallRadius + 2 * radiusDown , 0 , heightBase - heightHoleDown + space] ) cylinder( h = heightHoleDown, r = radiusDown, $fn = cylinderFaces );
        }

        difference(){
            translate( [0, 0, heightBase + tolerance] )cylinder( h = height, r = smallRadius, $fn = cylinderFaces );  
            translate( [0, 0, heightBase] ) cylinder( h = height + 2 * tolerance, r = smallRadius - thickness, $fn = cylinderFaces );  
        }
    }
        
    
    
}

color( [0.9, 0.9, 0.9] ) vertical2(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, height = heightVertical, heightBase = heightBaseVertical, cylinderFaces = cylinderFaces, holeRadius = holeRadiusVertical, heightHole = holeHeightVertical, width = widthLongMiddle, length = lengthLongMiddle, heightMiddle = heightMiddleVertical2, space = space, side = sideVertical2, thickness = thicknessVertical, heightHoleDown = heightHoleDownVertical2, radiusDown = radiusDownVertical2, radiusUp = radiusUpVertical2, heightUp = heightUpVertical2, tolerance = tolerance);

