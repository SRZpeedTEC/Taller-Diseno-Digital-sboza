/*
module adder (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [4:0] sum
);
    always_comb begin
        sum = a + b;
    end
endmodule
*/


module full_adder (
    // inputs
    input wire a,
    input wire b,
    input wire cin,

    // outputs
    output wire sum,
    output wire cout
);
    // internal wires
    wire xor_ab, carry1, carry2;

    // sum logic
    xor g1 (xor_ab, a, b);
    xor g2 (sum, xor_ab, cin);

    // carry logic
    and g3 (carry1, a, b);
    and g4 (carry2, xor_ab, cin);

    or g5 (cout, carry1, carry2);

endmodule

module adder (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [4:0] sum
);

    // Internal wires

    wire c1, c2, c3, c4;

    full_adder FA0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),
        .sum(sum[0]),
        .cout(c1)
    );

    full_adder FA1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    full_adder FA2 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    full_adder FA3 (
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(c4)
    );

    assign sum[4] = c4;

endmodule
    