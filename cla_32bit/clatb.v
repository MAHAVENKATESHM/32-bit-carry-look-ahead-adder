`timescale 1ns/1ps

module clatb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // Outputs
    wire [3:0] s;
    wire [4:0] carry;
    wire [3:0] g;
    wire [3:0] p;
    wire blockg;
    wire blockp;

    // Instantiate the DUT (Device Under Test)
    cla0 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .carry(carry),
        .g(g),
        .p(p),
        .blockg(blockg),
        .blockp(blockp)
    );

    initial begin

        $display("---------------------------------------------------------------");
        $display(" Time   a     b   cin |  sum carry blockg blockp");
        $display("---------------------------------------------------------------");

        $monitor("%4t   %b  %b   %b   |  %b   %b     %b      %b",
                 $time, a, b, cin, s, carry[4], blockg, blockp);

        // Test 1
        a = 4'b0000;
        b = 4'b0000;
        cin = 0;
        #10;

        // Test 2
        a = 4'b0011;
        b = 4'b0101;
        cin = 0;
        #10;

        // Test 3
        a = 4'b0110;
        b = 4'b0011;
        cin = 1;
        #10;

        // Test 4
        a = 4'b1111;
        b = 4'b0001;
        cin = 0;
        #10;

        // Test 5
        a = 4'b1111;
        b = 4'b1111;
        cin = 0;
        #10;

        // Test 6
        a = 4'b1111;
        b = 4'b1111;
        cin = 1;
        #10;

        // Test 7
        a = 4'b1010;
        b = 4'b0101;
        cin = 0;
        #10;

        // Test 8
        a = 4'b1001;
        b = 4'b0111;
        cin = 1;
        #10;

        $finish;
    end

endmodule