//Author Dogaru Narcis George
module spring(radius, wire_radius, coils, step, faces) {
    for(i=[0:1:coils]) {
        translate([0,0,i*step])
        
        difference() {
            cylinder(h=wire_radius, r = radius, center=true, $fn = faces);
            
            cylinder(h=wire_radius *2, r = radius - wire_radius, center=true);
        }
    }
}