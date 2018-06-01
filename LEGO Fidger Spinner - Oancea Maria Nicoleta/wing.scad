//Oancea Maria-Nicoleta

include <values.scad>

module greatWing(radius, heightShaft, thickness, greatHeight, greatWidth){
    union(){
        intersection(){
            difference(){
                translate( [-thickness / 2, 0, greatHeight / 1.95] ) cube( [thickness, greatWidth / 1.5, greatHeight / 3.5]); 
                rotate( [-50, 0, 0] )translate( [-thickness ,-2.3 * radius , greatHeight / 2.2 ] ) rotate( [0, 90, 0] ) scale( [1, 4, 1] ) cylinder( h = heightShaft , r = radius, $fn = cylinderFaces );
            }
            translate( [0, -4 * radius, greatHeight / 2] ) scale( [1, 1.5, 1] )sphere(r = 5 * radius, $fn = cylinderFaces);
        }
        
        intersection(){
            difference(){
                translate( [-thickness / 2, 0, greatHeight / 7.5] ) cube( [thickness, greatWidth / 1.25, greatHeight / 2.62]); 
                rotate( [-50, 0, 0] )translate( [-thickness ,1.8 * radius , greatHeight / 4.2 ] ) rotate( [0, 90, 0] ) scale( [1, 4, 1] ) cylinder( h = heightShaft , r = radius, $fn = cylinderFaces );
            }
           translate( [0, -1.5 * radius, greatHeight / 30] ) scale( [1, 1, 1.4] )sphere(r = 6 * radius, $fn = cylinderFaces);
        }
        
        intersection(){
            difference(){
                translate( [-thickness / 2, 0, -greatHeight / 5] ) cube( [thickness, greatWidth, greatHeight / 3]); 
                translate( [-thickness , radius / 1.7, -greatHeight / 4.5] ) rotate( [0, 90, 0] ) scale( [1, 1.8, 1] ) cylinder( h = heightShaft , r = 2.4 * radius, $fn = cylinderFaces );
            }
           translate( [0, -4 * radius, -greatHeight / 6] ) scale( [1, 1.5, 1] ) sphere(r = 6 * radius, $fn = cylinderFaces);
        }
    }
}

module smalltWing(radius, heightShaft, thickness, smallHeight, greatHeight, smallWidth){
    intersection(){
        difference(){
            translate( [-thickness / 2, -heightShaft - smallWidth, -greatHeight / 5] ) cube( [thickness, smallWidth, smallHeight]);
            translate( [-thickness , -4.8 * radius, -greatHeight / 5.3] ) rotate( [0, 90, 0] ) scale( [1, 1.6, 1] ) cylinder( h = heightShaft , r = 1.8 * radius, $fn = cylinderFaces );
        }
        translate( [0, -3 * radius, -radius] ) scale( [1, 1, 1.7] )sphere(r = 5 * radius, $fn = cylinderFaces);
    }
}

module cut(radius, heightShaft, thickness, greatHeight, greatWidth){  
    intersection(){
        difference(){
            translate( [-thickness / 2, 0, greatHeight / 1.95] ) cube( [thickness, greatWidth / 1.5, greatHeight / 3.5]); 
            translate( [-thickness ,2.5 * radius , greatHeight / 2.4 ] ) rotate( [0, 90, 0] ) cylinder( h = heightShaft , r = 3 * radius, $fn = cylinderFaces );
        }
        translate( [0, -4 * radius, greatHeight / 2] ) scale( [1, 1.5, 1] )sphere(r = 5 * radius, $fn = cylinderFaces);
    }
}

module cutWingFaces(radius, heightShaft, thickness, greatHeight, smallHeight, greatWidth, smallWidth){
    union(){   
        translate( [-0.9 * thickness, thickness / 6, greatHeight / 3.7] ) scale( [1, 0.4, 0.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        translate( [-0.9 * thickness, thickness / 6, -greatHeight / 1.5] ) scale( [1, 0.6, 1.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        rotate( [-25, 0, ] ) translate( [-0.9 * thickness, thickness / 6, -greatHeight / 3 ] ) scale( [1, 1.2, 0.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        translate( [-0.9 * thickness, thickness / 2.7, heightShaft / 2.1] )cube( [thickness, thickness / 2.5, greatHeight / 3.5], center = true );
    }
}

module cutWingBack(radius, heightShaft, thickness, greatHeight, smallHeight, greatWidth, smallWidth){
    union(){   
        translate( [0.9 * thickness, thickness / 6, greatHeight / 3.7] ) scale( [1, 0.4, 0.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        translate( [0.9 * thickness, thickness / 6, -greatHeight / 1.5] ) scale( [1, 0.6, 1.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        rotate( [-25, 0, ] ) translate( [0.9 * thickness, thickness / 6, -greatHeight / 3 ] ) scale( [1, 1.2, 0.6] ) cut(radius, heightShaft, thickness, greatHeight, greatWidth);
        translate( [0.9 * thickness, thickness / 2.7, heightShaft / 2.1] )cube( [thickness, thickness / 2.5, greatHeight / 3.5], center = true );
    }
}


module wing(radius, heightShaft, thickness, greatHeight, smallHeight, greatWidth, smallWidth){
    union(){
        translate( [0, heightShaft / 5, 0] ) intersection(){
            rotate( [90, 0, 0] ) cylinder( h = 1.7 * heightShaft , r = 1.2 * radius, $fn = cylinderFaces );
            translate( [0, -0.75 * heightShaft, 0] ) scale( [1, 1.9, 1] )sphere(r = 1.9 * radius, $fn = cylinderFaces);
        }
        
        difference(){
            greatWing(radius, heightShaft, thickness, greatHeight, greatWidth);
            //cutWingFaces(radius, heightShaft, thickness, greatHeight, smallHeight, greatWidth, smallWidth);
            //cutWingBack(radius, heightShaft, thickness, greatHeight, smallHeight, greatWidth, smallWidth);         
        }
  
        difference(){
            smalltWing(radius, heightShaft, thickness, smallHeight, greatHeight, smallWidth);
            rotate( [-5, 0, 0] ) translate( [-0.9 * thickness, -heightShaft / 1.5, 0] ) scale( [1, 0.5, 0.7] ) smalltWing(radius, heightShaft, thickness, smallHeight, greatHeight, smallWidth);
            rotate( [-5, 0, 0] ) translate( [0.9 * thickness, -heightShaft / 1.5, 0] ) scale( [1, 0.5, 0.7] ) smalltWing(radius, heightShaft, thickness, smallHeight, greatHeight, smallWidth);
        }
    }

}

color( [1, 0.8, 0] ) wing(radius = radiusWing, heightShaft = heightShaftWing, thickness = thicknessWing, greatHeight = greatHeightWing, smallHeight = smallHeightWing, greatWidth = greatWidthWing, smallWidth = smallWidthWing);


