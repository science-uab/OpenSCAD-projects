//Tomuta Dan Claudiu, PABDI, Semestrul II
toleranta=1;
    //Partea de jos a canii---------------------------
    color("Blue")difference()
    {
    cylinder(h=19,r=39,$fn=100);
    {
    translate([0,0,2])cylinder(h=18,r=37,$fn=100);
    }
        
    };
    // -----------------------------------------------------------------------------
    
    // Partea de mijloc a canii-----------------------------------------------------
    color("Yellow")difference(){
    hull(){
    translate([0,0,90])cylinder(h=1,r=48,$fn=100);    
    translate([0,0,15])cylinder(h=1,r=39,$fn=100);

    };    
    hull(){
    translate([0,0,91])cylinder(h=1,r=42,$fn=100);    
    translate([0,0,14])cylinder(h=1,r=36,$fn=100);
    }
    };
    //------------------------------------------------------------------------    
    
    //Partea de sus a canii-----------------------------
    color("Red")difference(){
    hull(){
        translate([0,0,105])cylinder(h=1,r=52,$fn=100);    
        translate([0,0,90])cylinder(h=1,r=48,$fn=100);

    }    
    hull(){
        translate([0,0,105+toleranta])cylinder(h=1,r=49,$fn=100);    
        translate([0,0,89])cylinder(h=1,r=40,$fn=100);

    

    }
    };
    //-----------------------------------------------------------------------------
    
    //Toarta 
    color("White")difference()
        {
        union(){
            //uneste figurile
            translate([60,-10,65])rotate([-90,-30,0])cylinder(h=20  ,r=28,$fn=100);
            translate([60,-10,70])rotate([-90,-30,0])cylinder(h=20,r=28,$fn=100);    
            translate([39,-10,21])rotate([0,-30,0])cube([35,20,10]);
                }
        hull(){
            //hull sterge spatiul dintre figuri
            translate([60,-11,69])rotate([-90,-30,0])cylinder(h=20+toleranta*2,r=22    ,$fn=100);
            translate([38,-11,55])rotate([-90,-30,0])cylinder(h=20+toleranta*2,r=22    ,$fn=100); 
        }
            translate([39,-11,21])rotate([0,-84,0])cube([70,20+toleranta*2,20]);
        };
     //------------------------------------------------------------------------------   