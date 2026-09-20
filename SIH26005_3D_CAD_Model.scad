// SIH26005: 3D CAD Model for Solar-PCM Cold Storage
// 1 Metric Ton Capacity
// Units: Millimeters (mm)

// Variables
room_width = 2000;
room_length = 2000;
room_height = 2500;
puf_thickness = 120; // 120mm PUF Panels

// Colors
color_puf = [0.9, 0.9, 0.9, 0.8]; // Off-white, slightly transparent to see inside
color_solar = [0.1, 0.2, 0.5, 1]; // Dark Blue
color_pcm = [0.4, 0.7, 1.0, 1];   // Ice Blue
color_compressor = [0.3, 0.3, 0.3, 1]; // Dark Grey
color_door_handle = [0.8, 0.2, 0.2, 1]; // Red

module puf_room() {
    // Main outer body (transparent PUF)
    color(color_puf) {
        difference() {
            // Outer cube
            cube([room_width + (puf_thickness*2), room_length + (puf_thickness*2), room_height + (puf_thickness*2)]);

            // Inner hollow space
            translate([puf_thickness, puf_thickness, puf_thickness])
                cube([room_width, room_length, room_height]);

            // Door Cutout (Front Wall)
            translate([puf_thickness + 500, -10, puf_thickness])
                cube([1000, puf_thickness + 20, 2000]);
        }
    }
}

module insulated_door() {
    // The Door (shown slightly open for 3D effect)
    translate([puf_thickness + 500, puf_thickness, puf_thickness])
    rotate([0, 0, -30]) // 30 degrees open
    union() {
        color([0.85, 0.85, 0.85, 1])
        cube([1000, puf_thickness, 2000]); // Door Body

        // Door Handle
        color(color_door_handle)
        translate([850, -50, 1000])
        cube([50, 50, 200]);
    }
}

module pcm_flats() {
    // Ceiling Mounted PCM Battery (Stage 3)
    // Placed inside at the top
    color(color_pcm)
    translate([puf_thickness + 200, puf_thickness + 200, puf_thickness + room_height - 100])
    cube([room_width - 400, room_length - 400, 80]); // 80mm thick PCM layer
}

module solar_array() {
    // 3.5 kW Solar Array on top
    // Tilted for sun exposure
    color(color_solar)
    translate([-200, 0, room_height + (puf_thickness*2) + 200])
    rotate([15, 0, 0]) // 15 degree tilt
    cube([room_width + 400 + (puf_thickness*2), room_length + 200, 40]);

    // Solar mounting brackets
    color([0.5, 0.5, 0.5, 1])
    translate([puf_thickness, 100, room_height + (puf_thickness*2)])
    cube([50, 50, 300]);

    color([0.5, 0.5, 0.5, 1])
    translate([puf_thickness + room_width, 100, room_height + (puf_thickness*2)])
    cube([50, 50, 300]);
}

module external_compressor_unit() {
    // Stage 1 & 2: Compressor and Battery Unit
    // Mounted on the right side exterior
    color(color_compressor)
    translate([room_width + (puf_thickness*2) + 50, puf_thickness + 200, 0])
    cube([600, 1000, 1200]);

    // Fan grill detail on compressor
    color([0.1, 0.1, 0.1, 1])
    translate([room_width + (puf_thickness*2) + 650, puf_thickness + 400, 400])
    rotate([0, 90, 0])
    cylinder(h=10, r=300, $fn=50);
}

module internal_evaporator() {
    // Evaporator blowing cold air over PCM
    color([0.7, 0.7, 0.7, 1])
    translate([puf_thickness + 500, room_length - 100, room_height - 300])
    cube([1000, 300, 400]);
}

// Assemble the Final Model
puf_room();
insulated_door();
pcm_flats();
solar_array();
external_compressor_unit();
internal_evaporator();
