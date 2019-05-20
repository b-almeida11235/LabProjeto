
fprintf("Ola");

struct.f = [1, 0, 1, 0; 0, 1, 0, 1; 0, 0, 1, 0; 0, 0, 0, 1];
struct.x = [0.312242; 0.5803398; 0; 0];
struct.b = 1;
struct.u = 1;
struct.q = zeros(4);
struct.p = [1 0 0 0; 0 1 0 0; 0 0 1000 0; 0 0 0 1000];
struct.h = [1, 0, 0, 0; 0, 1, 0, 0];
struct.r = [0.0225, 0; 0, 0.0225];
struct.z = zeros(2, 1);


%z = predictKalman(struct);
zz = updateKalman(struct);