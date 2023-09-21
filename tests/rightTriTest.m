% test triangles
tri = [7 9];
triIsosceles = [4 4];

% preconditions. 3rd angle must be 90°
angles = rightTri(tri);
assert(angles(3) == 90,'Fundamental problem: rightTri not producing right triangle')

%% Test 1: sum of angles
% Must be 180°
angles = rightTri(tri);
assert(sum(angles) == 180)
 
angles = rightTri(triIsosceles);
assert(sum(angles) == 180)
 
%% Test 2: isosceles triangles
% Angles must be 45°
angles = rightTri(triIsosceles);
assert(angles(1) == 45)
assert(angles(1) == angles(2))
 