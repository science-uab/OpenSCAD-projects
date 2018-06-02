//Author Dogaru Narcis George
module rubber_barrel(height, diameter, faces) {
    union(){
        difference () {
            cylinder(h = height, d = diameter, center = true, $fn = faces);
            cylinder(h = height+10, d = diameter-.5, center = true, $fn = faces);
        }
        
        translate([0,0,height/2 - 0.5]) {
            difference() {
                cylinder(h = height, d = diameter+1, center = true, $fn = faces);
                cylinder(h = height+10, d = diameter, center = true, $fn = faces);
            }
        }
            
    }
    
    
}