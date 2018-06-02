//Oancea Maria-Nicoleta

include <values.scad>

use <longMiddle.scad>
use <vertical1.scad>
use <vertical2.scad>
use <vertical3.scad>
use <middleRound.scad>
use <insideEdges.scad>
use <middleEdges.scad>
use <externalA.scad>
use <externalB.scad>
use <wing.scad>

difference(){
    union(){
        translate( [0, 0, -(heightLongMiddle / 2) +heightBaseVertical] ) color( [0.2, 0.2, 0.2] ) longMiddle(heightLongMiddle, widthLongMiddle, lengthLongMiddle);
         
        translate( [0, 0, -(heightLongMiddle / 2)] ) color( [1, 0.8, 0] )  vertical1(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, thickness = thicknessVertical, height = heightVertical, heightBase = heightBaseVertical, cut = cutVertical1, cylinderFaces = cylinderFaces, notch = notchVertical1, holeRadius = holeRadiusVertical, holeHeight = holeHeightVertical);

        translate( [0, 0, -(heightLongMiddle / 2) + (radiusUpVertical2 + heightVertical) / 1.8] ) color( [0.9, 0.9, 0.9] ) vertical2(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, height = heightVertical, heightBase = heightBaseVertical, cylinderFaces = cylinderFaces, holeRadius = holeRadiusVertical, heightHole = holeHeightVertical, width = widthLongMiddle, length = lengthLongMiddle, heightMiddle = heightMiddleVertical2, space = space, side = sideVertical2, thickness = thicknessVertical, heightHoleDown = heightHoleDownVertical2, radiusDown = radiusDownVertical2, radiusUp = radiusUpVertical2, heightUp = heightUpVertical2, tolerance = tolerance);

        translate( [0, 0, -(heightLongMiddle / 2) + (heightCenterVertical3 + heightVertical3) / 0.333] ) color( [0.3, 0.3, 0.3] ) vertical3(greatRadius = greatRadiusVertical3, smallRadius = smallRadiusVertical3, thickness = thicknessVertical3, height = heightVertical3, heightCenter = heightCenterVertical3, notch = notchVertical3, width = widthLongMiddle, length = lengthLongMiddle, heightLongMiddle = heightLongMiddle);

        translate( [0, 0, 7 * tolerance] ) color( [0.6, 0.15, 0] ) middleRound(greatRadius = greatRadiusMiddleRound, smallRadius = smallRadiusMiddleRound, radiusUp = radiusUpMiddleRound, heightUp = heightUpMiddleRound, heightDown = heightDownMiddleRound, thickness = thicknessMiddleRound, greatCut = greatCutMiddleRound, smallCut = smallCutMiddleRound, edgeDistance = edgeDistanceMiddleRound, distance = distanceMiddleRound, radiusHole = radiusHoleMiddleRound, heightHole = heightHoleMiddleRound, radiusGreatHole = radiusGreatHoleMiddleRound);


        scale([1, 1, 1.09])mirror([0,0,1]) {
            translate( [0, 0, -(heightLongMiddle / 2)] ) color( [1, 0.8, 0] )  vertical1(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, thickness = thicknessVertical, height = heightVertical, heightBase = heightBaseVertical, cut = cutVertical1, cylinderFaces = cylinderFaces, notch = notchVertical1, holeRadius = holeRadiusVertical, holeHeight = holeHeightVertical);
            
            translate( [0, 0, -(heightLongMiddle / 2) + (heightUpVertical2 + heightVertical) / 1.8] ) color( [0.9, 0.9, 0.9] ) vertical2(greatRadius = greatRadiusVertical, smallRadius = smallRadiusVertical, height = heightVertical, heightBase = heightBaseVertical, cylinderFaces = cylinderFaces, holeRadius = holeRadiusVertical, heightHole = holeHeightVertical, width = widthLongMiddle, length = lengthLongMiddle, heightMiddle = heightMiddleVertical2, space = space, side = sideVertical2, thickness = thicknessVertical, heightHoleDown = heightHoleDownVertical2, radiusDown = radiusDownVertical2, radiusUp = radiusUpVertical2, heightUp = heightUpVertical2, tolerance = tolerance);
            
            translate( [0, 0, -(heightLongMiddle / 2) + (heightCenterVertical3 + heightVertical3) / 0.333] ) color( [0.3, 0.3, 0.3] ) vertical3(greatRadius = greatRadiusVertical3, smallRadius = smallRadiusVertical3, thickness = thicknessVertical3, height = heightVertical3, heightCenter = heightCenterVertical3, notch = notchVertical3, width = widthLongMiddle, length = lengthLongMiddle, heightLongMiddle = heightLongMiddle);
        }



        rotate([0, 0, 45]) translate( [-lengthInsideEdges / 2, -1.15 * greatRadiusMiddleRound, thicknessUpInsideEdges / 3.5 ] )union(){
            color( [0.4, 0.4, 0.4] ) insideEdges(length = lengthInsideEdges, widthUp = widthUpInsideEdges, rightWidth = rightWidthInsideEdges, thicknessUp = thicknessUpInsideEdges, thicknessRight = thicknessRightInsideEdges, thickness = thicknessInsideEdges, height = heightInsideEdges, radius = radiusInsideEdges);

            translate( [0,-widthMiddleEdges/2.05, thickness2MiddleEdges ] ) rotate([270, 0, 0]) color( [0.6, 0.15, 0] ) middleEdges(length = lengthMiddleEdges, width = widthMiddleEdges, thickness2 = thickness2MiddleEdges, thickness1  = thickness1MiddleEdges, height = heightMiddleEdges, radius = radiusMiddleEdges);
            
            translate( [lengthMiddleEdges / 2, -widthMiddleEdges/2.05 - 1.6 * heightExternalA,  0 ] ) rotate([270, 0, 0])color( [1, 0.65, 0, 0.8] ) externalA(radius = radiusExternalA, thickness = thicknessExternalA, height = heightExternalA);
        }

        rotate([0, 0, 135]) translate( [-lengthInsideEdges / 2, -1.15 * greatRadiusMiddleRound, thicknessUpInsideEdges / 3.5 ] )union(){
            color( [0.4, 0.4, 0.4] ) insideEdges(length = lengthInsideEdges, widthUp = widthUpInsideEdges, rightWidth = rightWidthInsideEdges, thicknessUp = thicknessUpInsideEdges, thicknessRight = thicknessRightInsideEdges, thickness = thicknessInsideEdges, height = heightInsideEdges, radius = radiusInsideEdges);

            translate( [0,-widthMiddleEdges/2.05, thickness2MiddleEdges ] ) rotate([270, 0, 0]) color( [0.6, 0.15, 0] ) middleEdges(length = lengthMiddleEdges, width = widthMiddleEdges, thickness2 = thickness2MiddleEdges, thickness1  = thickness1MiddleEdges, height = heightMiddleEdges, radius = radiusMiddleEdges);
            
            translate( [sideExternalB,-widthMiddleEdges/1.36, -5 * tolerance ] ) rotate([270, 90, 0]) color( [0.6, 0.15, 0] ) externalB(side = sideExternalB, height = heightExternalB, thickness = thicknessExternalB, heightHole = heightHoleExternalB, radius = radiusExternalB, heightHook = heightHookExternalB, thicknessHook = thicknessHookExternalB);
            
            translate( [1.45 * sideExternalB,-1.2 * widthMiddleEdges, -5 * tolerance ] ) rotate([90, 90, 0]) color( [1, 0.8, 0] ) wing(radius = radiusWing, heightShaft = heightShaftWing, thickness = thicknessWing, greatHeight = greatHeightWing, smallHeight = smallHeightWing, greatWidth = greatWidthWing, smallWidth = smallWidthWing);
        }

        rotate([0, 0, 225]) translate( [-lengthInsideEdges / 2, -1.15 * greatRadiusMiddleRound, thicknessUpInsideEdges / 3.5 ] )union(){
            color( [0.4, 0.4, 0.4] ) insideEdges(length = lengthInsideEdges, widthUp = widthUpInsideEdges, rightWidth = rightWidthInsideEdges, thicknessUp = thicknessUpInsideEdges, thicknessRight = thicknessRightInsideEdges, thickness = thicknessInsideEdges, height = heightInsideEdges, radius = radiusInsideEdges);

            translate( [0,-widthMiddleEdges/2.05, thickness2MiddleEdges ] ) rotate([270, 0, 0]) color( [0.6, 0.15, 0] ) middleEdges(length = lengthMiddleEdges, width = widthMiddleEdges, thickness2 = thickness2MiddleEdges, thickness1  = thickness1MiddleEdges, height = heightMiddleEdges, radius = radiusMiddleEdges);
            
            translate( [lengthMiddleEdges / 2, -widthMiddleEdges/2.05 - 1.6 * heightExternalA,  0 ] ) rotate([270, 0, 0])color( [1, 0.65, 0, 0.8] ) externalA(radius = radiusExternalA, thickness = thicknessExternalA, height = heightExternalA);
        }

        rotate([0, 0, 315]) translate( [-lengthInsideEdges / 2, -1.15 * greatRadiusMiddleRound, thicknessUpInsideEdges / 3.5 ] )union(){
            color( [0.4, 0.4, 0.4] ) insideEdges(length = lengthInsideEdges, widthUp = widthUpInsideEdges, rightWidth = rightWidthInsideEdges, thicknessUp = thicknessUpInsideEdges, thicknessRight = thicknessRightInsideEdges, thickness = thicknessInsideEdges, height = heightInsideEdges, radius = radiusInsideEdges);

            translate( [0,-widthMiddleEdges/2.05, thickness2MiddleEdges ] ) rotate([270, 0, 0]) color( [0.6, 0.15, 0] ) middleEdges(length = lengthMiddleEdges, width = widthMiddleEdges, thickness2 = thickness2MiddleEdges, thickness1  = thickness1MiddleEdges, height = heightMiddleEdges, radius = radiusMiddleEdges);
            
            translate( [sideExternalB,-widthMiddleEdges/1.36, -5 * tolerance ] ) rotate([270, 90, 0]) color( [0.6, 0.15, 0] ) externalB(side = sideExternalB, height = heightExternalB, thickness = thicknessExternalB, heightHole = heightHoleExternalB, radius = radiusExternalB, heightHook = heightHookExternalB, thicknessHook = thicknessHookExternalB);

            translate( [1.45 * sideExternalB,-1.2 * widthMiddleEdges, -5 * tolerance ] ) rotate([90, 90, 0]) color( [1, 0.8, 0] ) wing(radius = radiusWing, heightShaft = heightShaftWing, thickness = thicknessWing, greatHeight = greatHeightWing, smallHeight = smallHeightWing, greatWidth = greatWidthWing, smallWidth = smallWidthWing);
        }
    }
    
    //rotate( [0, 0, 45] ) translate( [-50, 0, -30] ) cube( [100, 60, 60] );
    //rotate( [0, 0, 135] ) translate( [-30, 0, -30] ) cube( [60, 60, 60] );
}