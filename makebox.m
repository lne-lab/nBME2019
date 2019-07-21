
%Make a box
function p=makebox(el_loc,n,grid)
p(1,:)=[el_loc(2)-10*n,el_loc(3)-10*n];
p(2,:)=[el_loc(2)-10*n,el_loc(3)+10*n];
p(3,:)=[el_loc(2)+10*n,el_loc(3)-10*n];
p(4,:)=[el_loc(2)+10*n,el_loc(3)+10*n];
p(5,:)=[el_loc(2),el_loc(3)+10*n];
p(6,:)=[el_loc(2),el_loc(3)-10*n];
p(7,:)=[el_loc(2)-10*n,el_loc(3)];
p(8,:)=[el_loc(2)+10*n,el_loc(3)];

end
