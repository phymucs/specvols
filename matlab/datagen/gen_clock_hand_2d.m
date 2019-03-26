function image = gen_clock_hand_2d(L, clock_hand_angle_rad)
    assert(mod(L,2) == 1);
    H = round((L-1)/2); % Half of the side length
    
    arrow_coords = [-0.05 0; -0.05 +0.8; +0.35 +0.4; +0.05 0.55; +0.05 0; -0.05 0];

    R = [cos(clock_hand_angle_rad) -sin(clock_hand_angle_rad);
        sin(clock_hand_angle_rad) cos(clock_hand_angle_rad)];
    rotated_arrow_coords = (R*(arrow_coords'))';
    image = poly2mask(rotated_arrow_coords(:,1)*H+H+1, ...
        rotated_arrow_coords(:,2)*(-H)+H+1, 2*H+1, 2*H+1);
end