I2 = imread('C:\Users\Lenovo\Documents\NTU course materials\EEE\EE4266 Computer Vision\55.jpg');
imshow(I2);
hold on;
x = linspace(0,4000);
%y=(x*(-0.000034719400485)+8.617048971080235)/0.014157421191885;
y=(x*(-0.001216816153110)+13.091238633323350)/(0.004019499798252);
plot(x,y);