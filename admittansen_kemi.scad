width = 160;
big_gap = 36.6;
thickness = 30;
valley = 67;
thinnest = 8.2;
vally_width = 10.7;
valley_thick = 17;

module half()
{
translate([-width / 2,0,0]){
polygon([[0,0],
[0, valley_thick],
[(width - big_gap) / 2, thickness + valley_thick],
[(width - big_gap) / 2, valley_thick],
[(width - vally_width) / 2, valley_thick],
[(width - vally_width) / 2, thinnest],
[(width) / 2, thinnest],
[(width) / 2, 0]


]);
}
}


linear_extrude(30){
half();
mirror(){
   half(); 
}

}