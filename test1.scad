$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

width = 50;
height = 30;
depth = 50;
corner_radius = 5;
wall_thick = 4;
lidheight = 4;
wiggleroom = 0.4;
button_width = 17;
button_depth = 8.5;
r_audio = 3;
d_audio = 15;
button_offset = 10;
audio_offset = 0;


module round_thingy(width, height, depth, corner_radius)
{
    hull(){
        for(x=[-(width / 2 - corner_radius), width / 2 - corner_radius])
        {
            for(y=[-(depth / 2 - corner_radius), depth / 2 - corner_radius])
            {
                translate([x,y,0]) cylinder(r=corner_radius, h = height, center=true);
            }
        } 
    }
}

//Body
module body(width,height,depth,corner_radius)
{
    difference()
    {
        round_thingy(width, height, depth, corner_radius);
        translate([0,0,wall_thick]) round_thingy(width - wall_thick, height , depth- wall_thick, corner_radius);
    }
}

//body and holes
translate([0,0,height / 2]) difference(){
    body(width,height,depth,corner_radius);

    translate([0,button_offset,0])cube([button_width+wiggleroom,button_depth+wiggleroom,2 * height],center=true) ;
    rotate([90,0,0])translate([0,0,audio_offset])cylinder(r=r_audio+wiggleroom,h=width);
    rotate([90,0,0])translate([d_audio,0,audio_offset])cylinder(r=r_audio+wiggleroom,h=width);
    rotate([90,0,0])translate([-d_audio,0,audio_offset])cylinder(r=r_audio+wiggleroom,h=width);
}

//Lid
translate([width + 5,0,lidheight / 2])
{
    //Top of lid
    round_thingy(width=width, height=lidheight, depth = depth, corner_radius=corner_radius);

    //rim of lid
    translate([0,0,lidheight]) 
    difference()
    {
        round_thingy(width = width - wall_thick - wiggleroom, 
                     height = lidheight, 
                     depth = depth - wall_thick - wiggleroom, 
                     corner_radius = corner_radius - wall_thick / 2);
        translate([0,0,wall_thick]) round_thingy(width = width - 2 * wall_thick, 
                                                 height = height ,
                                                 depth = depth - 2 * wall_thick, 
                                                 corner_radius = corner_radius - wall_thick / 2);
    }
}




