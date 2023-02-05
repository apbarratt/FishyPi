difference() {
    union() {
        translate([0, 0, 26]) {
            rotate([-90, 0, 0]) {
              import("piback.stl");
            }
        }
        
        //color("red")
        translate([38.5, -30.1, 0]) {
            scale([-1.8, 1.8, 1]) {
                linear_extrude(2) {
                    import("logo_outline.svg");
                }
            }
        }
        
        //translate([-38, -38, 0]) {
            //cube([76, 76, 2]);
        //}
    }


    translate([38.5, -30.1, -1]) {
        scale([-1.8, 1.8, 1]) {
            linear_extrude(4) {
                import("logo_cutouts.svg");
            }
        }
    }
}