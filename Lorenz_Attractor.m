sigma = 10;
rho = 28;
beta = 8/3;

f = @(t,X) [
    sigma*(X(2)-X(1));
    X(1)*(rho-X(3))-X(2);
    X(1)*X(2)-beta*X(3)
];

[t,X] = ode45(f, [0 50], [1; 1; 1]);

speed = 0.000001;  % Seconds between updates
figure;
% plot3(X(:,1), X(:,2), X(:,3), 'b-');
hold on;
h = plot3(X(1,1), X(1,2), X(1,3), 'b-');
grid on;
view(3);
xlabel('x')
ylabel('y')
zlabel('z')
for k = 2:size(X,1)
    set(h, 'XData', X(1:k,1), ...
           'YData', X(1:k,2), ...
           'ZData', X(1:k,3));
    drawnow;
    pause(speed);
end