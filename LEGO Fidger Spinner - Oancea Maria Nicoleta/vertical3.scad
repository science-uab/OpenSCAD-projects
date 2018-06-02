//Oancea Maria-Nicoleta

include <values.scad>

module vertical3(greatRadius, smallRadius, thickness, height, heightCenter, notch, width, length, heightLongMiddle){
    intersection(){
        union(){
            difference(){
                union(){
                    translate( [0, 0, -thickness / 2] ) cylinder( h = thickness / 2, r = greatRadius, $fn = cylinderFaces );
                    scale( [1.04, 1.04, 1] ){
                        rotate( [0, 0, 45] ) translate( [0, 0, -height / 2 - thickness / 4] ) cube([sqrt(2) * greatRadius, sqrt(2) * greatRadius, height - thickness / 2], center = true);
                        rotate( [0, 0, 75] ) translate( [0, 0, -height / 2 - thickness / 4] ) cube([sqrt(2) * greatRadius, sqrt(2) * greatRadius, height - thickness / 2], center = true);
                        rotate( [0, 0, 105] ) translate( [0, 0, -height / 2 - thickness / 4] ) cube([sqrt(2) * greatRadius, sqrt(2) * greatRadius, height - thickness / 2], center = true);
                    }   
                }
                for ( i = [0 : 11] ){
                    rotate( [0, 0, 15 + i * 30] ) scale( [1.5, 1.2, 1] ) translate( [-greatRadius, 0, -height - tolerance] )cylinder( h = height - thickness / 2 + tolerance, r = smallRadius, $fn = 3);
                    rotate( [0, 0, 15 + i * 30] ) translate( [-1.33 * greatRadius, 0, -1.18 * height] ) rotate( [45, 45, 0 ] ) cube(height);
                } 
                
                translate( [-( (width + space) / 2), -((length + space) / 2), -(heightLongMiddle / 2)] ) cube( [(width + space), (length + space), heightLongMiddle] );
                translate( [-((length + space) / 2), -((width + space) / 2), -(heightLongMiddle / 2)] ) cube( [(length + space), (width + space), heightLongMiddle] );  
                translate( [-notch / 2, -((length + space +  2 * notch) / 2), -(heightLongMiddle / 2)] ) cube( [notch, length + space + 2 * notch, heightLongMiddle] ); 
                translate( [ -((length + space +  2 * notch) / 2), -notch / 2, -(heightLongMiddle / 2)] ) cube( [length + space + 2 * notch, notch, heightLongMiddle] ); 
                
            }
            
            difference(){
               cylinder( h = heightCenter, r = smallRadius, $fn = cylinderFaces ); 
               translate( [0, 0, -0.01] ) cylinder( h = heightCenter + tolerance, r = smallRadius - thickness, $fn = cylinderFaces ); 
            }     
        }
        sphere( r = greatRadius + 0.1, $fn = cylinderFaces / 3);
    }
}

color( [0.3, 0.3, 0.3] ) vertical3(greatRadius = greatRadiusVertical3, smallRadius = smallRadiusVertical3, thickness = thicknessVertical3, height = heightVertical3, heightCenter = heightCenterVertical3, notch = notchVertical3, width = widthLongMiddle, length = lengthLongMiddle, heightLongMiddle = heightLongMiddle);
