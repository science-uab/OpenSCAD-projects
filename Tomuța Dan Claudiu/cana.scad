//Tomuta Dan Claudiu, PABDI, Semestrul II

toleranta=1;

    //Partea de jos a canii---------------------------
module parte_jos_cana(grosime_jos, raza_jos){
    color("Blue")difference()
    {
    //cylinder(h=19,r=39,$fn=100);
       cylinder(h=grosime_jos,r=raza_jos,$fn=100); 
    {
    translate([0,0,2])cylinder(h=grosime_jos-1,r=raza_jos-2,$fn=100);
    }
        
    };
}
    // -----------------------------------------------------------------------------
    
    // Partea de mijloc a canii-----------------------------------------------------
    
module corp_cana(inaltime_cana, raza_cana_exterior, raza_cana_interior) {
    color("Yellow")difference(){
    hull(){
    translate([0,0,90])cylinder(h=inaltime_cana,r=raza_cana_exterior,$fn=100);    
    translate([0,0,15])cylinder(h=inaltime_cana,r=raza_cana_exterior-9,$fn=100);
        
    //translate([0,0,90])cylinder(h=1,r=48,$fn=100);    
    //translate([0,0,15])cylinder(h=1,r=39,$fn=100);

    };    
    hull(){
    translate([0,0,91])cylinder(h=inaltime_cana,r=raza_cana_interior,$fn=100);    
    translate([0,0,14])cylinder(h=inaltime_cana,r=raza_cana_interior-6,$fn=100);
        
    //translate([0,0,91])cylinder(h=1,r=42,$fn=100);    
    //translate([0,0,14])cylinder(h=1,r=36,$fn=100);
    }
    };
}
    //------------------------------------------------------------------------    
    
    //Partea de sus a canii-----------------------------
module bordura_sus_cana(inaltime, raza_exterior, raza_interior)
    color("Red")difference(){
    hull(){
        translate([0,0,105])cylinder(h=inaltime,r=raza_exterior,$fn=100);    
        translate([0,0,90])cylinder(h=inaltime,r=raza_exterior-4,$fn=100);
    }    
    hull(){
        translate([0,0,105+toleranta])cylinder(h=inaltime,r=raza_interior,$fn=100);    
        translate([0,0,89])cylinder(h=inaltime,r=raza_interior-9,$fn=100);
    }
    };
    //-----------------------------------------------------------------------------
    
    //Toarta 
module toarta(latime, grosime) {
    color("White")difference()
        {
        union(){
            //uneste figurile
            translate([60,-10,65])rotate([-90,-30,0])cylinder(h=latime  ,r=grosime,$fn=100);
            translate([60,-10,70])rotate([-90,-30,0])cylinder(h=latime,r=grosime,$fn=100);    
            translate([38,-10,24])rotate([0,-30,0])cube([grosime,latime,10]);
                }
        hull(){
            //hull sterge spatiul dintre figuri
            translate([60,-11,69])rotate([-90,-30,0])cylinder(h=latime+toleranta*2,r=22    ,$fn=100);
            translate([38,-11,55])rotate([-90,-30,0])cylinder(h=latime+toleranta*2,r=22    ,$fn=100); 
        }
            translate([39,-11,21])rotate([0,-84,0])cube([70,20+toleranta*2,20]);
        };
    }
     //------------------------------------------------------------------------------ 
  
  // CANA  
  module cana(grosime_jos, raza_jos, inaltime_cana, raza_cana_interior, raza_cana_exterior, inaltime, raza_exterior, raza_interior, latime, grosime  ){
      parte_jos_cana(grosime_jos, raza_jos);
      corp_cana(inaltime_cana, raza_cana_exterior, raza_cana_interior);
      bordura_sus_cana(inaltime, raza_exterior, raza_interior);
      toarta(latime, grosime);
  }  
  
  // Afisare cana
  rotate([0,0, -$t * 360])
  cana(grosime_jos = 19, raza_jos = 39, inaltime_cana = 1,raza_cana_exterior = 48, raza_cana_interior = 42, inaltime = 1, raza_exterior = 52, raza_interior = 49, latime = 18, grosime = 28);
  
  
  
  