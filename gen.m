clear
mona = imread('mona', 'jpg');

mona = double(mona);
mona = mona/255;

population = 5;

imgs = [[];[]];
err = zeros(1,population);

for each=1:population
    current_img = gen_img(mona);
    current_img = current_img.init_circles(20);
    current_img = current_img.render;
    [current_img, current_err] = current_img.calc_error(mona);
    imgs = [imgs [current_img; current_err]];
    disp(current_err);
    clear current_img;
    clear current_err;
end