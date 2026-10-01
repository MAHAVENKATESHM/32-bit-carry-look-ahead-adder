module cla32 (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire cin,
    output wire [31:0] sum,
    output wire cout
);

    wire [4:0] carry0;
    wire [4:0] carry1;
    wire [4:0] carry2;
    wire [4:0] carry3;
    wire [4:0] carry4;
    wire [4:0] carry5;
    wire [4:0] carry6;
    wire [4:0] carry7;

    wire [3:0] g0, p0;
    wire [3:0] g1, p1;
    wire [3:0] g2, p2;
    wire [3:0] g3, p3;
    wire [3:0] g4, p4;
    wire [3:0] g5, p5;
    wire [3:0] g6, p6;
    wire [3:0] g7, p7;

    wire blockg0, blockp0;
    wire blockg1, blockp1;
    wire blockg2, blockp2;
    wire blockg3, blockp3;
    wire blockg4, blockp4;
    wire blockg5, blockp5;
    wire blockg6, blockp6;
    wire blockg7, blockp7;

    // Carry between 4-bit CLA blocks
    assign carry0[0] = cin;

     | (blockp0 & carry0[0])assign carry0[4] = blockg0;
    assign carry1[0] = carry0[4];

    assign carry1[4] = blockg1 | (blockp1 & carry1[0]);
    assign carry2[0] = carry1[4];

    assign carry2[4] = blockg2 | (blockp2 & carry2[0]);
    assign carry3[0] = carry2[4];

    assign carry3[4] = blockg3 | (blockp3 & carry3[0]);
    assign carry4[0] = carry3[4];

    assign carry4[4] = blockg4 | (blockp4 & carry4[0]);
    assign carry5[0] = carry4[4];

    assign carry5[4] = blockg5 | (blockp5 & carry5[0]);
    assign carry6[0] = carry5[4];

    assign carry6[4] = blockg6 | (blockp6 & carry6[0]);
    assign carry7[0] = carry6[4];

    assign carry7[4] = blockg7 | (blockp7 & carry7[0]);
    assign cout = carry7[4];

    cla0 cla_0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(carry0[0]),
        .s(sum[3:0]),
        .carry(carry0),
        .g(g0),
        .p(p0),
        .blockg(blockg0),
        .blockp(blockp0)
    );

    cla0 cla_1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(carry1[0]),
        .s(sum[7:4]),
        .carry(carry1),
        .g(g1),
        .p(p1),
        .blockg(blockg1),
        .blockp(blockp1)
    );

    cla0 cla_2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(carry2[0]),
        .s(sum[11:8]),
        .carry(carry2),
        .g(g2),
        .p(p2),
        .blockg(blockg2),
        .blockp(blockp2)
    );

    cla0 cla_3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(carry3[0]),
        .s(sum[15:12]),
        .carry(carry3),
        .g(g3),
        .p(p3),
        .blockg(blockg3),
        .blockp(blockp3)
    );

    cla0 cla_4 (
        .a(a[19:16]),
        .b(b[19:16]),
        .cin(carry4[0]),
        .s(sum[19:16]),
        .carry(carry4),
        .g(g4),
        .p(p4),
        .blockg(blockg4),
        .blockp(blockp4)
    );

    cla0 cla_5 (
        .a(a[23:20]),
        .b(b[23:20]),
        .cin(carry5[0]),
        .s(sum[23:20]),
        .carry(carry5),
        .g(g5),
        .p(p5),
        .blockg(blockg5),
        .blockp(blockp5)
    );

    cla0 cla_6 (
        .a(a[27:24]),
        .b(b[27:24]),
        .cin(carry6[0]),
        .s(sum[27:24]),
        .carry(carry6),
        .g(g6),
        .p(p6),
        .blockg(blockg6),
        .blockp(blockp6)
    );

    cla0 cla_7 (
        .a(a[31:28]),
        .b(b[31:28]),
        .cin(carry7[0]),
        .s(sum[31:28]),
        .carry(carry7),
        .g(g7),
        .p(p7),
        .blockg(blockg7),
        .blockp(blockp7)
    );

endmodule