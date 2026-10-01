module cla0(
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire  cin,
    output reg  [3:0] s,
    output reg  [4:0] carry,
    output reg [3:0] g,
    output reg  [3:0] p,
    output reg blockg,blockp
);

always @(*) begin

    g = a & b;
    p = a ^ b;
    carry[0] = cin;

    carry[1] = g[0] | (p[0] & carry[0]);

    carry[2] = g[1] |
               (p[1] & g[0]) |
               (p[1] & p[0] & carry[0]);

    carry[3] = g[2] |
               (p[2] & g[1]) |
               (p[2] & p[1] & g[0]) |
               (p[2] & p[1] & p[0] & carry[0]);

    carry[4] = g[3] |
               (p[3] & g[2]) |
               (p[3] & p[2] & g[1]) |
               (p[3] & p[2] & p[1] & g[0]) |
               (p[3] & p[2] & p[1] & p[0] & carry[0]);

    blockp = p[3] & p[2] & p[1] & p[0];

    blockg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

    s[0] = p[0] ^ carry[0];
    s[1] = p[1] ^ carry[1];
    s[2] = p[2] ^ carry[2];
    s[3] = p[3] ^ carry[3];
end
S
endmodule