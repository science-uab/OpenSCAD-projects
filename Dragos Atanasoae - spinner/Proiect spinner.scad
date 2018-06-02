MARIME_CILINDRU_CENTRU = 22;
LUNGIME_BRATE = 60;
MARIME_CILINDRU_CAPAT_BRAT = 6;
NUMAR_BRATE = 3;

for(i=[1:1:NUMAR_BRATE] ){
    rotate([0,0,i*360/NUMAR_BRATE]) brat_spinner();
}

module brat_spinner(){
    difference(){
        difference(){
            difference(){
                hull(){
                    cylinder(r=MARIME_CILINDRU_CENTRU/2+6, h=6, center=true);
                    translate([LUNGIME_BRATE,0,0]) cylinder(r=MARIME_CILINDRU_CENTRU/2, h=6, center=true);
            }
            cylinder(r=MARIME_CILINDRU_CENTRU/2, h=9, center=true);
        }
        scale([2,1,1]){
            translate([LUNGIME_BRATE/3,LUNGIME_BRATE/2,0]) cylinder(r=LUNGIME_BRATE/3, h=18, center=true);
            translate([LUNGIME_BRATE/3,-LUNGIME_BRATE/2,0]) cylinder(r=LUNGIME_BRATE/3, h=18, center=true);
        }
    }
    translate([LUNGIME_BRATE,0,2]) cylinder(r=MARIME_CILINDRU_CAPAT_BRAT, h=6, center=true);
    translate([LUNGIME_BRATE,0,-1]) cylinder(r=MARIME_CILINDRU_CAPAT_BRAT/2, h=6, center=true); 
}
    
            
}