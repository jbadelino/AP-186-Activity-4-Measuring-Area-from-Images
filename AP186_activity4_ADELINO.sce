//rectangle = imread("C:\Users\Asus\Documents\Applied Physics 186\act 4\rectangle_1.bmp")
//rec_edge_canny = edge(rectangle, "canny");
//rec_edge_sobel = edge(rectangle, "sobel");
//rec_edge_prewitt = edge(rectangle, "prewitt");
//imwrite(rec_edge_sobel, "rec_sobel.png");
//imwrite(rec_edge_canny, "rec_canny.png");
//imwrite(rec_edge_prewitt, "rec_prewitt.png");

//square = imread("C:\Users\Asus\Documents\Applied Physics 186\act 4\square.bmp");
//sq_edge_canny = edge(square, "canny");
//sq_edge_sobel = edge(square, "sobel");
//sq_edge_prewitt = edge(square, "prewitt");
//imwrite(sq_edge_sobel, "sq_sobel.png");
//imwrite(sq_edge_canny, "sq_canny.png");
//imwrite(sq_edge_prewitt, "sq_prewitt.png");


//circle = imread("C:\Users\Asus\Documents\Applied Physics 186\act 4\circle_1.bmp");
//circ_edge_sobel = edge(circle, "sobel");
//circ_edge_canny = edge(circle, "canny");
//circ_edge_prewitt = edge(circle, "prewitt");
//imwrite(circ_edge_sobel, "circ_sobel.png");
//imwrite(circ_edge_canny, "circ_canny.png");
//imwrite(circ_edge_prewitt, "circ_prewitt.png");

//triangle = imread("C:\Users\Asus\Documents\Applied Physics 186\act 4\triangle.bmp");
//tri_edge_canny = edge(triangle, "canny");
//tri_edge_sobel = edge(triangle, "sobel");
//tri_edge_prewitt = edge(triangle, "prewitt");
//imwrite(tri_edge_sobel, "tri_sobel.png");
//imwrite(tri_edge_canny, "tri_canny.png");
//imwrite(tri_edge_prewitt, "tri_prewitt.png");

iesm = imread("C:\Users\Asus\Documents\Applied Physics 186\act 4\iesm_gray_1.bmp");
//iesm_edge_canny = edge(iesm, "canny");
//iesm_edge_sobel = edge(iesm, "sobel");
iesm_edge_prewitt = edge(iesm, "prewitt");
//imwrite(iesm_edge_sobel, "iesm_sobel.png");
//imwrite(iesm_edge_canny, "iesm_canny.png");
imwrite(iesm_edge_prewitt, "iesm_prewitt.png");

[len,wid]=size(iesm); //image dimensions
[x,y] = find(iesm_edge_prewitt); //finds the coordinates of the detected edges 

coords = []; // will contain the cartesian and polar corrdinates
N = length(x); //number of edge points

//polar and cartesian coordinates
for i=1:N
    xp=x(i)-wid/2;
    yp=y(i)-len/2;
    theta=atan(yp,xp);
    r=sqrt(xp^2+yp^2);
    coords=cat(dims=1,coords,[theta,r,xp,yp]);
end

[sorted,k]=gsort(coords,"lr", "i"); //sorts the edge points by increasing angle
xys=sorted(:,3:4); //sorted Cartesian coordinates

px_area =0; //total image area in unit pixels

//Green's theorem implementation
for i=1:N
    if i<N then 
        px_area=px_area+0.5*(xys(i,1)*xys(i+1,2)-xys(i+1,1)*xys(i,2));
    else 
        px_area=px_area+0.5*(xys(i,1)*xys(1,2)-xys(1,1)*xys(i,2));
    end
end

//displays the computed area 
disp(px_area)
