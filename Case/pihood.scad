union() {
    //hood
    scale([1, 0.6, 1]) {
        difference() {
            import("pihood.stl");
            translate([0, 24, 0]) {
                cube([100, 100, 100], true);
            }
        }
    }

    //back
    translate([0, -9.6, 0]) {
        difference() {
            import("pihood.stl");
            translate([0, -80 + 24, 0]) {
                cube([100, 100, 100], true);
            }
        }
    }
}