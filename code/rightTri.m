function angles = rightTri(sides)
% rightTri Compute the angles of a right triangle
%
% ANGLES = rightTri(SIDES) returns array ANGLES containing the the
% three angles of a right triangle with side lengths SIDES. SIDES is a
% 2-element vector specifying the lengths of the two sides joined by the
% right angle. 
%
% Example:
%   angles = rightTri([10 10])


A = atand(sides(1)/sides(2));
B = atand(sides(2)/sides(1));
hypotenuse = sides(1)/sind(A);
C = asind(hypotenuse*sind(A)/sides(1));

angles = [A B C];

end