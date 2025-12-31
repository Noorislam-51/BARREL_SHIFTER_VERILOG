`timescale 1ns/1ps

module barrel_shifter_tb;

  reg  [7:0] IN;
  reg        dir;      // 0 = left shift, 1 = right shift
  reg  [2:0] shift;
  wire [7:0] OUT;

  // DUT instantiation
  barrel_shifter uut (
    .IN(IN),
    .OUT(OUT),
    .dir(dir),
    .shift(shift)
  );

  initial begin
    // Test 1: No shift (left)
    IN = 8'b10110011;
    dir = 0;
    shift = 3'd0;
    #10;

    // Test 2: No shift (right)
    dir = 1;
    shift = 3'd0;
    #10;

    // Test 3: Left shift by 3
    dir = 0;
    shift = 3'd3;
    #10;

    // Test 4: Left shift by 2
    dir = 0;
    shift = 3'd2;
    #10;

    // Test 5: Right shift by 3
    dir = 1;
    shift = 3'd3;
    #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | IN=%b | dir=%b | shift=%0d | OUT=%b",
              $time, IN, dir, shift, OUT);
  end

endmodule
