draw_self()

//draw_line(x, y, obj_fih_pole_tip.x, obj_fih_pole_tip.y)
if (instance_exists(obj_fih_pole_tip)) {
    var segments = 15; // More segments = smoother curve
    var start_x = obj_fih_pole_tip.x;
    var start_y = obj_fih_pole_tip.y;
    var end_x = x;
    var end_y = bbox_top;
    
    // Determine how much the line should sag at its lowest point
    var sag_amount = distance_to_object(obj_fih_pole_tip)/4;
    
    var last_x = start_x;
    var last_y = start_y;
    
    draw_set_color(c_white);
    
    for (var i = 1; i <= segments; i++) {
        // t goes from 0.0 to 1.0 as we loop across the line
        var t = i / segments; 
        
        // Linear interpolation for X and Y paths
        var current_x = lerp(start_x, end_x, t);
        var current_y = lerp(start_y, end_y, t);
        
        // Add a mathematical dip (parabola) to the Y coordinate
        // This peaks exactly in the middle (t = 0.5)
        current_y += sin(t * pi) * sag_amount;
        
        // Draw the segment from the last point to this new point
        draw_line_width(last_x, last_y, current_x, current_y, 1);
        
        // Save this point as the starting point for the next segment
        last_x = current_x;
        last_y = current_y;
    }
}