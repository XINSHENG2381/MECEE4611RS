clear
close all
clc

l1 = 110;
l2 = 153;
foot = 60;

% th1 = deg2rad(270);
% th2 = deg2rad(30);
th1 = deg2rad(linspace(275,245,20));
th2 = deg2rad(linspace(60,30,20));
Ax = l1*cos(th1);
Ay = l1*sin(th1);
Bx = l1*cos(th1) + l2*cos(th1 + th2);
By = l1*sin(th1) + l2*sin(th1 + th2);
f1x = l1*cos(th1) + l2*cos(th1 + th2) + foot/2*cos(th1+th2+pi/2);
f1y = l1*sin(th1) + l2*sin(th1 + th2) + foot/2*sin(th1+th2+pi/2);
f2x = l1*cos(th1) + l2*cos(th1 + th2) - foot/2*cos(th1+th2+pi/2);
f2y = l1*sin(th1) + l2*sin(th1 + th2) - foot/2*sin(th1+th2+pi/2);

% plot(0,0,'ko')
% hold on
% plot(Ax,Ay,'ko')
% line([0,Ax],[0,Ay],'Color','r')
% line([Ax,Bx],[Ay,By],'Color','b')
% line([Bx,f1x],[By,f1y],'Color','g')
% line([Bx,f2x],[By,f2y],'Color','g')
% axis equal

figure
for k = 1:length(th1)
    clf

    Ax = l1*cos(th1(k));
    Ay = l1*sin(th1(k));
    Bx = l1*cos(th1(k)) + l2*cos(th1(k) + th2(k));
    By = l1*sin(th1(k)) + l2*sin(th1(k) + th2(k));
    f1x = l1*cos(th1(k)) + l2*cos(th1(k) + th2(k)) + foot/2*cos(th1(k)+th2(k)+pi/2);
    f1y = l1*sin(th1(k)) + l2*sin(th1(k) + th2(k)) + foot/2*sin(th1(k)+th2(k)+pi/2);
    f2x = l1*cos(th1(k)) + l2*cos(th1(k) + th2(k)) + foot/2*cos(th1(k)+th2(k)-pi/2);
    f2y = l1*sin(th1(k)) + l2*sin(th1(k) + th2(k)) + foot/2*sin(th1(k)+th2(k)-pi/2);

    plot(0,0,'ko')
    hold on
    plot(Ax,Ay,'ko')
    line([0,Ax],[0,Ay],'Color','r')
    line([Ax,Bx],[Ay,By],'Color','b')
    line([Bx,f1x],[By,f1y],'Color','g')
    line([Bx,f2x],[By,f2y],'Color','g')

    title(['Single Leg Position at th1 = ' num2str(rad2deg(th1(k))) ' deg, and th2 = ' num2str(rad2deg(th2(k))) ' deg'])
    axis([-300,300,-300,300])

%     drawnow
    pause(0.2)
    movieVector(k) = getframe;

    
end

myWriter = VideoWriter('singleLegTrajectory','MPEG-4');
myWriter.FrameRate = 20;
open(myWriter);
writeVideo(myWriter,movieVector);
close(myWriter);