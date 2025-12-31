module barrel_shifter(
  input [7:0]IN,
  output reg [7:0]OUT,
  input dir,//if 1 right shift //if 0 left shift
  input [2:0]shift //2^3=8
);
// shift 
// always @(*)begin
//   if(dir)
//     OUT  = IN>>shift;
//   else
//     OUT = IN<<shift;  
// end
// rotate
always @(*) begin
  if (dir)   // rotate right
    OUT = (IN >> shift) | (IN << (8 - shift));
  else       // rotate left
    OUT = (IN << shift) | (IN >> (8 - shift));
end
endmodule