//Preda Alexandru - Master PABD I, Roboti Inteligenti
th = 1.5;
dimensiune_nava=100;
fn=40;

nava();

module nava(marime=dimensiune_nava)
	{
	vele(marime);
	carena(marime);
	bompres(marime);
	}

module bompres(bm)
	{
	translate([0,bm*37/64,bm*3/64]) rotate([290,0,0]) intersection() 
		{
		scale([0.5,1,1]) cylinder(r1=bm*8/64,r2=th,h=bm/3,$fn=fn/4,center=true);	
		translate([0,bm/2,0]) cube(bm,center=true);
		}
	}

module carena(cr)
	{
	difference()
		{
		translate([0,cr*-1/32,-cr*3/32]) union()
			{
			scale([0.7,2.1,1]) translate([0,0,-cr/12]) 
				cylinder(r1=cr/6, r2=cr/4, h=cr/6, $fn=fn,center=true);
			difference()
				{
				scale([0.7,2.1,1]) translate([0,0,cr/12]) 
					cylinder(r=cr/4, h=cr/6, $fn=fn,center=true);
				difference()
					{
					scale([0.7,2.1,1]) translate([0,0,cr/12+th/4]) 
						cylinder(r=(cr/4) -th, h=cr/6, $fn=fn,center=true);
					translate([0,-cr*13/32,cr/32]) cube([cr,cr/4,cr/4],center=true);
					translate([0,cr*14/32,-cr*2/32]) cube([cr,cr/4,cr/4],center=true);
				}
				translate([0,cr/4.5,cr/1.7]) cube(cr, center=true);
				}
			}
		}
	}
	
module vele(vl)
	{
	translate([0,0,vl*-4/60]) 
		{
		translate([0,vl/4,0]) catarge(vl*5/6);
		translate([0,0,0]) catarge(vl);
		translate([0,-vl/5,0]) catarge(vl*5/6);
		translate([0,vl*16/32,vl*13/50]) rotate([205,0,0]) scale([1,1,2]) rotate([0,90,0]) 
			cylinder(r=vl/5,h=th,$fn=3,center=true);
		}
	}

module catarge(vl=30)
	{
	cylinder(r=th*2/3,h=vl*11/12,$fn=fn/4);
	rotate([0,-90,0]) 
	translate([vl/2,0,0]) union() 
		{
		translate([0,-vl/64,0]) intersection()
			{
			difference()
				{
				scale([0,0,0]) translate([-vl/6,0,0]) 
					cylinder(r=vl/2,h=th,$fn=3,center=true);
				}
			}
		translate([0,vl/16,0]) catarg(vl);
		}
	}

module catarg(vl=30)
	{
	translate([-vl/5,0,0]) panza(vl/5);
    translate([vl/7,-th*1.5,0]) panza(vl/7);
	translate([vl*5/16,-th*2,0]) panza(vl/16);
	}

module panza(panza)
	{
	intersection()
		{
		scale([1.5,1,1]) translate([0,-panza,0]) difference()
			{
			cylinder(r=panza, h=panza*5/2,$fn=fn,center=true);
			cylinder(r=panza-th, h=panza*5/2+1,$fn=fn,center=true);
			}
		cube(panza*2,center=true);
		translate([panza/3,0,0]) scale([2,1,1]) rotate([90,0,0]) 
			cylinder(r=panza*1,h=panza*2,$fn=fn,center=true);
		}
	}