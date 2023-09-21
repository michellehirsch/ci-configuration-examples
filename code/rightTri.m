function angles = rightTri(sides)
% rightTri Compute the angles of a right triangle
%
% angles = rightTri([side1 side2]) returns array angles containing the the
% three angles of right triangle with side lengths side1 and side2

A = atand(sides(1)/sides(2));
B = atand(sides(2)/sides(1));
hypotenuse = sides(1)/sind(A);
C = asind(hypotenuse*sind(A)/sides(1));

angles = [A B C];

end