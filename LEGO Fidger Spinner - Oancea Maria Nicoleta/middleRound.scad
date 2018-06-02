//Oancea Maria-Nicoleta

include <values.scad>

module middleRound(greatRadius, smallRadius, radiusUp, heightUp, heightDown, thickness, greatCut, smallCut, edgeDistance, distance, radiusHole, heightHole, radiusGreatHole){
    union(){
       translate( [greatRadius - edgeDistance - radiusUp / 2, 0, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
       translate( [-(greatRadius - edgeDistance - radiusUp / 2), 0, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        translate( [0, greatRadius - edgeDistance - radiusUp / 2, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        translate( [0, -(greatRadius - edgeDistance - radiusUp / 2), 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        
        translate( [edgeDistance / 1.25, greatRadius - (edgeDistance - radiusUp) / 1.2, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusUp) / 1.3, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusUp) / 1.3), 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusUp) / 1.3), 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
        
        rotate( [0, 0, 90] ){
            translate( [edgeDistance / 1.35, greatRadius - (edgeDistance - radiusUp) / 1.3, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusUp) / 1.3, 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusUp) / 1.3), 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusUp) / 1.3), 0] ) cylinder( h = heightUp, r = radiusUp, $fn = cylinderFaces );
          
        } 
        
        difference(){
            translate( [0, 0, -heightDown] ) cylinder( h = heightDown, r = greatRadius, $fn = cylinderFaces );
            translate( [0, 0, -heightDown - thickness / 2] ) cylinder( h = heightDown, r = greatRadius - thickness, $fn = cylinderFaces );
            translate( [0, 0, -1.5 * heightDown - tolerance] ) cylinder( h = 2 * heightDown + 2 * tolerance, r = smallRadius - thickness / 2, $fn = cylinderFaces );
            translate( [0, 0, -0.75 * heightDown] )cube( [2 * (greatRadius + tolerance), greatCut,heightDown], center = true);
            rotate( [0, 0, 90] ) translate( [0, 0, -0.75 * heightDown] )cube( [2 * (greatRadius + tolerance), greatCut,heightDown], center = true);
            
            translate( [greatRadius - edgeDistance - radiusHole / 1.4, 0, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [-(greatRadius - edgeDistance - radiusHole / 1.4), 0, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [0, greatRadius - edgeDistance - radiusHole / 1.4, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [0, -(greatRadius - edgeDistance - radiusHole / 1.4), -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            
            translate( [edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.3, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.2, -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.3, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.2, -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
            translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.3), -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.2), -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.3), -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
            translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.2), -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
            rotate( [0, 0, 90] ){
                translate( [edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.3, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
                translate( [edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.2, -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
                translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.3, -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
                translate( [-edgeDistance / 1.35, greatRadius - (edgeDistance - radiusHole) / 1.2, -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
                translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.3), -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
                translate( [edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.2), -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
                translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.3), -(heightDown - heightHole) / 2] ) cylinder( h = heightHole, r = radiusHole, $fn = cylinderFaces );
                translate( [-edgeDistance / 1.35, -(greatRadius - (edgeDistance - radiusHole) / 1.2), -heightDown - thickness / 2] ) cylinder( h = heightDown, r = radiusUp, $fn = cylinderFaces );
            }
        }
        
        difference(){
            translate( [0, 0, -heightDown] ) cylinder( h = heightDown, r = smallRadius, $fn = cylinderFaces );
            translate( [0, 0, -1.5 * heightDown - tolerance] ) cylinder( h = 2 * heightDown + 2 * tolerance, r = smallRadius - thickness / 2, $fn = cylinderFaces );
            rotate( [0, 0, 45] ) translate( [0, 0, -0.85 * heightDown] )cube( [2 * (smallRadius + tolerance), smallCut,heightDown], center = true);
            rotate( [0, 0, 135] ) translate( [0, 0, -0.85 * heightDown] )cube( [2 * (smallRadius + tolerance), smallCut,heightDown], center = true);
        }
        
        for ( i = [0 : 3]){
            difference(){
                rotate( [0, 0, 45 + i * 90] ) translate( [greatRadius - 2.6 * radiusGreatHole, 0, -heightDown] ) cylinder( h = heightDown, r = radiusGreatHole, $fn = cylinderFaces );
                rotate( [0, 0, 45 + i * 90] ) translate( [greatRadius - 2.6 *radiusGreatHole, 0, -heightDown - tolerance] ) cylinder( h = 2 * (heightDown + tolerance), r = radiusGreatHole - thickness / 2, $fn = cylinderFaces );
            } 
        }
        
        for ( i = [0 : 3]){
            difference(){
                rotate( [0, 0, i * 90] ) translate( [greatRadius - 1.3 * radiusGreatHole, 0, -heightDown] ) cylinder( h = heightDown, r = radiusGreatHole, $fn = cylinderFaces );
                rotate( [0, 0, i * 90] ) translate( [greatRadius - 1.3 *radiusGreatHole, 0, -heightDown - tolerance] ) cylinder( h = 2 * (heightDown + tolerance), r = radiusGreatHole - thickness / 2, $fn = cylinderFaces );
                rotate( [0, 0, i * 90] ) translate( [greatRadius - 3 * tolerance, 0, -heightDown] ) cube( [2 * radiusGreatHole, 2 * radiusGreatHole, 2 * (heightDown + tolerance)], center = true);
            }
        }          
    }
}

color( [0.6, 0.15, 0] ) middleRound(greatRadius = greatRadiusMiddleRound, smallRadius = smallRadiusMiddleRound, radiusUp = radiusUpMiddleRound, heightUp = heightUpMiddleRound, heightDown = heightDownMiddleRound, thickness = thicknessMiddleRound, greatCut = greatCutMiddleRound, smallCut = smallCutMiddleRound, edgeDistance = edgeDistanceMiddleRound, distance = distanceMiddleRound, radiusHole = radiusHoleMiddleRound, heightHole = heightHoleMiddleRound, radiusGreatHole = radiusGreatHoleMiddleRound);